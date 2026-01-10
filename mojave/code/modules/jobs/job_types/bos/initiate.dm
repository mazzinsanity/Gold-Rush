/datum/job/ms13/bos/initiate
	title = "Brotherhood Initiate"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Brotherhood Knights, Scribes, and above"
	description = "You are an inexperienced Brotherhood recruit. Learn what it means to be a member of the Brotherhood. Execute orders given to you by anyone that is not a fellow Initiate."

	outfit = /datum/outfit/job/ms13/bos/initiate

	display_order = JOB_DISPLAY_ORDER_MS13_INITIATE

/datum/outfit/job/ms13/bos/initiate
	name = "_Brotherhood Initiate"
	jobtype = /datum/job/ms13/bos/initiate

	id = /obj/item/card/id/ms13/bos/initiate
	head = /obj/item/clothing/head/helmet/ms13/initiate
	suit = /obj/item/clothing/suit/armor/ms13/vest/bos
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	belt = /obj/item/claymore/ms13/baton
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m10mm=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/ms13/crafted=1,
	)
