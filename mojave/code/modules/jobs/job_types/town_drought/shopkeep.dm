/datum/job/ms13/town_drought/shopkeep
	title = "Carlin Shopkeep"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Enforcers and The Mayor."
	description = ""

	outfit = /datum/outfit/job/ms13/town_drought/shopkeep

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINSHOPKEEP

/datum/outfit/job/ms13/town_drought/shopkeep
	name = "_Carlin Shopkeep"
	jobtype = /datum/job/ms13/town_drought/shopkeep

	id = /obj/item/card/id/ms13/drought_shopkeep
	suit = /obj/item/clothing/suit/ms13/duster
	uniform = /obj/item/clothing/under/ms13/wasteland/merchant
	shoes = /obj/item/clothing/shoes/ms13/brownie
	suit_store = /obj/item/gun/ballistic/revolver/ms13/caravan
	r_pocket = /obj/item/stack/ms13/currency/cap/twohunned
	backpack_contents = list(
		/obj/item/ammo_box/ms13/shotgun/buckshot=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
	)
