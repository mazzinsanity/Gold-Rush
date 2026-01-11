/datum/job/ms13/town_drought/carlin_enforcer
	title = "Carlin Enforcer"
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Sheriff and the Mayor"
	description = "Enforce the Mayor's laws on the streets of Carlin. Follow the orders of the Sheriff and the Mayor."

	outfit = /datum/outfit/job/ms13/town_drought/carlin_enforcer

	display_order = JOB_DISPLAY_ORDER_MS13_CARLINENFORCER

/datum/outfit/job/ms13/town_drought/carlin_enforcer
	name = "_Carlin Enforcer"
	jobtype = /datum/job/ms13/town_drought/carlin_enforcer

	id = /obj/item/card/id/ms13/drought_enforcer
	head = /obj/item/clothing/head/helmet/ms13/enforcer
	glasses = /obj/item/clothing/glasses/ms13/sunglasses
	suit = /obj/item/clothing/suit/armor/ms13/combat/enforcer
	gloves = /obj/item/clothing/gloves/ms13/leather
	shoes = /obj/item/clothing/shoes/ms13/explorer
	l_pocket = /obj/item/knife/ms13/hunting
	back = /obj/item/storage/ms13/satchel
	backpack_contents = list(
		/obj/item/ammo_box/ms13/a357box=1,
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/stack/medical/suture/ms13/four=1,
		/obj/item/restraints/handcuffs/ms13=1,
		/obj/item/flashlight/ms13=1,
	)

/datum/outfit/job/ms13/town_drought/carlin_enforcer/pre_equip(mob/living/carbon/human/H)
	..()

	uniform = pick(
		/obj/item/clothing/under/ms13/wasteland/combat/desert,
		/obj/item/clothing/under/ms13/wasteland/army,
		/obj/item/clothing/under/ms13/wasteland/guard,
		/obj/item/clothing/under/ms13/wasteland/merca,
	)

	suit_store = pick(
		/obj/item/gun/ballistic/rifle/ms13/varmint,
		/obj/item/gun/ballistic/rifle/ms13/hunting/surplus,
		/obj/item/gun/ballistic/revolver/ms13/caravan,
	)

	belt = pick(
		/obj/item/gun/ballistic/revolver/ms13/rev357,
		/obj/item/gun/ballistic/revolver/ms13/rev357/police,
	)

	r_pocket = pick(
		/obj/item/stack/ms13/currency/cap/fifteen,
		/obj/item/stack/ms13/currency/cap/twentyfive,
		/obj/item/stack/ms13/currency/cap/thirtyfive,
	)


/datum/outfit/job/ms13/town_drought/enforcer/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	try_add_ammo_for_suit_store_gun(H)
