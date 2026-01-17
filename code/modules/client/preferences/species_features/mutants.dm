/proc/generate_directional_shots(accessories, key, layer, direction, include_body = FALSE)
	var/list/values = possible_values_for_sprite_accessory_list(accessories)

	var/icon/body = icon('icons/mob/human_parts_greyscale.dmi', "human_head_m", direction)

	if(include_body)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_chest_m", direction), ICON_OVERLAY)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_arm", direction), ICON_OVERLAY)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_hand", direction), ICON_OVERLAY)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_arm", direction), ICON_OVERLAY)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_hand", direction), ICON_OVERLAY)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_leg", direction), ICON_OVERLAY)
		body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_leg", direction), ICON_OVERLAY)

	var/icon/eyes = icon('icons/mob/human_face.dmi', "eyes", direction)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	body.Blend(eyes, ICON_OVERLAY)

	for (var/name in values)
		var/datum/sprite_accessory/accessory = accessories[name]
		var/icon/final_icon = icon(body)

		if(accessory && accessory.icon_state != "none")
			var/icon/accessory_icon = icon(accessory.icon, "[key]_[accessory.icon_state]_[layer]", direction)
			accessory_icon.Blend(COLOR_RED, ICON_MULTIPLY)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

			if(accessory.icon_state_2)
				accessory_icon = icon(accessory.icon, "[key]_[accessory.icon_state_2]_[layer]", direction)
				accessory_icon.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
				final_icon.Blend(accessory_icon, ICON_OVERLAY)

			if(accessory.icon_state_3)
				accessory_icon = icon(accessory.icon, "[key]_[accessory.icon_state_3]_[layer]", direction)
				accessory_icon.Blend(COLOR_BLUE, ICON_MULTIPLY)
				final_icon.Blend(accessory_icon, ICON_OVERLAY)

		if(!include_body)
			final_icon.Crop(10, 20, 22, 32)

		final_icon.Scale(32, 32)

		values[name] = final_icon

	return values

/datum/preference/color/mutant_color
	savefile_key = "feature_mcolor"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_species_trait = MUTCOLORS

/datum/preference/color/mutant_color/create_default_value()
	return sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]")

/datum/preference/color/mutant_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mcolor"] = value

/datum/preference/color/mutant_color/is_valid(value)
	. = ..()
	if(is_color_dark(value))
		return FALSE

/datum/preference/choiced/legs
	savefile_key = "feature_legs"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "legs"

/datum/preference/choiced/legs/init_possible_values()
	return assoc_to_keys(GLOB.legs_list)

/datum/preference/choiced/legs/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["legs"] = value

/datum/preference/choiced/snout
	savefile_key = "feature_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "snout"

/datum/preference/choiced/snout/init_possible_values()
	return generate_directional_shots(GLOB.snouts_list, relevant_mutant_bodypart, "ADJ", WEST)

/datum/preference/choiced/snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout"] = value

/datum/preference/choiced/snout/create_default_value()
	return "None"

/datum/preference/choiced/snout/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_snout_color_list"

	return data

/datum/preference/tri_color/snout
	savefile_key = "feature_snout_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout_color_list"] = value

/datum/preference/choiced/horns
	savefile_key = "feature_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Horns"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "horns"

/datum/preference/choiced/horns/init_possible_values()
	return generate_directional_shots(GLOB.horns_list, relevant_mutant_bodypart, "ADJ", WEST)

/datum/preference/choiced/horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["horns"] = value

/datum/preference/choiced/horns/create_default_value()
	return "None"

/datum/preference/choiced/horns/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_horns_color_list"

	return data

/datum/preference/tri_color/horns
	savefile_key = "feature_horns_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["horns_color_list"] = value

/datum/preference/choiced/frills
	savefile_key = "feature_frills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Frills"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "frills"

/datum/preference/choiced/frills/init_possible_values()
	return generate_directional_shots(GLOB.frills_list, relevant_mutant_bodypart, "ADJ",  WEST)

/datum/preference/choiced/frills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["frills"] = value

/datum/preference/choiced/frills/create_default_value()
	return "None"

/datum/preference/choiced/frills/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_frills_color_list"

	return data

/datum/preference/tri_color/frills
	savefile_key = "feature_frills_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/frills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["frills_color_list"] = value

/datum/preference/choiced/ears
	savefile_key = "feature_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "ears"

/datum/preference/choiced/ears/init_possible_values()
	return generate_directional_shots(GLOB.ears_list, relevant_mutant_bodypart, "FRONT", SOUTH)

/datum/preference/choiced/ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears"] = value

/datum/preference/choiced/ears/create_default_value()
	return "None"

/datum/preference/choiced/ears/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_ears_color_list"

	return data

/datum/preference/tri_color/ears
	savefile_key = "feature_ears_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears_color_list"] = value

/datum/preference/choiced/antennae
	savefile_key = "feature_antennae"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Antennae"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "antennae"

/datum/preference/choiced/antennae/init_possible_values()
	return generate_directional_shots(GLOB.antennae_list, relevant_mutant_bodypart, "FRONT", SOUTH)

/datum/preference/choiced/antennae/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["antennae"] = value

/datum/preference/choiced/antennae/create_default_value()
	return "None"

/datum/preference/choiced/antennae/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_antennae_color_list"

	return data

/datum/preference/tri_color/antennae
	savefile_key = "feature_antennae_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/antennae/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["antennae_color_list"] = value

/datum/preference/choiced/mushcap
	savefile_key = "feature_mushcap"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Mushroom cap"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "mushcap"

/datum/preference/choiced/mushcap/init_possible_values()
	return generate_directional_shots(GLOB.mushcaps_list, relevant_mutant_bodypart, "ADJ", SOUTH)

/datum/preference/choiced/mushcap/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mushcap"] = value

/datum/preference/choiced/mushcap/create_default_value()
	return "None"

/datum/preference/choiced/mushcap/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_mushcap_color_list"

	return data

/datum/preference/tri_color/mushcap
	savefile_key = "feature_mushcap_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/mushcap/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mushcap_color_list"] = value

/datum/preference/choiced/spines
	savefile_key = "feature_spines"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	main_feature_name = "Spines"
	relevant_mutant_bodypart = "spines"

/datum/preference/choiced/spines/init_possible_values()
	return assoc_to_keys(GLOB.spines_list)

/datum/preference/choiced/spines/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["spines"] = value

/datum/preference/choiced/spines/create_default_value()
	return "None"

/datum/preference/tri_color/spines
	savefile_key = "feature_spines_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES

/datum/preference/tri_color/spines/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/spines) != "None"

/datum/preference/tri_color/spines/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["spines_color_list"] = value

/datum/preference/choiced/tail
	savefile_key = "feature_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Tail"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "tail"

/datum/preference/choiced/tail/init_possible_values()
	return generate_directional_shots(GLOB.tails_list, relevant_mutant_bodypart, "FRONT", NORTH, include_body = TRUE)

/datum/preference/choiced/tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail"] = value

/datum/preference/choiced/tail/create_default_value()
	return "None"

/datum/preference/choiced/tail/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_tail_color_list"

	return data

/datum/preference/tri_color/tail
	savefile_key = "feature_tail_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_color_list"] = value

/datum/preference/choiced/wings
	savefile_key = "feature_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Wings"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "wings"

/datum/preference/choiced/wings/init_possible_values()
	return generate_directional_shots(GLOB.wings_list, relevant_mutant_bodypart, "FRONT", NORTH, include_body = TRUE)

/datum/preference/choiced/wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["wings"] = value

/datum/preference/choiced/wings/create_default_value()
	return "None"

/datum/preference/choiced/wings/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_wings_color_list"

	return data

/datum/preference/tri_color/wings
	savefile_key = "feature_wings_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["wings_color_list"] = value
