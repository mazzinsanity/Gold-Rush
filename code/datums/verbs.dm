/datum/verbs
	var/name
	var/list/children
	var/datum/verbs/parent
	var/list/verblist
	var/abstract = FALSE

//returns the master list for verbs of a type
/datum/verbs/proc/GetList()
	CRASH("Abstract verblist for [type]")

//do things for each entry in Generate_list
//return value sets Generate_list[verbpath]
/datum/verbs/proc/HandleVerb(list/entry, procpath/verbpath, ...)
	return entry

/datum/verbs/New()
	var/mainlist = GetList()
	var/ourentry = mainlist[type]
	children = list()
	verblist = list()
	if (ourentry)
		if (!islist(ourentry)) //some of our childern already loaded
			qdel(src)
			CRASH("Verb double load: [type]")
		Add_children(ourentry)

	mainlist[type] = src

	Load_verbs(type, typesof("[type]/verb"))

	var/datum/verbs/parent = mainlist[parent_type]
	if (!parent)
		mainlist[parent_type] = list(src)
	else if (islist(parent))
		parent += src
	else
		parent.Add_children(list(src))

/datum/verbs/proc/Set_parent(datum/verbs/_parent)
	parent = _parent
	if (abstract)
		parent.Add_children(children)
		var/list/verblistoftypes = list()
		for(var/thing in verblist)
			LAZYADD(verblistoftypes[verblist[thing]], thing)

		for(var/verbparenttype in verblistoftypes)
			parent.Load_verbs(verbparenttype, verblistoftypes[verbparenttype])

/datum/verbs/proc/Add_children(list/kids)
	if (abstract && parent)
		parent.Add_children(kids)
		return

	for(var/thing in kids)
		var/datum/verbs/item = thing
		item.Set_parent(src)
		if (!item.abstract)
			children += item

/datum/verbs/proc/Load_verbs(verb_parent_type, list/verbs)
	if (abstract && parent)
		parent.Load_verbs(verb_parent_type, verbs)
		return

	for (var/verbpath in verbs)
		verblist[verbpath] = verb_parent_type

/datum/verbs/proc/Generate_list(...)
	. = list()
	if (length(children))
		for (var/thing in children)
			var/datum/verbs/child = thing
			var/list/childlist = child.Generate_list(arglist(args))
			if (childlist)
				var/childname = "[child]"
				if (childname == "[child.type]")
					var/list/tree = splittext(childname, "/")
					childname = tree[tree.len]
				.[child.type] = "parent=[url_encode("[type]")];name=[childname]"
				. += childlist

	for (var/thing in verblist)
		var/procpath/verbpath = thing
		if (!verbpath)
			stack_trace("Bad VERB in [type] verblist: [english_list(verblist)]")
		var/list/entry = list()
		entry["parent"] = "[type]"
		entry["name"] = verbpath.desc
		if (verbpath.name[1] == "@")
			entry["command"] = copytext(verbpath.name, length(verbpath.name[1]) + 1)
		else
			entry["command"] = replacetext(verbpath.name, " ", "-")

		.[verbpath] = HandleVerb(arglist(list(entry, verbpath) + args))

/world/proc/LoadVerbs(verb_type)
	if(!ispath(verb_type, /datum/verbs) || verb_type == /datum/verbs)
		CRASH("Invalid verb_type: [verb_type]")
	for (var/typepath in subtypesof(verb_type))
		new typepath()

/** Get all hearers in range, ignores walls and such. Code stolen from `/proc/get_hearers_in_view()`
 * Much faster and less expensive than range()
*/
/proc/get_hearers_in_looc_range(atom/source, range_radius = LOOC_RANGE)
	var/turf/center_turf = get_turf(source)
	if(!center_turf)
		return

	. = list()
	var/old_luminosity = center_turf.luminosity
	if(range_radius <= 0) //special case for if only source cares
		for(var/atom/movable/target as anything in center_turf)
			var/list/recursive_contents = target.important_recursive_contents?[RECURSIVE_CONTENTS_HEARING_SENSITIVE]
			if(recursive_contents)
				. += recursive_contents
		return .

	var/list/hearables_from_grid = SSspatial_grid.orthogonal_range_search(source, RECURSIVE_CONTENTS_HEARING_SENSITIVE, range_radius)

	if(!length(hearables_from_grid))//we know that something is returned by the grid, but we dont know if we need to actually filter down the output
		return .

	var/list/assigned_oranges_ears = SSspatial_grid.assign_oranges_ears(hearables_from_grid)

	for(var/mob/oranges_ear/ear in range(range_radius, center_turf))
		. += ear.references

	for(var/mob/oranges_ear/remaining_ear as anything in assigned_oranges_ears) //we need to clean up our mess
		remaining_ear.unassign()

	center_turf.luminosity = old_luminosity
	return .
