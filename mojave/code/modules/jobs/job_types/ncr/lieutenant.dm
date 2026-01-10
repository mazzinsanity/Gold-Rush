/datum/job/ms13/ncr/lieutenant
	title = "NCR Lieutenant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Captain and NCR High Command."
	req_admin_notify = 1
	description = "You are charged with overseeing the local NCR camp. Delegate orders to your Sergeants. Communicate with Radio Operators. Work with the Veteran Ranger to coordinate efforts for the NCR's mission in the region."

	outfit = /datum/outfit/job/ms13/ncr/lieutenant

	display_order = JOB_DISPLAY_ORDER_MS13_LIEUTENANT

/datum/outfit/job/ms13/ncr/lieutenant
	name = "_NCR Lieutenant"
	jobtype = /datum/job/ms13/ncr/lieutenant
	id = /obj/item/card/id/ms13/ncr/lieutenant
	head = /obj/item/clothing/head/helmet/ms13/ncr/beret/officer/armored
	suit = /obj/item/clothing/suit/armor/ms13/ncr/mantle/reinforced
	suit_store = /obj/item/gun/ballistic/automatic/ms13/semi/battle
	belt = /obj/item/gun/ballistic/automatic/pistol/ms13/pistol45
	shoes = /obj/item/clothing/shoes/ms13/military/ncr/officer
	r_pocket = /obj/item/stack/ms13/currency/ncr_dollar/hunnedfifty
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/ms13/m45=2,
		/obj/item/ammo_box/magazine/ms13/r308_10=2,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1,
		/obj/item/flashlight/ms13=1,
		/obj/item/radio/ms13/broadcast=1,
	)
