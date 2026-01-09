/datum/job/ms13/town_drought/laborer
	title = "Carlin Laborer"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Enforcers and The Mayor."
	description = ""

	outfit = /datum/outfit/job/ms13/town_drought/laborer

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINLABORER

/datum/outfit/job/ms13/town_drought/laborer
	name = "_Carlin Laborer"
	jobtype = /datum/job/ms13/town_drought/laborer

	id = /obj/item/card/id/ms13/drought_laborer
	shoes = /obj/item/clothing/shoes/ms13/explorer
	r_hand = /obj/item/storage/ms13/toolbox/filled
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
	)	

/datum/outfit/job/ms13/town_drought/laborer/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/machinist,
		/obj/item/clothing/under/ms13/wasteland/lumberjack,
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey,
		/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen,
	)

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen,
		/obj/item/stack/ms13/currency/cap/twentyfive,
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)
