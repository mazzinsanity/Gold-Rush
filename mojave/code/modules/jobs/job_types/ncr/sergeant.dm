/datum/job/ms13/ncr/sergeant
	title = "NCR Sergeant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Lieutenant."
	description = "Lead and organize your squad. Ensure your squad is properly equipped and prepared for combat. Rally the troops towards your objective. Follow the orders of the Lieutenant."

	outfit = /datum/outfit/job/ms13/ncr/sergeant

	display_order = JOB_DISPLAY_ORDER_MS13_SERGEANT

/datum/outfit/job/ms13/ncr/sergeant
	name = "_NCR Sergeant"
	jobtype = /datum/job/ms13/ncr/sergeant
	id = /obj/item/card/id/ms13/ncr/sergeant
	head = /obj/item/clothing/head/helmet/ms13/ncr/goggles/sergeant
	suit = /obj/item/clothing/suit/armor/ms13/ncr/mantle
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/proto_service
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m45=2,
		/obj/item/ammo_box/magazine/ms13/r20=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13=1,
	)

/datum/outfit/job/ms13/ncr/sergeant/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)
