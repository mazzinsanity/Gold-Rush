/datum/job/ms13/town_drought/barkeep
	title = "Carlin Barkeep"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Enforcers and The Mayor."
	description = "Tend to Carlin's bar and food services."

	outfit = /datum/outfit/job/ms13/town_drought/barkeep

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINBARKEEP

/datum/outfit/job/ms13/town_drought/barkeep
	name = "_Carlin Barkeep"
	jobtype = /datum/job/ms13/town_drought/barkeep

	id = /obj/item/card/id/ms13/drought_barkeep
	suit = /obj/item/clothing/suit/ms13/vest
	uniform = /obj/item/clothing/under/ms13/wasteland/vestslacks
	shoes = /obj/item/clothing/shoes/ms13/brownie
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan
	backpack_contents = list(
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
	)

/datum/outfit/job/ms13/town_drought/barkeep/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen,
		/obj/item/stack/ms13/currency/cap/twentyfive,
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)
