/datum/job/ms13/bos/scribe
	title = "Brotherhood Scribe"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Head Scribe"
	description = "Ensure the base is up to standards, ensure everyone is in good health, and ensure the technology of the Brotherhood is well maintained. Obey orders from the Head Scribe and your assigned Knight, if one is present."

	outfit = /datum/outfit/job/ms13/bos/scribe

	display_order = JOB_DISPLAY_ORDER_MS13_SCRIBE

	mind_traits = list(TRAIT_MEDICAL_TRAINING,  TRAIT_ELECTRICAL_TRAINING)

/datum/outfit/job/ms13/bos/scribe
	name = "_Brotherhood Scribe"
	jobtype = /datum/job/ms13/bos/scribe

	id = /obj/item/card/id/ms13/bos/scribe
	suit = /obj/item/clothing/suit/armor/ms13/scribe
	belt = /obj/item/storage/firstaid/ms13/regular
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm
	r_hand = /obj/item/storage/ms13/toolbox/filled
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m10mm=2,
		/obj/item/flashlight/ms13=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak/crappy=1,
	)

/datum/outfit/job/ms13/bos/scribe/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/prewar/twenty, 
		/obj/item/stack/ms13/currency/prewar/thirty, 
		/obj/item/stack/ms13/currency/prewar/fourty,
	)
