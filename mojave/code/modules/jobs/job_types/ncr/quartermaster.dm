/datum/job/ms13/ncr/quartermaster
	title = "NCR Quartermaster"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Lieutenant."
	description = ""

	outfit = /datum/outfit/job/ms13/ncr/quartermaster

	display_order = JOB_DISPLAY_ORDER_MS13_QUARTERMASTER

	mind_traits = list(TRAIT_ELECTRICAL_TRAINING)

/datum/outfit/job/ms13/ncr/quartermaster
	name = "_NCR Quartermaster"
	jobtype = /datum/job/ms13/ncr/quartermaster
	id = /obj/item/card/id/ms13/ncr/quartermaster
	head = /obj/item/clothing/head/helmet/ms13/ncr/beret/officer
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	r_hand = /obj/item/storage/ms13/toolbox/filled
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m45=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/ms13=1,
	)

/datum/outfit/job/ms13/ncr/quartermaster/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)

