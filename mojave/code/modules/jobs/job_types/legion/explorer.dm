/datum/job/ms13/legion/explorer
	title = "Legion Explorer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Prime Decanus, Veteran Decanus and The Centurion."
	description = "Assist the Legion by scouting out the land and reporting your findings. Obey orders given to you by the Prime Decanus, Veteran Decanus and the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/explorer

	display_order = JOB_DISPLAY_ORDER_MS13_EXPLORER

/datum/outfit/job/ms13/legion/explorer
	name = "_Legion Explorer"
	jobtype = /datum/job/ms13/legion/explorer

	head = /obj/item/clothing/head/helmet/ms13/legion/explorer
	glasses = /obj/item/clothing/glasses/ms13/leather
	uniform = /obj/item/clothing/under/ms13/legion/fatigues/dark
	shoes = /obj/item/clothing/shoes/ms13/military/legion/cleats
	suit = /obj/item/clothing/suit/armor/ms13/legion/explorer
	gloves = /obj/item/clothing/gloves/ms13/legion/dark
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped
	belt = /obj/item/claymore/ms13/machete
	id = /obj/item/card/id/ms13/explorer
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm=1,
		/obj/item/ammo_box/magazine/ms13/r308=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/flare/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
		/obj/item/stack/medical/ms13/healing_powder=1,
	)

/datum/outfit/job/ms13/legion/explorer/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/denarius,
		/obj/item/stack/ms13/currency/denarius/two,
		/obj/item/stack/ms13/currency/denarius/three,
	)
