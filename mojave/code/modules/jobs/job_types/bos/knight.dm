/datum/job/ms13/bos/knight
	title = "Brotherhood Knight"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Head Knight"
	description = "You are an engineer and soldier of the Brotherhood. Ensure the security of your base and fellow Brotherhood members. Execute orders given to you by the Head Knight."

	outfit = /datum/outfit/job/ms13/bos/knight

	display_order = JOB_DISPLAY_ORDER_MS13_KNIGHT

/datum/outfit/job/ms13/bos/knight
	name = "_Brotherhood Knight"
	jobtype = /datum/job/ms13/bos/knight

	id = /obj/item/card/id/ms13/bos/knight
	head = /obj/item/clothing/head/helmet/ms13/combat/bos
	mask = /obj/item/clothing/mask/ms13/bos
	suit = /obj/item/clothing/suit/armor/ms13/combat/bos
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/m10mm/military
	gloves = /obj/item/clothing/gloves/ms13/bos
	suit_store = /obj/item/gun/energy/ms13/laser/rifle
	l_pocket = /obj/item/knife/ms13/combat
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=2,
		/obj/item/ammo_box/magazine/ms13/m10mm=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1,
	)

/datum/outfit/job/ms13/bos/knight/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/prewar/twenty,
		/obj/item/stack/ms13/currency/prewar/thirty,
		/obj/item/stack/ms13/currency/prewar/fourty,
	)
