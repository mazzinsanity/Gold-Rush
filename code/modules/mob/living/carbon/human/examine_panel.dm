/datum/examine_panel
	/// Human that the examine panel is showing.
	var/mob/living/carbon/human/examined

/datum/examine_panel/New(mob/living/carbon/human/human)
	if(human)
		examined = human

/datum/examine_panel/Destroy(force)
	examined = null
	return ..()

/datum/examine_panel/ui_state(mob/user)
	return GLOB.always_state

/datum/examine_panel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ExaminePanel")
		ui.open()

/datum/examine_panel/ui_data(mob/user)
	var/list/data = list()
	var/obscured = (!isobserver(user) && (examined.wear_mask?.flags_inv & HIDEFACE || examined.head?.flags_inv & HIDEFACE))

	data["name"] = obscured ? examined.name : examined.real_name
	data["flavor_text"] = obscured ? "Obscured" : examined.flavor_text
	data["flavor_text_nsfw"] = obscured ? "Obscured" : examined.flavor_text_nsfw
	if(examined.custom_species_name)
		data["custom_species_name"] = examined.custom_species_name
	else
		data["custom_species_name"] = examined.dna.species.name
	if(examined.custom_species_lore)
		data["custom_species_lore"] = examined.custom_species_lore
	else
		data["custom_species_lore"] = "Just a normal wastelander, nothing special about them."
	data["ooc_notes"] = examined.ooc_notes
	data["ooc_notes_nsfw"] = examined.ooc_notes_nsfw
	if(obscured || !examined.headshot_url)
		data["headshot_url"] = "headshot_generic.png"
	else
		data["headshot_url"] = examined.headshot_url

	return data

/datum/examine_panel/ui_close()
	qdel(src)

/datum/examine_panel/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/simple/headshot),
	)
