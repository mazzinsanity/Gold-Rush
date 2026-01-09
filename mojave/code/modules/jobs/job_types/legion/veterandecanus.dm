/datum/job/ms13/legion/veterandecanus
	title = "Legion Veteran Decanus"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Centurion."
	description = "You are the commander of the Veteran Legionaries, the Centurion's right hand man and second in command. Lead and organize your Veteran Legionaries in battle. Engage in matters on the Centurion's behalf if needed. Obey orders given to you by the Centurion to the death."

	outfit = /datum/outfit/job/ms13/legion/veterandecanus

	display_order = JOB_DISPLAY_ORDER_MS13_VETERANDECANUS

/datum/outfit/job/ms13/legion/veterandecanus
	name = "_Legion Veteran Decanus"
	jobtype = /datum/job/ms13/legion/veterandecanus

	head = /obj/item/clothing/head/helmet/ms13/legion/decanus/veteran
	glasses = /obj/item/clothing/glasses/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/military/legion/tanboots
	suit = /obj/item/clothing/suit/armor/ms13/legion/veteran
	gloves = /obj/item/clothing/gloves/ms13/legion/bracers
	belt = /obj/item/claymore/ms13/machete/gladius
	r_pocket = /obj/item/stack/ms13/currency/aurelius
	id = /obj/item/card/id/ms13/legveteran/decanus
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/ms13/rev357=1,
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/ms13/flask/bitter_drink=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)

/datum/outfit/job/ms13/legion/veterandecanus/pre_equip(mob/living/carbon/human/H)
	..()

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/ms13/huntingrev,
		/obj/item/gun/ballistic/revolver/ms13/mts,
		/obj/item/gun/ballistic/automatic/ms13/full/smg10mm,
	)

/datum/outfit/job/ms13/legion/veterandecanus/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
