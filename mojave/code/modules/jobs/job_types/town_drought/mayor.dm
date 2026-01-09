/datum/job/ms13/town_drought/mayor
	title = "Carlin Mayor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The People."
	description = ""

	outfit = /datum/outfit/job/ms13/town_drought/mayor

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINMAYOR

/datum/outfit/job/ms13/town_drought/mayor
	name = "_The Mayor"
	jobtype = /datum/job/ms13/town_drought/mayor

	id = /obj/item/card/id/ms13/drought_mayor
	uniform = /obj/item/clothing/under/ms13/regal
	head = /obj/item/clothing/head/helmet/ms13/tall/regal
	shoes = /obj/item/clothing/shoes/ms13/fancy
	suit_store = /obj/item/gun/ballistic/revolver/ms13/derringer/trimmed
	r_pocket = /obj/item/stack/ms13/currency/cap/mayor
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)
