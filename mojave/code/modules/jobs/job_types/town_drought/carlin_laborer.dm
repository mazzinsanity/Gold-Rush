/datum/job/ms13/town_drought/carlin_laborer
	title = "Carlin Laborer"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Enforcers and The Mayor."
	description = "Provide vital labor for Carlin. Ensure the town is in good condition. Toil the fertile soil to grow produce."

	outfit = /datum/outfit/job/ms13/town_drought/carlin_laborer

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINLABORER

/datum/outfit/job/ms13/town_drought/carlin_laborer
	name = "_Carlin Laborer"
	jobtype = /datum/job/ms13/town_drought/carlin_laborer

	id = /obj/item/card/id/ms13/drought_laborer
	shoes = /obj/item/clothing/shoes/ms13/explorer
	r_hand = /obj/item/storage/ms13/toolbox/filled
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
	)	

/datum/outfit/job/ms13/town_drought/carlin_laborer/pre_equip(mob/living/carbon/human/H)
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
