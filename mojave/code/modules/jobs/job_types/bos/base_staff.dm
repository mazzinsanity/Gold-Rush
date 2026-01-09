/datum/job/ms13/bos/base_staff
	title = "Brotherhood Base Staff"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Brotherhood Knights, Scribes, and above"
	description = "You are a member of the Brotherhood assigned with menial tasks around the base."

	outfit = /datum/outfit/job/ms13/bos/base_staff

	display_order = JOB_DISPLAY_ORDER_MS13_BASE_STAFF

/datum/outfit/job/ms13/bos/base_staff
	name = "_Brotherhood Base Staff"
	jobtype = /datum/job/ms13/bos/base_staff

	id = /obj/item/card/id/ms13/bos/base_staff
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/ms13/crafted=1,
	)
