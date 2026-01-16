/datum/job/ms13/bos/head_scribe
	title = "Brotherhood Head Scribe"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Brotherhood High Command"
	req_admin_notify = 1
	description = "Lead and organize your team of Scribes. Assign Scribes to assist Knights. Work with the Head Paladin to coordinate efforts for the Brotherhood's mission in the region."

	outfit = /datum/outfit/job/ms13/bos/head_scribe

	display_order = JOB_DISPLAY_ORDER_MS13_HEAD_SCRIBE

	mind_traits = list(TRAIT_MEDICAL_TRAINING,  TRAIT_ELECTRICAL_TRAINING, TRAIT_DRUGGIE)

/datum/outfit/job/ms13/bos/head_scribe
	name = "_Brotherhood Head Scribe"
	jobtype = /datum/job/ms13/bos/head_scribe

	id = /obj/item/card/id/ms13/bos/headscribe
	suit = /obj/item/clothing/suit/armor/ms13/scribe/head
	uniform = /obj/item/clothing/under/ms13/bos/officer
	belt = /obj/item/storage/firstaid/ms13/quality
	suit_store = /obj/item/gun/energy/ms13/laser/pistol/advanced/brotherhood
	r_pocket = /obj/item/stack/ms13/currency/prewar/hunnedfifty
	r_hand = /obj/item/storage/ms13/toolbox/filled
	backpack_contents = list(
		/obj/item/stock_parts/cell/ms13/mfc=2,
		/obj/item/flashlight/ms13/mag=1,
		/obj/item/radio/ms13/broadcast/advanced=1,
	)
