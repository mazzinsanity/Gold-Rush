/datum/job/ms13/ncr/ranger
	title = "NCR Ranger"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Veteran Ranger."
	description = "You are an NCR Ranger, a member of an elite military division within the NCR. Assist the main forces by scouting ahead and reporting your findings. Follow the orders of the Veteran Ranger."

	outfit = /datum/outfit/job/ms13/ncr/ranger

	display_order = JOB_DISPLAY_ORDER_MS13_NCRRANGER

/datum/outfit/job/ms13/ncr/ranger
	name = "_NCR Ranger"
	jobtype = /datum/job/ms13/ncr/ranger
	id = /obj/item/card/id/ms13/ncr/ranger
	head = /obj/item/clothing/head/helmet/ms13/combat/ranger/ncr
	mask = null
	suit = /obj/item/clothing/suit/armor/ms13/combat/ranger/ncr
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/ammo_box/magazine/ms13/r308=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)

/datum/outfit/job/ms13/ncr/ranger/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)

	if(prob(50))
		mask = /obj/item/clothing/mask/ms13/bandana/ranger
	else
		mask = /obj/item/clothing/mask/gas/ms13/ranger

	belt = pick(
		/obj/item/gun/ballistic/revolver/ms13/rev357,
		/obj/item/gun/ballistic/revolver/ms13/rev357/police,
	)


