/datum/job/ms13/ncr
	selection_color = "#cfd1ba"
	departments_list = list(
		/datum/job_department/ncr,
	)
	exp_granted_type = EXP_TYPE_NCR
	exp_required_type = EXP_TYPE_NCR
	forbid = "Recreational drugs are banned. Drinking and gambling on duty is forbidden. Do not disobey lawful orders of your superiors. Desertion is treated harshly."
	enforce = "Follow NCR laws. Treat prisoners fairly. Protect your camp and establish a foothold in the region. Relations with the Brotherhood are tense. You are at war with the Legion."

/datum/outfit/job/ms13/ncr
	name = "NCRDatums"
	jobtype = /datum/job/ms13/ncr/
	back = /obj/item/storage/ms13/ncr
	mask = /obj/item/clothing/mask/ms13/ncr
	shoes = /obj/item/clothing/shoes/ms13/military/ncr
	uniform = /obj/item/clothing/under/ms13/ncr/fatigues
	gloves = /obj/item/clothing/gloves/ms13/ncr

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/ncr/config_check()
	if(type == /datum/job/ms13/ncr)
		return FALSE
	return ..()

/datum/job/ms13/ncr/map_check()
	if(type == /datum/job/ms13/ncr)
		return FALSE
	return ..()
