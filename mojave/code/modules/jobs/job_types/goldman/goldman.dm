/datum/job/ms13/goldman/standardgold
	title = "Goldman"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Ringleader and the Keeper."
	description = "You have proven yourself as a competent gunslinger in the Goldman Posse. Assist your fellow Goldmen and abide by existing mercenary contracts. Follow the orders of the Ringleader and the Keeper."

	outfit = /datum/outfit/job/ms13/goldman/standardgold

	display_order = JOB_DISPLAY_ORDER_MS13_GOLDMAN

/datum/outfit/job/ms13/goldman/standardgold
	name = "_Goldman"
	jobtype = 	 /datum/job/ms13/goldman/standardgold
	id =		 /obj/item/card/id/ms13/goldman/standardgold
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman/reinforced
	uniform =	 /obj/item/clothing/under/ms13/goldman
	belt =		 /obj/item/gun/ballistic/revolver/ms13/rev10mm
	l_pocket = 	 /obj/item/knife/ms13/hunting
	shoes =		 /obj/item/clothing/shoes/ms13/explorer
	gloves =	 /obj/item/clothing/gloves/ms13/leather
	mask =		 /obj/item/clothing/mask/ms13/bandana/goldman
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/c10mm=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/flare/ms13=1,
	)

/datum/outfit/job/ms13/goldman/standardgold/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen, 
		/obj/item/stack/ms13/currency/cap/twentyfive, 
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)

	suit = pick(
		/obj/item/clothing/suit/ms13/goldman/duster,
		/obj/item/clothing/suit/ms13/goldman/duster/covered,
	)

	suit_store = pick(
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy,
		/obj/item/gun/ballistic/shotgun/ms13/lever,
	)

	if(prob(40))
		glasses = /obj/item/clothing/glasses/ms13/leather/goldman
	else
		glasses = null

/datum/outfit/job/ms13/goldman/standardgold/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
