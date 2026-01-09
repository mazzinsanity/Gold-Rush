/datum/job/ms13/legion/veteranlegionary
	title = "Legion Veteran Legionary"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Veteran Decanus and the Centurion."
	description = "You are one of the Legion's most elite soldiers, having survived many battles. Obey orders given to you by the Veteran Decanus and the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/veteranlegionary

	display_order = JOB_DISPLAY_ORDER_MS13_VETERANLEGIONARY

/datum/outfit/job/ms13/legion/veteranlegionary
	name = "_Legion Veteran Legionary"
	jobtype = /datum/job/ms13/legion/veteranlegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/veteran
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/veteran
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	belt = /obj/item/claymore/ms13/machete/gladius
	id = /obj/item/card/id/ms13/legveteran
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/ms13/rev357=1,
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
	)

/datum/outfit/job/ms13/legion/veteranlegionary/pre_equip(mob/living/carbon/human/H)
	..()

	suit_store = pick(
		/obj/item/gun/ballistic/shotgun/ms13/lever/trail,
		/obj/item/gun/ballistic/shotgun/ms13/huntingshot,
	)

	r_pocket = pick(
		/obj/item/stack/ms13/currency/denarius,
		/obj/item/stack/ms13/currency/denarius/two,
		/obj/item/stack/ms13/currency/denarius/three,
	)

/datum/outfit/job/ms13/legion/veteranlegionary/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)

