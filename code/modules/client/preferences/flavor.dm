/datum/preference/text/flavor
	category = PREFERENCE_CATEGORY_FLAVOR_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	maximum_value_length = MAX_FLAVOR_LEN
	abstract_type = /datum/preference/text/flavor

/datum/preference/text/flavor/flavor_text
	savefile_key = "flavor_text"

/datum/preference/text/flavor/flavor_text/apply_to_human(mob/living/carbon/human/target, value)
	target.flavor_text = value

/datum/preference/text/flavor/flavor_text_nsfw
	savefile_key = "flavor_text_nsfw"

/datum/preference/text/flavor/flavor_text_nsfw/apply_to_human(mob/living/carbon/human/target, value)
	target.flavor_text_nsfw = value

/datum/preference/text/flavor/custom_species_name
	savefile_key = "custom_species_name"
	maximum_value_length = MAX_NAME_LEN

/datum/preference/text/flavor/custom_species_name/apply_to_human(mob/living/carbon/human/target, value)
	target.custom_species_name = value

/datum/preference/text/flavor/custom_species_lore
	savefile_key = "custom_species_lore"

/datum/preference/text/flavor/custom_species_lore/apply_to_human(mob/living/carbon/human/target, value)
	target.custom_species_lore = value

/datum/preference/text/flavor/ooc_notes
	savefile_key = "ooc_notes"

/datum/preference/text/flavor/ooc_notes/apply_to_human(mob/living/carbon/human/target, value)
	target.ooc_notes = value

/datum/preference/text/flavor/ooc_notes_nsfw
	savefile_key = "ooc_notes_nsfw"

/datum/preference/text/flavor/ooc_notes_nsfw/apply_to_human(mob/living/carbon/human/target, value)
	target.ooc_notes_nsfw = value

/datum/preference/text/flavor/headshot_url
	savefile_key = "headshot_url"
	var/static/link_regex = regex("i.gyazo.com|files.byondhome.com|images2.imgbox.com|files.catbox.moe")
	var/list/valid_extensions = list("jpg", "png", "jpeg")

/datum/preference/text/flavor/headshot_url/is_valid(value)
	if (!length(value))
		return TRUE

	var/find_index = findtext(value, "https://")
	if (find_index != 1)
		to_chat(usr, span_warning("Your link must be https!"))
		return FALSE

	var/sanity_check = findtext(value, ".")
	if (!sanity_check)
		to_chat(usr, span_warning("Your link doesn't appear to be valid!"))
		return FALSE

	var/list/value_split = splittext(value, ".")
	var/extension = value_split[length(value_split)]
	if (!(extension in valid_extensions))
		to_chat(usr, span_warning("The image must be one of the following extensions: '[english_list(valid_extensions)]'"))
		return FALSE

	find_index = findtext(value, link_regex)
	if(find_index != 9)
		to_chat(usr, span_warning("The image must be hosted on one of the following sites: 'Gyazo (i.gyazo.com), Byond (files.byondhome.com), Imgbox (images2.imgbox.com) or Catbox (files.catbox.moe)'"))
		return FALSE
 
	return TRUE

/datum/preference/text/flavor/headshot_url/apply_to_human(mob/living/carbon/human/target, value)
	target.headshot_url = value

