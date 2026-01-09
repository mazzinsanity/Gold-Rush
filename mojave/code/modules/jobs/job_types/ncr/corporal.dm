/datum/job/ms13/ncr/corporal
	title = "NCR Corporal"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Sergeants and above."
	description = ""

	outfit = /datum/outfit/job/ms13/ncr/corporal

	display_order = JOB_DISPLAY_ORDER_MS13_CORPORAL

/datum/outfit/job/ms13/ncr/corporal
	name = "_NCR Corporal"
	jobtype = /datum/job/ms13/ncr/corporal
	id = /obj/item/card/id/ms13/ncr/corporal
	head = /obj/item/clothing/head/helmet/ms13/ncr/goggles
	suit = /obj/item/clothing/suit/armor/ms13/ncr/reinforced
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
	)

/datum/outfit/job/ms13/ncr/corporal/pre_equip(mob/living/carbon/human/H)
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

/datum/outfit/job/ms13/ncr/corporal/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
