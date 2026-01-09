/datum/job/ms13/legion/recruitdecanus
	title = "Legion Recruit Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion."
	description = "You have shown promising leadership skills and now command the Recruit Legionaries, lead and organize them in battle. Obey orders given to you by the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/recruitdecanus

	display_order = JOB_DISPLAY_ORDER_MS13_RECRUITDECANUS

/datum/outfit/job/ms13/legion/recruitdecanus
	name = "_Legion Recruit Decanus"
	jobtype = /datum/job/ms13/legion/recruitdecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/recruit
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	r_hand = /obj/item/ms13/twohanded/spear/throwing
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan/sawed
	belt = /obj/item/claymore/ms13/machete
	id = /obj/item/card/id/ms13/legrecruitdecanus
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)
