/datum/preference/choiced/markings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	relevant_species_trait = MARKINGS
	abstract_type = /datum/preference/choiced/markings
	var/markings_type
	var/markings_slot

/datum/preference/choiced/markings/init_possible_values()
    switch(markings_type)
        if("head")
            return assoc_to_keys(GLOB.head_markings_list)
        if("chest")
            return assoc_to_keys(GLOB.chest_markings_list)
        if("left_arm")
            return assoc_to_keys(GLOB.left_arm_markings_list)
        if("left_hand")
            return assoc_to_keys(GLOB.left_hand_markings_list)
        if("right_arm")
            return assoc_to_keys(GLOB.right_arm_markings_list)
        if("right_hand")
            return assoc_to_keys(GLOB.right_hand_markings_list)
        if("left_leg")
            return assoc_to_keys(GLOB.left_leg_markings_list)
        if("left_foot")
            return assoc_to_keys(GLOB.left_foot_markings_list)
        if("right_leg")
            return assoc_to_keys(GLOB.right_leg_markings_list)
        if("right_foot")
            return assoc_to_keys(GLOB.right_foot_markings_list)

/datum/preference/choiced/markings/create_default_value()
	return "None"

/datum/preference/choiced/markings/apply_to_human(mob/living/carbon/human/target, value)
	var/markings_list_feature = "[markings_type]_markings_list"
	if(!target.dna.features[markings_list_feature])
		var/list/new_list = list()
		LAZYSETLEN(new_list, 3)
		target.dna.features[markings_list_feature] = new_list

	target.dna.features[markings_list_feature][markings_slot] = value

/datum/preference/tri_color/markings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	relevant_species_trait = MARKINGS
	abstract_type = /datum/preference/tri_color/markings
	var/markings_type
	var/markings_slot

/datum/preference/tri_color/markings/apply_to_human(mob/living/carbon/human/target, value)
	var/markings_list_feature = "[markings_type]_markings_[markings_slot]_color_list"
	target.dna.features[markings_list_feature] = value

/datum/preference/choiced/markings/head_markings_1
	savefile_key = "feature_head_markings_1"
	markings_type = "head"
	markings_slot = 1

/datum/preference/tri_color/markings/head_markings_1
	savefile_key = "feature_head_markings_1_color_list"
	markings_type = "head"
	markings_slot = 1

/datum/preference/tri_color/markings/head_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/head_markings_1) != "None"

/datum/preference/choiced/markings/head_markings_2
	savefile_key = "feature_head_markings_2"
	markings_type = "head"
	markings_slot = 2

/datum/preference/choiced/markings/head_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/head_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/head_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/head_markings_3) != "None"

/datum/preference/tri_color/markings/head_markings_2
	savefile_key = "feature_head_markings_2_color_list"
	markings_type = "head"
	markings_slot = 2

/datum/preference/tri_color/markings/head_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/head_markings_2) != "None"

/datum/preference/choiced/markings/head_markings_3
	savefile_key = "feature_head_markings_3"
	markings_type = "head"
	markings_slot = 3

/datum/preference/choiced/markings/head_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/head_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/head_markings_3) != "None"

/datum/preference/tri_color/markings/head_markings_3
	savefile_key = "feature_head_markings_3_color_list"
	markings_type = "head"
	markings_slot = 3

/datum/preference/tri_color/markings/head_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/head_markings_3) != "None"

/datum/preference/choiced/markings/chest_markings_1
	savefile_key = "feature_chest_markings_1"
	markings_type = "chest"
	markings_slot = 1

/datum/preference/tri_color/markings/chest_markings_1
	savefile_key = "feature_chest_markings_1_color_list"
	markings_type = "chest"
	markings_slot = 1

/datum/preference/tri_color/markings/chest_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/chest_markings_1) != "None"

/datum/preference/choiced/markings/chest_markings_2
	savefile_key = "feature_chest_markings_2"
	markings_type = "chest"
	markings_slot = 2

/datum/preference/choiced/markings/chest_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/chest_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/chest_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/chest_markings_3) != "None"

/datum/preference/tri_color/markings/chest_markings_2
	savefile_key = "feature_chest_markings_2_color_list"
	markings_type = "chest"
	markings_slot = 2

/datum/preference/tri_color/markings/chest_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/chest_markings_2) != "None"

/datum/preference/choiced/markings/chest_markings_3
	savefile_key = "feature_chest_markings_3"
	markings_type = "chest"
	markings_slot = 3

/datum/preference/choiced/markings/chest_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/chest_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/chest_markings_3) != "None"

/datum/preference/tri_color/markings/chest_markings_3
	savefile_key = "feature_chest_markings_3_color_list"
	markings_type = "chest"
	markings_slot = 3

/datum/preference/tri_color/markings/chest_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/chest_markings_3) != "None"

/datum/preference/choiced/markings/left_arm_markings_1
	savefile_key = "feature_left_arm_markings_1"
	markings_type = "left_arm"
	markings_slot = 1

/datum/preference/tri_color/markings/left_arm_markings_1
	savefile_key = "feature_left_arm_markings_1_color_list"
	markings_type = "left_arm"
	markings_slot = 1

/datum/preference/tri_color/markings/left_arm_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_1) != "None"

/datum/preference/choiced/markings/left_arm_markings_2
	savefile_key = "feature_left_arm_markings_2"
	markings_type = "left_arm"
	markings_slot = 2

/datum/preference/choiced/markings/left_arm_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_3) != "None"

/datum/preference/tri_color/markings/left_arm_markings_2
	savefile_key = "feature_left_arm_markings_2_color_list"
	markings_type = "left_arm"
	markings_slot = 2

/datum/preference/tri_color/markings/left_arm_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_2) != "None"

/datum/preference/choiced/markings/left_arm_markings_3
	savefile_key = "feature_left_arm_markings_3"
	markings_type = "left_arm"
	markings_slot = 3

/datum/preference/choiced/markings/left_arm_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_3) != "None"

/datum/preference/tri_color/markings/left_arm_markings_3
	savefile_key = "feature_left_arm_markings_3_color_list"
	markings_type = "left_arm"
	markings_slot = 3

/datum/preference/tri_color/markings/left_arm_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_arm_markings_3) != "None"

/datum/preference/choiced/markings/left_hand_markings_1
	savefile_key = "feature_left_hand_markings_1"
	markings_type = "left_hand"
	markings_slot = 1

/datum/preference/tri_color/markings/left_hand_markings_1
	savefile_key = "feature_left_hand_markings_1_color_list"
	markings_type = "left_hand"
	markings_slot = 1

/datum/preference/tri_color/markings/left_hand_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_1) != "None"

/datum/preference/choiced/markings/left_hand_markings_2
	savefile_key = "feature_left_hand_markings_2"
	markings_type = "left_hand"
	markings_slot = 2

/datum/preference/choiced/markings/left_hand_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_3) != "None"

/datum/preference/tri_color/markings/left_hand_markings_2
	savefile_key = "feature_left_hand_markings_2_color_list"
	markings_type = "left_hand"
	markings_slot = 2

/datum/preference/tri_color/markings/left_hand_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_2) != "None"

/datum/preference/choiced/markings/left_hand_markings_3
	savefile_key = "feature_left_hand_markings_3"
	markings_type = "left_hand"
	markings_slot = 3

/datum/preference/choiced/markings/left_hand_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_3) != "None"

/datum/preference/tri_color/markings/left_hand_markings_3
	savefile_key = "feature_left_hand_markings_3_color_list"
	markings_type = "left_hand"
	markings_slot = 3

/datum/preference/tri_color/markings/left_hand_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_hand_markings_3) != "None"

/datum/preference/choiced/markings/right_arm_markings_1
	savefile_key = "feature_right_arm_markings_1"
	markings_type = "right_arm"
	markings_slot = 1

/datum/preference/tri_color/markings/right_arm_markings_1
	savefile_key = "feature_right_arm_markings_1_color_list"
	markings_type = "right_arm"
	markings_slot = 1

/datum/preference/tri_color/markings/right_arm_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_1) != "None"

/datum/preference/choiced/markings/right_arm_markings_2
	savefile_key = "feature_right_arm_markings_2"
	markings_type = "right_arm"
	markings_slot = 2

/datum/preference/choiced/markings/right_arm_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_3) != "None"

/datum/preference/tri_color/markings/right_arm_markings_2
	savefile_key = "feature_right_arm_markings_2_color_list"
	markings_type = "right_arm"
	markings_slot = 2

/datum/preference/tri_color/markings/right_arm_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_2) != "None"

/datum/preference/choiced/markings/right_arm_markings_3
	savefile_key = "feature_right_arm_markings_3"
	markings_type = "right_arm"
	markings_slot = 3

/datum/preference/choiced/markings/right_arm_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_3) != "None"

/datum/preference/tri_color/markings/right_arm_markings_3
	savefile_key = "feature_right_arm_markings_3_color_list"
	markings_type = "right_arm"
	markings_slot = 3

/datum/preference/tri_color/markings/right_arm_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_arm_markings_3) != "None"

/datum/preference/choiced/markings/right_hand_markings_1
	savefile_key = "feature_right_hand_markings_1"
	markings_type = "right_hand"
	markings_slot = 1

/datum/preference/tri_color/markings/right_hand_markings_1
	savefile_key = "feature_right_hand_markings_1_color_list"
	markings_type = "right_hand"
	markings_slot = 1

/datum/preference/tri_color/markings/right_hand_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_1) != "None"

/datum/preference/choiced/markings/right_hand_markings_2
	savefile_key = "feature_right_hand_markings_2"
	markings_type = "right_hand"
	markings_slot = 2

/datum/preference/choiced/markings/right_hand_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_3) != "None"

/datum/preference/tri_color/markings/right_hand_markings_2
	savefile_key = "feature_right_hand_markings_2_color_list"
	markings_type = "right_hand"
	markings_slot = 2

/datum/preference/tri_color/markings/right_hand_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_2) != "None"

/datum/preference/choiced/markings/right_hand_markings_3
	savefile_key = "feature_right_hand_markings_3"
	markings_type = "right_hand"
	markings_slot = 3

/datum/preference/choiced/markings/right_hand_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_3) != "None"

/datum/preference/tri_color/markings/right_hand_markings_3
	savefile_key = "feature_right_hand_markings_3_color_list"
	markings_type = "right_hand"
	markings_slot = 3

/datum/preference/tri_color/markings/right_hand_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_hand_markings_3) != "None"

/datum/preference/choiced/markings/left_leg_markings_1
	savefile_key = "feature_left_leg_markings_1"
	markings_type = "left_leg"
	markings_slot = 1

/datum/preference/tri_color/markings/left_leg_markings_1
	savefile_key = "feature_left_leg_markings_1_color_list"
	markings_type = "left_leg"
	markings_slot = 1

/datum/preference/tri_color/markings/left_leg_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_1) != "None"

/datum/preference/choiced/markings/left_leg_markings_2
	savefile_key = "feature_left_leg_markings_2"
	markings_type = "left_leg"
	markings_slot = 2

/datum/preference/choiced/markings/left_leg_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_3) != "None"

/datum/preference/tri_color/markings/left_leg_markings_2
	savefile_key = "feature_left_leg_markings_2_color_list"
	markings_type = "left_leg"
	markings_slot = 2

/datum/preference/tri_color/markings/left_leg_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_2) != "None"

/datum/preference/choiced/markings/left_leg_markings_3
	savefile_key = "feature_left_leg_markings_3"
	markings_type = "left_leg"
	markings_slot = 3

/datum/preference/choiced/markings/left_leg_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_3) != "None"

/datum/preference/tri_color/markings/left_leg_markings_3
	savefile_key = "feature_left_leg_markings_3_color_list"
	markings_type = "left_leg"
	markings_slot = 3

/datum/preference/tri_color/markings/left_leg_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_leg_markings_3) != "None"

/datum/preference/choiced/markings/left_foot_markings_1
	savefile_key = "feature_left_foot_markings_1"
	markings_type = "left_foot"
	markings_slot = 1

/datum/preference/tri_color/markings/left_foot_markings_1
	savefile_key = "feature_left_foot_markings_1_color_list"
	markings_type = "left_foot"
	markings_slot = 1

/datum/preference/tri_color/markings/left_foot_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_1) != "None"

/datum/preference/choiced/markings/left_foot_markings_2
	savefile_key = "feature_left_foot_markings_2"
	markings_type = "left_foot"
	markings_slot = 2

/datum/preference/choiced/markings/left_foot_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_3) != "None"

/datum/preference/tri_color/markings/left_foot_markings_2
	savefile_key = "feature_left_foot_markings_2_color_list"
	markings_type = "left_foot"
	markings_slot = 2

/datum/preference/tri_color/markings/left_foot_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_2) != "None"

/datum/preference/choiced/markings/left_foot_markings_3
	savefile_key = "feature_left_foot_markings_3"
	markings_type = "left_foot"
	markings_slot = 3

/datum/preference/choiced/markings/left_foot_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_3) != "None"

/datum/preference/tri_color/markings/left_foot_markings_3
	savefile_key = "feature_left_foot_markings_3_color_list"
	markings_type = "left_foot"
	markings_slot = 3

/datum/preference/tri_color/markings/left_foot_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/left_foot_markings_3) != "None"

/datum/preference/choiced/markings/right_leg_markings_1
	savefile_key = "feature_right_leg_markings_1"
	markings_type = "right_leg"
	markings_slot = 1

/datum/preference/tri_color/markings/right_leg_markings_1
	savefile_key = "feature_right_leg_markings_1_color_list"
	markings_type = "right_leg"
	markings_slot = 1

/datum/preference/tri_color/markings/right_leg_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_1) != "None"

/datum/preference/choiced/markings/right_leg_markings_2
	savefile_key = "feature_right_leg_markings_2"
	markings_type = "right_leg"
	markings_slot = 2

/datum/preference/choiced/markings/right_leg_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_3) != "None"

/datum/preference/tri_color/markings/right_leg_markings_2
	savefile_key = "feature_right_leg_markings_2_color_list"
	markings_type = "right_leg"
	markings_slot = 2

/datum/preference/tri_color/markings/right_leg_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_2) != "None"

/datum/preference/choiced/markings/right_leg_markings_3
	savefile_key = "feature_right_leg_markings_3"
	markings_type = "right_leg"
	markings_slot = 3

/datum/preference/choiced/markings/right_leg_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_3) != "None"

/datum/preference/tri_color/markings/right_leg_markings_3
	savefile_key = "feature_right_leg_markings_3_color_list"
	markings_type = "right_leg"
	markings_slot = 3

/datum/preference/tri_color/markings/right_leg_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_leg_markings_3) != "None"

/datum/preference/choiced/markings/right_foot_markings_1
	savefile_key = "feature_right_foot_markings_1"
	markings_type = "right_foot"
	markings_slot = 1

/datum/preference/tri_color/markings/right_foot_markings_1
	savefile_key = "feature_right_foot_markings_1_color_list"
	markings_type = "right_foot"
	markings_slot = 1

/datum/preference/tri_color/markings/right_foot_markings_1/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_1) != "None"

/datum/preference/choiced/markings/right_foot_markings_2
	savefile_key = "feature_right_foot_markings_2"
	markings_type = "right_foot"
	markings_slot = 2

/datum/preference/choiced/markings/right_foot_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_1) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_3) != "None"

/datum/preference/tri_color/markings/right_foot_markings_2
	savefile_key = "feature_right_foot_markings_2_color_list"
	markings_type = "right_foot"
	markings_slot = 2

/datum/preference/tri_color/markings/right_foot_markings_2/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_2) != "None"

/datum/preference/choiced/markings/right_foot_markings_3
	savefile_key = "feature_right_foot_markings_3"
	markings_type = "right_foot"
	markings_slot = 3

/datum/preference/choiced/markings/right_foot_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_2) != "None" || preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_3) != "None"

/datum/preference/tri_color/markings/right_foot_markings_3
	savefile_key = "feature_right_foot_markings_3_color_list"
	markings_type = "right_foot"
	markings_slot = 3

/datum/preference/tri_color/markings/right_foot_markings_3/is_accessible(datum/preferences/preferences)
	if(..(preferences))
		return preferences.read_preference(/datum/preference/choiced/markings/right_foot_markings_3) != "None"
