/datum/job/ms13/goldman/keeper
	title = "Goldman Keeper"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Ringleader."
	req_admin_notify = 1
	description = "You are a trusted veteran member of the Goldman Posse, the Ringleader's right hand man and second in command. Organize the Goldman camp and keep it stocked with supplies. Engage in matters on the Ringleader's behalf if needed."

	outfit = /datum/outfit/job/ms13/goldman/keeper

	display_order = JOB_DISPLAY_ORDER_MS13_GLDMNKEEPER

/datum/outfit/job/ms13/goldman/keeper
	name = "_Goldman Keeper"
	jobtype = 	 /datum/job/ms13/goldman/keeper
	id =		 /obj/item/card/id/ms13/goldman/keeper
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman/veteran
	uniform =	 /obj/item/clothing/under/ms13/goldman/leader
	suit =		 /obj/item/clothing/suit/ms13/goldman/keeper	 
	r_pocket = 	 /obj/item/stack/ms13/currency/cap/hunned
	l_pocket = 	 /obj/item/knife/ms13/hunting
	shoes =		 /obj/item/clothing/shoes/ms13/fancy
	mask =		 /obj/item/clothing/mask/ms13/bandana/goldman/alt
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)

/datum/outfit/job/ms13/goldman/keeper/pre_equip(mob/living/carbon/human/H)
	..()

	belt = pick(
		/obj/item/gun/ballistic/revolver/ms13/rev357,
		/obj/item/gun/ballistic/revolver/ms13/rev357/police,
	)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/ms13/mts,
		/obj/item/gun/ballistic/shotgun/ms13/lever/trail,
	)

/datum/outfit/job/ms13/goldman/keeper/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
