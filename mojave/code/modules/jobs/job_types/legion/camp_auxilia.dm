/datum/job/ms13/legion/camp_auxilia
	title = "Legion Camp Auxilia"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Legionaries."
	description = "You are an Auxilia of Caesar's Legion, charged with menial tasks around the camp."

	outfit = /datum/outfit/job/ms13/legion/camp_auxilia

	display_order = JOB_DISPLAY_ORDER_MS13_LEGIONCAMPAUXILIA

/datum/outfit/job/ms13/legion/camp_auxilia
	name = "_Legion Camp Auxilia"
	jobtype = /datum/job/ms13/legion/camp_auxilia

	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	id = /obj/item/card/id/ms13/camp_auxilia
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
	)
