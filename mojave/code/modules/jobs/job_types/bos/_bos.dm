/datum/job/ms13/bos
	selection_color = "#737592"
	departments_list = list(
		/datum/job_department/bos,
	)
	exp_granted_type = EXP_TYPE_BOS
	exp_required_type = EXP_TYPE_BOS
	forbid = "Avoid unnecessary casualities. Experimentation on humans is forbidden."
	enforce = "Abide by the Codex. Follow the Chain That Binds. Protect your base and Chapter but do not ignore your mission of keeping the region's technology in check. Relations with the NCR and Caesar's Legion are tense."

/datum/outfit/job/ms13/bos
	name = "Default"
	jobtype = /datum/job/ms13/bos
	uniform = /obj/item/clothing/under/ms13/bos
	shoes = /obj/item/clothing/shoes/ms13/military/bos
	back = /obj/item/storage/ms13/bos

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/bos/config_check()
	if(type == /datum/job/ms13/bos)
		return FALSE
	return ..()

/datum/job/ms13/bos/map_check()
	if(type == /datum/job/ms13/bos)
		return FALSE
	return ..()
