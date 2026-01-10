/datum/job/ms13/ncr/radioman
	title = "NCR Radio Operator"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Sergeants and above."
	description = "Relay messages between your squad and Command. Assist the Sergeant in maintaining squad cohesion. Follow the orders of Sergeants and above."

	outfit = /datum/outfit/job/ms13/ncr/radioman

	display_order = JOB_DISPLAY_ORDER_MS13_RADIOMAN

/datum/outfit/job/ms13/ncr/radioman
	name = "_NCR Radio Operator"
	jobtype = /datum/job/ms13/ncr/radioman
	id = /obj/item/card/id/ms13/ncr/radioman
	head = /obj/item/clothing/head/helmet/ms13/ncr/goggles
	suit = /obj/item/clothing/suit/armor/ms13/ncr/reinforced
	suit_store = /obj/item/gun/ballistic/automatic/ms13/full/smg9mm
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/m9mm
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/radiopack
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m9mm=2,
		/obj/item/ammo_box/magazine/ms13/smgm9mm=2,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/flashlight/ms13=1,
	)

/datum/outfit/job/ms13/ncr/radioman/pre_equip(mob/living/carbon/human/H)
	..()

	r_pocket = pick(
		/obj/item/stack/ms13/currency/ncr_dollar/twenty,
		/obj/item/stack/ms13/currency/ncr_dollar/thirty,
		/obj/item/stack/ms13/currency/ncr_dollar/fourty,
	)
