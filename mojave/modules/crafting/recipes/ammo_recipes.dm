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

/datum/crafting_recipe/buckshot
	name = "12 gauge buckshot ammo box"
	result = /obj/item/ammo_box/ms13/shotgun/buckshot
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 12,
				/obj/item/stack/sheet/ms13/casings = 12,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_4570
	name = ".45-70 ammo box"
	result = /obj/item/ammo_box/ms13/c4570box
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 16,
				/obj/item/stack/sheet/ms13/casings = 16,
				/obj/item/ms13/component/gunpowder = 1
				)
	category = CAT_STANDARD_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/standard_127
	name = "12.7 ammo box"
	result = /obj/item/ammo_box/ms13/m12mmbox
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/bullets = 21,
				/obj/item/stack/sheet/ms13/casings = 21,
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
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 24,
				/obj/item/stack/sheet/ms13/hq_casings = 24,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/triplebuck
	name = "12 gauge 000 buckshot ammo box"
	result = /obj/item/ammo_box/ms13/shotgun/triplebuck
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 12,
				/obj/item/stack/sheet/ms13/hq_casings = 12,
				/obj/item/ms13/component/gunpowder/hq = 1
				)
	category = CAT_QUALITY_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/a50mg
	name = ".50MG ammo box"
	result = /obj/item/ammo_box/ms13/a50MG
	time = 12 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(/obj/item/stack/sheet/ms13/hq_bullets = 12,
				/obj/item/stack/sheet/ms13/hq_casings = 12,
				/obj/item/ms13/component/gunpowder/hq = 2
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

/datum/crafting_recipe/hq_gp
	name = "high quality gunpowder"
	result = /obj/item/ms13/component/gunpowder/hq
	time = 10 SECONDS
	reqs = list(/obj/item/ms13/component/gunpowder = 1,
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

// MAGAZINES

/datum/crafting_recipe/m45
	name = "7 round magazine (.45)"
	result = /obj/item/ammo_box/magazine/ms13/m45/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/deagle
	name = "8 round magazine (.44)"
	result = /obj/item/ammo_box/magazine/ms13/deagle/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/m10mm
	name = "12 round magazine (10mm)"
	result = /obj/item/ammo_box/magazine/ms13/m10mm/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/cpistol
	name = "\improper Chinese pistol stripper clip (10mm)"
	result = /obj/item/ammo_box/ms13/cpistol/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/m9mm
	name = "13 round magazine (9mm)"
	result = /obj/item/ammo_box/magazine/ms13/m9mm/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/m22
	name = "16 round magazine (.22)"
	result = /obj/item/ammo_box/magazine/ms13/m22/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/m12mm
	name = "7 round magazine (12.7mm)"
	result = /obj/item/ammo_box/magazine/ms13/m12mm/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=2)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/r10
	name = "10 round magazine (5.56mm)"
	result = /obj/item/ammo_box/magazine/ms13/r10/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/r20
	name = "20 round magazine (5.56mm)"
	result = /obj/item/ammo_box/magazine/ms13/r20/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=2)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/r308
	name = "5 round magazine (.308)"
	result = /obj/item/ammo_box/magazine/ms13/r308/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/r308_10
	name = "10 round magazine (.308)"
	result = /obj/item/ammo_box/magazine/ms13/r308_10/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=2)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/smgm10mm
	name = "24 round magazine (10mm)"
	result = /obj/item/ammo_box/magazine/ms13/smgm10mm/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=2)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/smgm9mm
	name = "30 round magazine (9mm)"
	result = /obj/item/ammo_box/magazine/ms13/smgm9mm/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=2)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/smgm45
	name = "50 round drum magazine (.45)"
	result = /obj/item/ammo_box/magazine/ms13/smgm45/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=3)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/smgm22
	name = "60 round magazine (.22)"
	result = /obj/item/ammo_box/magazine/ms13/smgm22/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=3)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/ar762
	name = "24 round magazine (7.62mm)"
	result = /obj/item/ammo_box/magazine/ms13/ar762/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=3)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/r762
	name = "5 round stripper clip (7.62)"
	result = /obj/item/ammo_box/ms13/stripper/r762/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=1)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/battlerifle
	name = "8 round enbloc magazine (.308)"
	result = /obj/item/ammo_box/magazine/ms13/r308/battlerifle/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=2)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/amr
	name = "6 round magazine (.50)"
	result = /obj/item/ammo_box/magazine/ms13/amr/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=3)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/smg12mm
	name = "21 round magazine (12.7mm)"
	result = /obj/item/ammo_box/magazine/ms13/smg12mm/empty
	time = 12 SECONDS
	tool_paths = list(/obj/item/ms13/hammer)
	reqs = list(/obj/item/stack/sheet/ms13/scrap=3)
	category = CAT_MAGAZINES
	crafting_interface = CRAFTING_BENCH_RELOADING | CRAFTING_BENCH_WEAPONS
