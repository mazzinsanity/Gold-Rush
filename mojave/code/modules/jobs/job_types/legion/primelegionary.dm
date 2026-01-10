/datum/job/ms13/legion/primelegionary
	title = "Legion Prime Legionary"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Prime Decanus and the Centurion."
	description = "You have shown good merit in battle and have survived long enough to become a Prime. Obey orders given to you by the Prime Decanus and the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/primelegionary

	display_order = JOB_DISPLAY_ORDER_MS13_PRIMELEGIONARY

/datum/outfit/job/ms13/legion/primelegionary
	name = "_Legion Prime Legionary"
	jobtype = /datum/job/ms13/legion/primelegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/prime
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/prime
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	r_hand = /obj/item/ms13/twohanded/spear/throwing
	belt = /obj/item/claymore/ms13/machete
	id = /obj/item/card/id/ms13/legprime
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/flare/ms13=1,
	)

/datum/outfit/job/ms13/legion/primelegionary/pre_equip(mob/living/carbon/human/H)
	..()

	suit_store = pick(
		/obj/item/gun/ballistic/rifle/ms13/varmint,
		/obj/item/gun/ballistic/revolver/ms13/caravan,
	)

	r_pocket = pick(
		/obj/item/stack/ms13/currency/denarius,
		/obj/item/stack/ms13/currency/denarius/two,
		/obj/item/stack/ms13/currency/denarius/three,
	)

/datum/outfit/job/ms13/legion/primelegionary/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
