/datum/job/ms13/ncr/medic
	title = "NCR Combat Medic"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Sergeants and above."
	description = "Ensure everyone is in good health. Keep your squad alive during combat. Follow the orders of Sergeants and above."

	outfit = /datum/outfit/job/ms13/ncr/medic

	display_order = JOB_DISPLAY_ORDER_MS13_MEDIC

	mind_traits = list(TRAIT_MEDICAL_TRAINING)

/datum/outfit/job/ms13/ncr/medic
	name = "_NCR Combat Medic"
	jobtype = /datum/job/ms13/ncr/medic
	id = /obj/item/card/id/ms13/ncr/medic
	head = /obj/item/clothing/head/helmet/ms13/ncr/medic
	suit = /obj/item/clothing/suit/armor/ms13/ncr/reinforced
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/smg9mm
	uniform = /obj/item/clothing/under/ms13/ncr/fatigues/medic
	gloves = /obj/item/clothing/gloves/ms13/nitrile
	belt = /obj/item/storage/firstaid/ms13/regular
	l_pocket = /obj/item/knife/ms13/hunting
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/gun/ballistic/automatic/pistol/ms13/m9mm=1,
		/obj/item/ammo_box/magazine/ms13/smgm9mm=2,
		/obj/item/flashlight/ms13=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=2,
	)

/datum/outfit/job/ms13/ncr/medic/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)

