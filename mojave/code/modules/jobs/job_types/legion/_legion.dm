/datum/job/ms13/legion
	selection_color = "#9c0000"
	departments_list = list(
		/datum/job_department/legion,
	)
	exp_granted_type = EXP_TYPE_LEGION
	exp_required_type = EXP_TYPE_LEGION
	forbid = "Usage of chems and overreliance on technology is strictly forbidden. Women are not allowed to fight. Disobeying orders from superiors is typically met with death."
	enforce = "Fulfill the will of Caesar. Protect your camp and establish a foothold in the region. Relations with Brotherhood technophiles are tense. You are at war with the NCR."

/datum/outfit/job/ms13/legion
	name = "Default"
	jobtype = /datum/job/ms13/legion

	uniform = /obj/item/clothing/under/ms13/legion/fatigues
	back = /obj/item/storage/ms13/leather_backpack

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/legion/config_check()
	if(type == /datum/job/ms13/legion)
		return FALSE
	return ..()

/datum/job/ms13/legion/map_check()
	if(type == /datum/job/ms13/legion)
		return FALSE
	return ..()
