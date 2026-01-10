/datum/job/ms13/goldman
	selection_color = "#644a3159"
	departments_list = list(
		/datum/job_department/goldman,
	)
	exp_granted_type = EXP_TYPE_GOLDMAN
	exp_required_type = EXP_TYPE_GOLDMAN
	forbid = "Hostility towards fellow Goldmen and protected individuals, as determined by Goldman leadership, is forbidden."
	enforce = "Listen to your superiors. Protect Carlin from outside forces as long you're paid. Seek out mercenary contracts from the highest bidder."

/datum/outfit/job/ms13/goldman
	name = "GoldmanDatums"
	jobtype = /datum/job/ms13/goldman

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/goldman/config_check()
	if(type == /datum/job/ms13/goldman)
		return FALSE
	return ..()

/datum/job/ms13/goldman/map_check()
	if(type == /datum/job/ms13/goldman)
		return FALSE
	return ..()
