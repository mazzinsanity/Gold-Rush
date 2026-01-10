/datum/job/ms13/bos/head_knight
	title = "Brotherhood Head Knight"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Brotherhood High Command"
	req_admin_notify = 1
	description = "Lead and organize your team of Knights. Work with the Head Scribe to coordinate efforts for the Brotherhood's mission in the region."

	outfit = /datum/outfit/job/ms13/bos/head_knight

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_KNIGHT

/datum/outfit/job/ms13/bos/head_knight
	name = "_Brotherhood Head Knight"
	jobtype = /datum/job/ms13/bos/head_knight

	id = /obj/item/card/id/ms13/bos/headknight
	suit = /obj/item/clothing/suit/armor/ms13/head_knight
	uniform = /obj/item/clothing/under/ms13/bos/officer
	belt = /obj/item/gun/energy/ms13/laser/pistol/advanced/brotherhood
	gloves = /obj/item/clothing/gloves/ms13/bos
	suit_store = /obj/item/gun/energy/ms13/laser/scatter
	r_pocket = /obj/item/stack/ms13/currency/prewar/hunnedfifty
	l_pocket = /obj/item/knife/ms13/combat
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=4,
		/obj/item/stack/medical/gauze/ms13/half=1,
		/obj/item/stack/medical/suture/ms13/eight=1,
		/obj/item/reagent_containers/hypospray/medipen/ms13/stimpak=1,
		/obj/item/flashlight/ms13/mag=1,
		/obj/item/radio/ms13/broadcast/advanced=1,
	)
