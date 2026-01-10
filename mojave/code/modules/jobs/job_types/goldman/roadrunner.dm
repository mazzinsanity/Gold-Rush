/datum/job/ms13/goldman/roadrunner
	title = "Goldman Road Runner"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Ringleader and the Keeper."
	description = "Scout ahead of your Goldman peers and report your findings. Follow the orders of the Ringleader and the Keeper."

	outfit = /datum/outfit/job/ms13/goldman/roadrunner

	display_order = JOB_DISPLAY_ORDER_MS13_GLDMNROADRUN

/datum/outfit/job/ms13/goldman/roadrunner
	name = "_Goldman Road Runner"
	jobtype = 	 /datum/job/ms13/goldman/roadrunner
	id =		 /obj/item/card/id/ms13/goldman/road
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman/runner
	uniform =	 /obj/item/clothing/under/ms13/goldman
	suit =		 /obj/item/clothing/suit/ms13/goldman/poncho_padded
	belt =		 /obj/item/gun/ballistic/revolver/ms13/rev10mm
	l_pocket = 	 /obj/item/knife/ms13/hunting
	shoes =		 /obj/item/clothing/shoes/ms13/explorer
	gloves =	 /obj/item/clothing/gloves/ms13/fingerless
	glasses = 	 /obj/item/clothing/glasses/ms13/leather/goldman
	mask =		 /obj/item/clothing/mask/ms13/facewrap/goldman
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/c10mm=1,
		/obj/item/ammo_box/magazine/ms13/r308=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/flare/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)

/datum/outfit/job/ms13/goldman/roadrunner/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen, 
		/obj/item/stack/ms13/currency/cap/twentyfive, 
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)
