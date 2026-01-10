/datum/job/ms13/ncr/rear_echelon
	title = "NCR Rear Echelon"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Troopers and above."
	description = "You are a member of the Rear Echelon of the NCR, charged with menial tasks around the camp."

	outfit = /datum/outfit/job/ms13/ncr/rear_echelon

	display_order = JOB_DISPLAY_ORDER_MS13_REARECHELON

/datum/outfit/job/ms13/ncr/rear_echelon
	name = "_NCR Rear Echelon"
	jobtype = /datum/job/ms13/ncr/rear_echelon
	id = /obj/item/card/id/ms13/ncr/rear_echelon
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/ms13/crafted=1,
	)
