/datum/job/ms13/town_drought/carlin_sheriff
	title = "Carlin Sheriff"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Lead and organize your team of Enforcers to ensure the Mayor's laws are being upheld. Work with the Mayor to make Carlin a better place to live."

	outfit = /datum/outfit/job/ms13/town_drought/carlin_sheriff

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINSHERIFF

/datum/outfit/job/ms13/town_drought/carlin_sheriff
	name = "_Carlin Sheriff"
	jobtype = /datum/job/ms13/town_drought/carlin_sheriff

	id = /obj/item/card/id/ms13/drought_sheriff
	head = /obj/item/clothing/head/helmet/ms13/sheriff
	suit = /obj/item/clothing/suit/ms13/trench/black/reinf/sheriff
	suit_store = /obj/item/gun/ballistic/revolver/ms13/huntingrev
	gloves = /obj/item/clothing/gloves/ms13/military
	shoes = /obj/item/clothing/shoes/ms13/military
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/c4570box=1,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)	

/datum/outfit/job/ms13/town_drought/sheriff/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen,
		/obj/item/stack/ms13/currency/cap/twentyfive,
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)
