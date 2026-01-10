/datum/job/ms13/legion/medicus
	title = "Legion Medicus"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Legionaries."
	description = "You are an Auxilia, ordered to assist the Legion's army. Ensure the Legionaries are in good health. Obey the orders of the Legionaries."

	outfit = /datum/outfit/job/ms13/legion/medicus

	display_order = JOB_DISPLAY_ORDER_MS13_LEGIONMEDICUS

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/legion/medicus
	name = "_Legion Medicus"
	jobtype = /datum/job/ms13/legion/medicus

	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	belt = /obj/item/storage/firstaid/ms13
	r_hand = /obj/item/storage/firstaid/ms13/bag/filled
	id = /obj/item/card/id/ms13/medicus
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/stack/medical/ointment/ms13=1,
		/obj/item/reagent_containers/ms13/flask/bitter_drink=1,
		/obj/item/stack/medical/splint/ms13/wooden=2,
		/obj/item/flashlight/flare/ms13=1,
	)
