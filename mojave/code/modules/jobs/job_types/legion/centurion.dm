/datum/job/ms13/legion/centurion
	title = "Legion Centurion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Legate and the Caesar."
	req_admin_notify = 1
	description = "You are tasked with overseeing the local Legion camp. Organize your Decani and command your Centuria, leading them to glorious victory."

	outfit = /datum/outfit/job/ms13/legion/centurion

	display_order = JOB_DISPLAY_ORDER_MS13_CENTURION

/datum/outfit/job/ms13/legion/centurion
	name = "_Legion Centurion"
	jobtype = /datum/job/ms13/legion/centurion

	head = /obj/item/clothing/head/helmet/ms13/legion/centurion
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/centurion
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/handmade
	belt = /obj/item/claymore/ms13/machete/gladius
	r_pocket = /obj/item/stack/ms13/currency/aurelius/two
	id = /obj/item/card/id/ms13/legcenturion
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/ms13/rev357=1,
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/ammo_box/magazine/ms13/ar762=2,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/ms13/flask/bitter_drink=1,
		/obj/item/stack/medical/ms13/healing_powder/poultice=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)
