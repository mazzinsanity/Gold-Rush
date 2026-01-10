/datum/job/ms13/town_drought/carlin_clinician
	title = "Carlin Clinician"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Enforcers and The Mayor."
	description = "Ensure that the townsfolk of Carlin are healthy. Provide medical services to the wounded and sick."

	outfit = /datum/outfit/job/ms13/town_drought/carlin_clinician

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINCLINICIAN

	mind_traits = list(TRAIT_MEDICAL_TRAINING, TRAIT_DRUGGIE)

/datum/outfit/job/ms13/town_drought/carlin_clinician
	name = "_Carlin Clinician"
	jobtype = /datum/job/ms13/town_drought/carlin_clinician

	id = /obj/item/card/id/ms13/drought_doctor
	suit = /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform = /obj/item/clothing/under/ms13/wasteland/whiteshirt
	shoes = /obj/item/clothing/shoes/ms13/tan
	belt = /obj/item/storage/firstaid/ms13/regular
	r_hand = /obj/item/storage/firstaid/ms13/bag/filled
	backpack_contents = list(
		/obj/item/flashlight/flare/ms13=1,
	)	

/datum/outfit/job/ms13/town_drought/carlin_clinician/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen,
		/obj/item/stack/ms13/currency/cap/twentyfive,
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)
