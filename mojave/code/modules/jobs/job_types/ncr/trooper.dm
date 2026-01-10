/datum/job/ms13/ncr/trooper
	title = "NCR Trooper"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Corporals and above."
	description = "You are a Private First Class, a common foot soldier of the NCR Army. You have completed basic training and have been issued simple gear. Stick to your squad and follow the orders of Corporals and above."

	outfit = /datum/outfit/job/ms13/ncr/trooper

	display_order = JOB_DISPLAY_ORDER_MS13_TROOPER

/datum/outfit/job/ms13/ncr/trooper
	name = "_NCR Trooper"
	jobtype = /datum/job/ms13/ncr/trooper
	id = /obj/item/card/id/ms13/ncr
	head = /obj/item/clothing/head/helmet/ms13/ncr
	suit = /obj/item/clothing/suit/armor/ms13/ncr
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	l_pocket = /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/ms13/crafted=1,
	)

/datum/outfit/job/ms13/ncr/trooper/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)

	suit_store = pick(
		/obj/item/gun/ballistic/rifle/ms13/varmint,
		/obj/item/gun/ballistic/rifle/ms13/hunting/surplus,
	)

/datum/outfit/job/ms13/ncr/trooper/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
