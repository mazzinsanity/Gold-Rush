/datum/job/ms13/goldman/ringleader
	title = "Goldman Ringleader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Fellow Goldman Ringleaders."
	req_admin_notify = 1
	description = "You are among the most senior members of the Goldman Posse, charged with overseeing the local camp. Lead and organize your Goldmen to expand the influence and profits of the group. Establish new mercenary contracts as needed."

	outfit = /datum/outfit/job/ms13/goldman/ringleader

	display_order = JOB_DISPLAY_ORDER_MS13_GLDMNOVER

/datum/outfit/job/ms13/goldman/ringleader
	name = "_Goldman Ringleader"
	jobtype = 	 /datum/job/ms13/goldman/ringleader
	id =		 /obj/item/card/id/ms13/goldman/ringleader
	head = 		 /obj/item/clothing/head/helmet/ms13/cowboy/goldman/leader
	uniform =	 /obj/item/clothing/under/ms13/goldman/leader
	suit =		 /obj/item/clothing/suit/ms13/goldman/leader
	r_pocket = 	 /obj/item/stack/ms13/currency/cap/twohunned
	l_pocket = 	 /obj/item/knife/ms13/hunting
	shoes =		 /obj/item/clothing/shoes/ms13/military
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/brush
	back =		 /obj/item/storage/ms13/satchel
	gloves =	 /obj/item/clothing/gloves/ms13/military
	mask =		 /obj/item/clothing/mask/ms13/bandana/goldman/alt
	back =		 /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/ammo_box/ms13/c4570box=1,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)

/datum/outfit/job/ms13/goldman/ringleader/pre_equip(mob/living/carbon/human/H)
	..()

	belt = pick(
		/obj/item/gun/ballistic/revolver/ms13/rev357,
		/obj/item/gun/ballistic/revolver/ms13/rev357/police,
	)
