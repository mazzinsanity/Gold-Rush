/datum/job/ms13/legion/recruitlegionary
	title = "Legion Recruit Legionary"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Recruit Decanus and the Centurion"
	description = "You have been deemed ready to fight. Prove yourself worthy to the Legion in battle. Obey orders given to you by the Recruit Decanus and the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/recruitlegionary

	display_order = JOB_DISPLAY_ORDER_MS13_RECRUITLEGIONARY

/datum/outfit/job/ms13/legion/recruitlegionary
	name = "_Legion Recruit"
	jobtype = /datum/job/ms13/legion/recruitlegionary

	head = /obj/item/clothing/head/helmet/ms13/legion/recruit
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/recruit
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	r_hand = /obj/item/ms13/twohanded/spear/throwing
	belt = /obj/item/claymore/ms13/machete
	id = /obj/item/card/id/ms13/legrecruit
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
		/obj/item/stack/medical/ms13/healing_powder=1,
	)

/datum/outfit/job/ms13/legion/recruitlegionary/pre_equip(mob/living/carbon/human/H)
	..()

	suit_store = pick(
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm,
		/obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/chinese,
		/obj/item/gun/ballistic/automatic/pistol/ms13/pistol22,
		/obj/item/gun/ballistic/revolver/ms13/rev10mm,
	)

/datum/outfit/job/ms13/legion/recruitlegionary/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
