/datum/job/ms13/ncr/medical_officer
	title = "NCR Medical Officer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Lieutenant."
	description = "Ensure the base is stocked with medical supplies. Triage the wounded and oversee surgery. Advise the Combat Medics on medical matters. Follow the orders of the Lieutenant."

	outfit = /datum/outfit/job/ms13/ncr/medical_officer

	display_order = JOB_DISPLAY_ORDER_MS13_MEDICALOFFICER

	mind_traits = list(TRAIT_MEDICAL_TRAINING, TRAIT_DRUGGIE)

/datum/outfit/job/ms13/ncr/medical_officer
	name = "_NCR Medical Officer"
	jobtype = /datum/job/ms13/ncr/medical_officer
	id = /obj/item/card/id/ms13/ncr/medical_officer
	head = /obj/item/clothing/head/helmet/ms13/ncr/beret/officer
	suit = /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform = /obj/item/clothing/under/ms13/ncr/fatigues/medic
	gloves = /obj/item/clothing/gloves/ms13/nitrile
	belt = /obj/item/storage/firstaid/ms13/quality
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m45=2,
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol45=1,
		/obj/item/flashlight/ms13=1,
	)

/datum/outfit/job/ms13/ncr/medical_officer/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)

