/proc/generate_directional_shots(list/sprite_accessories, key, direction, layer)
	var/list/values = list()

	var/icon/head = icon('icons/mob/human_parts_greyscale.dmi', "human_head_m", direction)

	var/icon/eyes = icon('icons/mob/human_face.dmi', "eyes", direction)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	head.Blend(eyes, ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(head)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_[layer]", direction)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(10, 19, 22, 31)
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

/datum/preference/choiced/markings
	savefile_key = "feature_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Markings"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "markings"

/datum/preference/choiced/markings/init_possible_values()
	var/list/values = list()

	var/icon/body = icon('icons/blanks/32x32.dmi', "nothing")

	var/list/body_parts = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
	)

	for (var/body_part in body_parts)
		body.Blend(icon('icons/mob/human_parts.dmi', "human_[body_part]_m"), ICON_OVERLAY)

	for (var/markings_name in GLOB.markings_list)
		var/datum/sprite_accessory/markings = GLOB.markings_list[markings_name]
		var/icon/icon_with_markings = new(body)

		if (markings.icon_state != "none")
			for (var/body_part in body_parts)
				var/icon/body_part_icon = icon(markings.icon, "[markings.icon_state]_[body_part]")
				body_part_icon.Crop(1, 1, 32, 32)
				icon_with_markings.Blend(body_part_icon, ICON_OVERLAY)

		// Zoom in on the top of the head and the chest
		icon_with_markings.Scale(64, 64)
		icon_with_markings.Crop(15, 64, 15 + 31, 64 - 31)

		values[markings.name] = icon_with_markings

	return values

/datum/preference/choiced/markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["markings"] = value

/datum/preference/choiced/frills
	savefile_key = "feature_frills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Frills"
	should_generate_icons = TRUE

/datum/preference/choiced/frills/init_possible_values()
	return generate_directional_shots(GLOB.frills_list, "frills", WEST, "ADJ")

/datum/preference/choiced/frills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["frills"] = value

/datum/preference/choiced/horns
	savefile_key = "feature_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Horns"
	should_generate_icons = TRUE

/datum/preference/choiced/horns/init_possible_values()
	return generate_directional_shots(GLOB.horns_list, "horns", WEST, "ADJ")

/datum/preference/choiced/horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["horns"] = value

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
	return generate_directional_shots(GLOB.snouts_list, "snout", WEST, "ADJ")

/datum/preference/choiced/snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout"] = value

/datum/preference/choiced/spines
	savefile_key = "feature_spines"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Spines"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "spines"

/datum/preference/choiced/spines/init_possible_values()
	var/icon/body = icon('icons/mob/human_parts_greyscale.dmi', "human_r_leg", WEST)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_leg", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_arm", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_arm", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_r_hand", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_l_hand", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_chest_m", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/human_parts_greyscale.dmi', "human_head_m", WEST), ICON_OVERLAY)
	body.Blend(icon('icons/mob/mutant_bodyparts.dmi', "m_tail_smooth_BEHIND", WEST), ICON_OVERLAY)

	var/list/values = list()

	for (var/spines_name in GLOB.spines_list)
		var/datum/sprite_accessory/spines_accessory = GLOB.spines_list[spines_name]
		var/icon/icon_with_spines = new(body)

		if (spines_accessory.icon_state != "none")
			var/icon/spines_icon = icon(spines_accessory.icon, "m_spines_[spines_accessory.icon_state]_ADJ", WEST)
			icon_with_spines.Blend(spines_icon, ICON_OVERLAY)

		icon_with_spines.Scale(32, 32)
		values[spines_name] = icon_with_spines

	return values

/datum/preference/choiced/spines/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["spines"] = value

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
			var/icon/tail_icon = icon(tail_accessory.icon, "m_tail_[tail_accessory.icon_state]_FRONT", NORTH)
			icon_with_tail.Blend(tail_icon, ICON_OVERLAY)

		icon_with_tail.Scale(32, 32)
		values[tail_name] = icon_with_tail

	return values

/datum/preference/choiced/tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail"] = value

/datum/preference/choiced/ears
	savefile_key = "feature_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "ears"

/datum/preference/choiced/ears/init_possible_values()
	return generate_directional_shots(GLOB.ears_list, "ears", SOUTH, "FRONT")

/datum/preference/choiced/ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears"] = value

/datum/preference/choiced/antennae
	savefile_key = "feature_antennae"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Antennae"
	should_generate_icons = TRUE

/datum/preference/choiced/antennae/init_possible_values()
	return generate_directional_shots(GLOB.antennae_list, "antennae", SOUTH, "FRONT")

/datum/preference/choiced/antennae/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["antennae"] = value

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

