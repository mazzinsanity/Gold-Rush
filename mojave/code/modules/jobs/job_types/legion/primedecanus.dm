/datum/job/ms13/legion/primedecanus
	title = "Legion Prime Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion."
	description = "You are the commander of the Prime Legionaries, lead and organize them in battle. Obey orders given to you by the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/primedecanus

	display_order = JOB_DISPLAY_ORDER_MS13_PRIMEDECANUS

/datum/outfit/job/ms13/legion/primedecanus
	name = "_Legion Prime Decanus"
	jobtype = /datum/job/ms13/legion/primedecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus/prime
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/prime
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	r_hand = /obj/item/ms13/twohanded/spear/throwing
	belt = /obj/item/claymore/ms13/machete
	id = /obj/item/card/id/ms13/legprime/decanus
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/flare/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
		/obj/item/stack/medical/ms13/healing_powder/poultice=1,
	)

/datum/outfit/job/ms13/legion/primedecanus/pre_equip(mob/living/carbon/human/H)
	..()

	suit_store = pick(
		/obj/item/gun/ballistic/shotgun/ms13/lever/cowboy,
		/obj/item/gun/ballistic/shotgun/ms13/lever,
	)

	r_pocket = pick(
		/obj/item/stack/ms13/currency/denarius,
		/obj/item/stack/ms13/currency/denarius/two,
		/obj/item/stack/ms13/currency/denarius/three,
	)

/datum/outfit/job/ms13/legion/primedecanus/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
