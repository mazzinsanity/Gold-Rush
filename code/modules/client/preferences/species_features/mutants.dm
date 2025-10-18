/proc/generate_directional_shots(accessories, key, layer, direction)
	var/list/values = possible_values_for_sprite_accessory_list(accessories)

	var/icon/head_icon = icon('icons/mob/human_parts_greyscale.dmi', "human_head_m", direction)

	var/icon/eyes = icon('icons/mob/human_face.dmi', "eyes", direction)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	head_icon.Blend(eyes, ICON_OVERLAY)

	for (var/name in values)
		var/datum/sprite_accessory/accessory = accessories[name]
		if (accessory == null || accessory.icon_state == null)
			continue

		var/icon/final_icon = icon(head_icon)

		var/icon/accessory_icon = icon(accessory.icon, "[key]_[accessory.icon_state]_[layer]", direction)
		accessory_icon.Blend(COLOR_RED, ICON_MULTIPLY)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)

		if(accessory.icon_state_2)
			accessory_icon = icon(accessory.icon, "[key]_[accessory.icon_state_2]_[layer]", direction)
			accessory_icon.Blend(COLOR_GREEN, ICON_MULTIPLY)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		if(accessory.icon_state_3)
			accessory_icon = icon(accessory.icon, "[key]_[accessory.icon_state_3]_[layer]", direction)
			accessory_icon.Blend(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

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
	if (!..(value))
		return FALSE

	if (is_color_dark(value))
		return FALSE

	return TRUE

/datum/preference/choiced/frills
	savefile_key = "feature_frills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Frills"
	should_generate_icons = TRUE

/datum/preference/choiced/frills/init_possible_values()
	return generate_directional_shots(GLOB.frills_list, "frills", "ADJ",  WEST)

/datum/preference/choiced/frills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["frills"] = value

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
	target.update_body()

/datum/preference/choiced/horns
	savefile_key = "feature_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Horns"
	should_generate_icons = TRUE

/datum/preference/choiced/horns/init_possible_values()
	return generate_directional_shots(GLOB.horns_list, "horns", "ADJ", WEST)

/datum/preference/choiced/horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["horns"] = value

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

/datum/preference/choiced/snout/init_possible_values()
	return generate_directional_shots(GLOB.snouts_list, "snout", "ADJ", WEST)

/datum/preference/choiced/snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout"] = value

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
	var/icon/body = icon('icons/mob/human_parts_greyscale.dmi', "human_r_leg", NORTH)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_leg", NORTH), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_arm", NORTH), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_arm", NORTH), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_hand", NORTH), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_hand", NORTH), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_chest_m", NORTH), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_head_m", NORTH), ICON_OVERLAY)

	var/list/values = list()

	for (var/tail_name in GLOB.tails_list)
		var/datum/sprite_accessory/tail_accessory = GLOB.tails_list[tail_name]
		var/icon/icon_with_tail = new(body)

		if (tail_accessory.icon_state != "none")
			var/icon/tail_icon = icon(tail_accessory.icon, "tail_[tail_accessory.icon_state]_FRONT", NORTH)
			icon_with_tail.Blend(tail_icon, ICON_OVERLAY)

		icon_with_tail.Scale(32, 32)
		values[tail_name] = icon_with_tail

	return values

/datum/preference/choiced/tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail"] = value

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

/datum/preference/choiced/ears
	savefile_key = "feature_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "ears"

/datum/preference/choiced/ears/init_possible_values()
	return generate_directional_shots(GLOB.ears_list, "ears", "FRONT", SOUTH)

/datum/preference/choiced/ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears"] = value

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

/datum/preference/choiced/antennae/init_possible_values()
	return generate_directional_shots(GLOB.antennae_list, "antennae", "FRONT", SOUTH)

/datum/preference/choiced/antennae/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["antennae"] = value

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

/datum/preference/choiced/mushcap/init_possible_values()
	return generate_directional_shots(GLOB.mushcaps_list, "mushcap", "ADJ", SOUTH)

/datum/preference/choiced/mushcap/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mushcap"] = value

/datum/preference/choiced/antennae/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_mushcap_color_list"

	return data

/datum/preference/tri_color/mushcap
	savefile_key = "feature_mushcap_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/mushcap/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mushcap_color_list"] = value

/datum/preference/choiced/wings
	savefile_key = "feature_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Wings"
	should_generate_icons = TRUE

/datum/preference/choiced/wings/init_possible_values()
	var/list/icon/values = possible_values_for_sprite_accessory_list_for_body_part(
		GLOB.wings_list,
		"wings",
		list("BEHIND", "FRONT"),
	)

	return values

/datum/preference/choiced/wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["wings"] = value

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

/datum/preference/choiced/moth_wings
	savefile_key = "feature_moth_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Moth wings"
	should_generate_icons = TRUE

/datum/preference/choiced/moth_wings/init_possible_values()
	var/list/icon/values = possible_values_for_sprite_accessory_list_for_body_part(
		GLOB.moth_wings_list,
		"moth_wings",
		list("BEHIND", "FRONT"),
	)

	// Moth wings are in a stupid dimension
	for (var/name in values)
		values[name].Crop(1, 1, 32, 32)

	return values

/datum/preference/choiced/moth_wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["moth_wings"] = value

/datum/preference/choiced/moth_wings/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "feature_moth_wings_color_list"

	return data

/datum/preference/tri_color/moth_wings
	savefile_key = "feature_moth_wings_color_list"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/moth_wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["wings_color_list"] = value
