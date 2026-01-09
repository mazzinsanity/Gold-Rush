/datum/job/ms13/legion/legion_smith
	title = "Legion Blacksmith"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Legionaries."
	forbid = "Usage of chems and overreliance on technology is strictly forbidden. Women are not allowed to fight. Disobeying orders from superiors is typically met with death. Avoid engaging in active combat."
	description = "You are an Auxilia, ordered to assist the Legion's army. Ensure the camp is well maintained. Ensure the Legionaries are properly supplied and armed for the battles to come. Obey the orders of the Legionaries."

	outfit = /datum/outfit/job/ms13/legion/legion_smith

	display_order = JOB_DISPLAY_ORDER_MS13_LEGIONSMITH

	mind_traits = list(TRAIT_LEGION_SMITHING)

/datum/outfit/job/ms13/legion/legion_smith
	name = "_Legion Blacksmith"
	jobtype = /datum/job/ms13/legion/legion_smith

	shoes = /obj/item/clothing/shoes/ms13/military/legion/darkboots
	gloves = /obj/item/clothing/gloves/ms13/legion/tan
	r_hand = /obj/item/storage/ms13/toolbox/filled
	id = /obj/item/card/id/ms13/blacksmith
	backpack_contents = list(
		/obj/item/stack/medical/gauze/ms13/three=1,
		/obj/item/flashlight/flare/ms13=1,
	)
