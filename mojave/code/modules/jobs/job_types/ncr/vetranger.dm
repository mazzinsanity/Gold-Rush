/datum/job/ms13/ncr/vetranger
	title = "NCR Veteran Ranger"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Captain and NCR High Command."
	description = ""

	outfit = /datum/outfit/job/ms13/ncr/vetranger

	display_order = JOB_DISPLAY_ORDER_MS13_NCRVETRANGER

/datum/outfit/job/ms13/ncr/vetranger
	name = "_NCR Veteran Ranger"
	jobtype = /datum/job/ms13/ncr/vetranger
	id = /obj/item/card/id/ms13/ncr/ranger/vet
	head = /obj/item/clothing/head/helmet/ms13/eliteriot/ranger/ncr
	mask = null
	suit = /obj/item/clothing/suit/armor/ms13/eliteriot/ranger/ncr
	belt = /obj/item/gun/ballistic/revolver/ms13/huntingrev/sequoia
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

/datum/outfit/job/ms13/ncr/ranger/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)
