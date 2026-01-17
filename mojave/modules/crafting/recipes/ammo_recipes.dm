//Recipes for all kinds of ammo crafting

//AMMO CRAFTING

/datum/crafting_recipe/casings
	name = "twenty bullet casings"
	result = /obj/item/stack/sheet/ms13/casings/twenty
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_brass = 1)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/bullets
	name = "twenty bullets"
	result = /obj/item/stack/sheet/ms13/bullets/twenty
	time = 10 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap_lead = 1)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_22lr
	name = ".22 ammo box"
	result = /obj/item/ammo_box/ms13/c22box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 32,
				/obj/item/stack/sheet/ms13/casings = 32,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_9mm
	name = "9mm ammo box"
	result = /obj/item/ammo_box/ms13/c9mm
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 30,
				/obj/item/stack/sheet/ms13/casings = 30,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_10mm
	name = "10mm ammo box"
	result = /obj/item/ammo_box/ms13/c10mm
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 24,
				/obj/item/stack/sheet/ms13/casings = 24,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_45cal
	name = ".45 ammo box"
	result = /obj/item/ammo_box/ms13/c45
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 21,
				/obj/item/stack/sheet/ms13/casings = 21,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_556mm
	name = "5.56 ammo box"
	result = /obj/item/ammo_box/ms13/a556
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 40,
				/obj/item/stack/sheet/ms13/casings = 40,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_44mag
	name = ".44 ammo box"
	result = /obj/item/ammo_box/ms13/m44box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 24,
				/obj/item/stack/sheet/ms13/casings = 24,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_357mag
	name = ".357 ammo box"
	result = /obj/item/ammo_box/ms13/a357box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 18,
				/obj/item/stack/sheet/ms13/casings = 18,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_308
	name = ".308 ammo box"
	result = /obj/item/ammo_box/ms13/a308
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 20,
				/obj/item/stack/sheet/ms13/casings = 20,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_762
	name = "7.62 ammo box"
	result = /obj/item/ammo_box/ms13/a762
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 24,
				/obj/item/stack/sheet/ms13/casings = 24,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_buckshot
	name = "12 gauge buckshot ammo box"
	result = /obj/item/ammo_box/ms13/shotgun
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 12,
				/obj/item/stack/sheet/ms13/casings = 12,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hq_casings
	name = "twenty high quality bullet casings"
	result = /obj/item/stack/sheet/ms13/hq_casings/twenty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_brass = 1)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/hq_bullets
	name = "twenty high quality bullets"
	result = /obj/item/stack/sheet/ms13/hq_bullets/twenty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/refined_lead = 1)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_22lr
	name = "FMJ .22 ammo box"
	result = /obj/item/ammo_box/ms13/c22box/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 32,
				/obj/item/stack/sheet/ms13/hq_casings = 32,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_9mm
	name = "FMJ 9mm ammo box"
	result = /obj/item/ammo_box/ms13/c9mm/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 30,
				/obj/item/stack/sheet/ms13/hq_casings = 30,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_10mm
	name = "FMJ 10mm ammo box"
	result = /obj/item/ammo_box/ms13/c10mm/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_45cal
	name = "FMJ .45 ammo box"
	result = /obj/item/ammo_box/ms13/c45/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 21,
				/obj/item/stack/sheet/ms13/hq_casings = 21,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_556mm
	name = "FMJ 5.56 ammo box"
	result = /obj/item/ammo_box/ms13/a556/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 40,
				/obj/item/stack/sheet/ms13/hq_casings = 40,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_44mag
	name = "FMJ .44 ammo box"
	result = /obj/item/ammo_box/ms13/m44box/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_357mag
	name = "FMJ .357 ammo box"
	result = /obj/item/ammo_box/ms13/a357box/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 18,
				/obj/item/stack/sheet/ms13/hq_casings = 18,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_308
	name = "FMJ .308 ammo box"
	result = /obj/item/ammo_box/ms13/a308/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 20,
				/obj/item/stack/sheet/ms13/hq_casings = 20,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/fmj_762
	name = "FMJ 7.62 ammo box"
	result = /obj/item/ammo_box/ms13/a762/fmj
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/buckshot
	name = "12 gauge 000 buckshot ammo box"
	result = /obj/item/ammo_box/ms13/shotgun/triplebuck
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list()
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 12,
				/obj/item/stack/sheet/ms13/hq_casings = 12,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

// GUNPOWDER

/datum/crafting_recipe/gp
	name = "gunpowder"
	result = /obj/item/ms13/component/gunpowder
	time = 10 SECONDS
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_coal = 1,
				/obj/item/stack/sheet/ms13/nugget/sulfur = 1)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_CHEM | CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/gp_shaman
	name = "conjure gunpowder"
	result = /obj/item/ms13/component/gunpowder
	time = 16 SECONDS
	trait = TRAIT_DRY_SHAMAN
	reqs = list(/obj/item/stack/sheet/ms13/nugget/nugget_coal = 1,
				/obj/item/stack/sheet/ms13/nugget/sulfur = 1)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_CAMPFIRE

/datum/crafting_recipe/gp_liquid
	name = "dry out liquid gunpowder"
	result = /obj/item/ms13/component/gunpowder
	time = 20 SECONDS
	reqs = list(/datum/reagent/toxin/ms13/gunpowder = 10)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_CHEM | CRAFTING_BENCH_RELOADING
