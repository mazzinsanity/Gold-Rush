/datum/preference/choiced/voice_type
	savefile_key = "voice_type"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Voice type"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS

/datum/preference/choiced/voice_type/init_possible_values()
	return GLOB.voice_type_list

/datum/preference/choiced/voice_type/apply_to_human(mob/living/carbon/human/target, value)
	target.voice_type = value
