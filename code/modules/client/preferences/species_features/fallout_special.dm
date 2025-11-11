/datum/preference/numeric/special_stat
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	abstract_type = /datum/preference/numeric/special_stat

	minimum = SPECIAL_STAT_MIN
	maximum = SPECIAL_STAT_MAX

/datum/preference/numeric/special_stat/create_default_value()
	return 5

/datum/preference/numeric/special_stat/apply_to_human(mob/living/carbon/human/target, value)		
	target.special_stats[savefile_key] = value

/datum/preference/numeric/special_stat/strength
	savefile_key = SPECIAL_STRENGTH

/datum/preference/numeric/special_stat/perception
	savefile_key = SPECIAL_PERCEPTION

/datum/preference/numeric/special_stat/endurance
	savefile_key = SPECIAL_ENDURANCE

/datum/preference/numeric/special_stat/charisma
	savefile_key = SPECIAL_CHARISMA

/datum/preference/numeric/special_stat/intelligence
	savefile_key = SPECIAL_INTELLIGENCE

/datum/preference/numeric/special_stat/agility
	savefile_key = SPECIAL_AGILITY

/datum/preference/numeric/special_stat/luck
	savefile_key = SPECIAL_LUCK
