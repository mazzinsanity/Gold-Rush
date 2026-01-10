//Guns
/obj/item/gun/ballistic/automatic/ms13/semi/service
	name = "service rifle"
	desc = "A pre-war semi-automatic AR-15 sporting rifle maintained by the Gun Runners and used as the primary infantry weapon of the NCRA. Chambered in 5.56mm."
	icon_state = "service"
	inhand_icon_state = "service"
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/service/service_3.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/service.ogg'
	fire_delay = 0.45 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 5
	recoil = 0.75
	slowdown = 0.75
//	zoomable = FALSE
	mag_type = /obj/item/ammo_box/magazine/ms13/r20
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/service/maquis
	name = "\improper Overture"
	desc = "A pre-war AR-15 sporting rifle with an improved recoil spring and a match-grade barrel, complete with a forward rear sight for accurate shooting. Chambered in 5.56mm, proudly NCR."
	icon_state = "maquis"
	inhand_icon_state = "maquis"
	spread = 2
	recoil = 0.6

/obj/item/gun/ballistic/automatic/ms13/semi/sniper
	name = "sniper rifle"
	desc = "A semi-automatic and high powered but bulky .308 sniper rifle. Perfect weapon for a determined assassin."
	icon_state = "sniper"
	inhand_icon_state = "sniper"
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/sniper/sniperrack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/sniper/sniperrack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_load.ogg' //placeholder
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_load.ogg' //placeholder
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_unload.ogg' //placeholder
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_unload.ogg' //placeholder
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/sniper/sniper2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/sniper.ogg'
	fire_delay = 0.65 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 2
	recoil = 1.5
	slowdown = 1
	mag_type = /obj/item/ammo_box/magazine/ms13/r308
	has_scope = TRUE
	scope_range = 3.5
	grid_width = 224
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/sniper/silencer
	name = "\improper Silencer"
	desc = "A modified sniper rifle with an integrated suppressor and an improved rate of fire and recoil compensation. Whether it's called the Silencer because of it's modification or it's intended purpose is yet to be known."
	icon_state = "silentsniper"
	inhand_icon_state = "silentsniper"
	fire_delay = 0.6 SECONDS
	recoil = 1.15
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	far_fire_sound = null

/obj/item/gun/ballistic/automatic/ms13/semi/marksman
	name = "marksman carbine"
	desc = "A semi-automatic Colt rifle that was specially modified for paratrooper marksmen. It's been fitted with a precision stock and a West-Tek combat gunsight. Chambered in 5.56mm."
	icon_state = "marksman"
	inhand_icon_state = "marksman"
	mag_type = /obj/item/ammo_box/magazine/ms13/r20
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/marksman/marksman2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/marksman.ogg'
	can_suppress = FALSE
	fire_delay = 0.5 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 2
	recoil = 0.6
	slowdown = 0.75
	has_scope = TRUE
	scope_range = 2.5
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/marksman/american
	name = "\improper All-American"
	desc = "A semi-automatic Colt rifle that was specially modified for paratrooper marksmen. It's been fitted with a precision stock and a Future-Tec electronic scope. Chambered in 5.56mm, personally made for the 82nd Airborne Division."
	icon_state = "allamerican"
	inhand_icon_state = "allamerican"
	fire_delay = 0.45 SECONDS

/obj/item/gun/ballistic/automatic/ms13/semi/battle
	name = "battle rifle"
	desc = "A gas-operated, semi-automatic, clip-fed pre-war rifle. It's been refurbished by the Gun Runners and enjoys a cozy spot in their Big Book of Death, it even makes a cool reloading sound. The rifle, not the book. Chambered in .308."
	icon_state = "battlerifle"
	inhand_icon_state = "battler"
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/battle_rifle/battle_unload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/battlerifle.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/battlerifle.ogg'
	fire_delay = 0.6 SECONDS
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 4
	recoil = 1.75
	slowdown = 0.75
	mag_type = /obj/item/ammo_box/magazine/ms13/r308_10
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/semi/battle/update_icon_state()
	worn_icon_state = "[initial(icon_state)]"
	if(!chambered && magazine) //this makes the sks empty, the state with a magazine, not necassarily empty just not chambered
		icon_state = "[initial(icon_state)]_mag_empty"

	if(!chambered && !magazine) //this makes the sks empty, the state with nothing
		icon_state = "[initial(icon_state)]_empty"

	if(chambered && !magazine) //this makes the sks chambered, the state with no magazine
		icon_state = "[initial(icon_state)]_cham_empty"

	if(chambered && magazine) //this makes the sks full state when chambered and they have a magazine
		icon_state = "[initial(icon_state)]"
	return ..()

/obj/item/gun/ballistic/automatic/ms13/semi/battle/rangemaster
	name = "\improper Rangemaster"
	desc = "A heavy duty semi-automatic .308 rifle with a scope and heavier rifling to reduce spread and recoil, though the added weight will slow down the user."
	icon_state = "rangemaster"
	inhand_icon_state = "rangemaster"
	has_scope = TRUE
	scope_range = 2.5
	spread = 2
	recoil = 1.5
	slowdown = 1

// And now I will be switching the firearm to fully semi-automatic mode. //

/obj/item/gun/ballistic/automatic/ms13/full/smg45
	name = ".45 submachine gun"
	desc = "A classic, American-made Thompson M1A1 submachine gun chambered in .45 Auto. It feeds from a large drum."
	icon_state = "smg45"
	inhand_icon_state = "smg45"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm45
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/45/45smg_rack.ogg' //placeholder - this is pretty bad
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/45/45smg_rack.ogg' //placeholder - this is pretty bad
	load_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_load.ogg' //placeholder
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_load.ogg' //placeholder
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_unload.ogg' //placeholder
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_unload.ogg' //placeholder
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/45/45auto3.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/45_pistol.ogg'
	can_suppress = FALSE
	fire_delay = 0.25 SECONDS
	spread = 12
	recoil = 0.75
	slowdown = 0.75
	grid_width = 128
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg22
	name = ".22 submachine gun"
	desc = "An integrally suppressed American 180 riot suppression submachine gun chambered in .22 LR, feeding from top-loaded pan magazines."
	icon_state = "smg22"
	inhand_icon_state = "smg22"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm22
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_unload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/22_smg.ogg'
	fire_delay = 0.2 SECONDS
	spread = 12
	recoil = 0.2
	slowdown = 0.75
	grid_width = 128
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg10mm
	name = "10mm submachine gun"
	desc = "An open-bolt Heckler & Koch MP9 that saw extensive use in military and police units prior to the war, chambered in 10mm despite its name."
	icon_state = "smg10mm"
	inhand_icon_state = "smg10mm"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm10mm
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_rack2.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_rack2.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_load2.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_load2.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_unload2.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_unload2.ogg'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/10mmsmg1.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/10mm_smg.ogg'
	fire_delay = 0.2 SECONDS
	spread = 15
	recoil = 0.75
	force = 10
	slowdown = 0.5
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg9mm
	name = "9mm submachine gun"
	desc = "A compact and reliable Uzi SMG chambered for 9mm, best paired with a .45 longslide with laser sighting."
	icon_state = "smg9mm"
	inhand_icon_state = "smg9mm"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/ms13/smgm9mm
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smgrack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smgrack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smgload.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smgload.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smgunload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smgunload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/greasegun.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/greasegun.ogg'
	can_suppress = FALSE
	fire_delay = 0.2 SECONDS
	spread = 15
	recoil = 0.35
	force = 10
	slowdown = 0.5
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/smg12mm
	name = "12.7mm submachine gun"
	desc = "A SIG-made hand-cannon chambered for the 12.7mm hunting cartridge, loading from top-mounted magazines and benefitting from an unique recoil reduction system."
	icon_state = "smg12mm"
	inhand_icon_state = "smg12mm"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/ms13/smg12mm
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_rack2.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/10mmsmg/smg_rack2.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_load.ogg' //placeholder
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_load.ogg' //placeholder
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_unload.ogg' //placeholder
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/22/22smg_unload.ogg' //placeholder
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/12mm/m12mm2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/12mm_smg.ogg'
	can_suppress = FALSE
	fire_delay = 0.35 SECONDS
	force = 10
	spread = 10
	recoil = 1.25
	slowdown = 0.5
	grid_width = 96
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle
	name = "assault rifle"
	desc = "A general purpose, standard automatic assault rifle chambered in 5.56. Commonly used by pre-war US military forces."
	icon_state = "assaultrifle"
	inhand_icon_state = "assaultrifle"
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ms13/r20
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/assault/arrack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/assault/arrack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/assault/arload2.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/assault/arload2.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/assault/arunload2.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/assault/arunload2.ogg'
	fire_sound = 'mojave/sound/ms13weapons/arfire.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/arfire.ogg'
	fire_delay = 0.25 SECONDS
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	spread = 8
	recoil = 0.6
	slowdown = 0.75
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/proto_service
	name = "upgraded service rifle"
	desc = "A fully-automatic service rifle with a heavier barrel, lighter furniture, and a dot-sight. Issued to high-ranking troopers and specialized units. Chambered in 5.56mm."
	icon_state = "protoservice"
	inhand_icon_state = "protoservice"
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/gunsounds/service/service_2.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/service.ogg'
	fire_delay = 0.3 SECONDS
	recoil = 0.75

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/infiltrator
	name = "\improper Infiltrator"
	desc = "An especially tuned and modified R91 rifle manufactured by Stent Security Solutions. The name's Plissken. Chambered in 5.56mm."
	icon_state = "infiltrator"
	inhand_icon_state = "infiltrator"
	has_scope = TRUE
	scope_range = 2.5
	fire_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	far_fire_sound = null
	w_class = WEIGHT_CLASS_BULKY
	spread = 4
	recoil = 0.35
	slowdown = 1
	grid_width = 160
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/dakka
	desc = "A stripped and heavily modified assault rifle. Faster rate of fire, but with substantially less accuracy and much more recoil. An unstable and dangerous weapon made for an unstable and dangerous individual."
	icon_state = "m16stripped"
	inhand_icon_state = "m16stripped"
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/service/ar_unload.ogg'
	fire_delay = 0.2 SECONDS
	w_class = WEIGHT_CLASS_BULKY
	spread = 15
	recoil = 1.15
	grid_width = 160
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/dakka/Initialize()
	. = ..()
	name = pick(
		"\improper Shitbox",\
		"\improper Hoopty",\
		"\improper P-O-S")

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese
	name = "\improper Chinese assault rifle"
	desc = "A Chinese made assault rifle chambered in the heavier 7.62 round, packs a bigger punch in exchange for higher recoil and a slower rate of fire."
	icon_state = "chinesear"
	inhand_icon_state = "chinesear"
	mag_type = /obj/item/ammo_box/magazine/ms13/ar762
	rack_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/ak_rack.ogg'
	bolt_drop_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/ak_rack.ogg'
	load_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/ak_load.ogg'
	load_empty_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/ak_load.ogg'
	eject_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/ak_unload.ogg'
	eject_empty_sound = 'mojave/sound/ms13weapons/gunsounds/chinese/ak_unload.ogg'
	fire_sound = 'mojave/sound/ms13weapons/chinesearfire.ogg'
	far_fire_sound = 'mojave/sound/ms13weapons/distant_shots/chinesearfire.ogg'
	fire_delay = 0.35 SECONDS
	spread = 8
	recoil = 1
	slowdown = 0.75
	grid_width = 192
	grid_height = 64

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/handmade
	name = "handmade assault rifle"
	desc = "A decent quality handmade assault rifle chambered in 7.62, the makeshift qualities of it reduces it's accuracy and increases it's recoil by a lot."
	icon_state = "handmadear"
	inhand_icon_state = "handmadear"
	spread = 12
	recoil = 1.5

/obj/item/gun/ballistic/automatic/ms13/full/assaultrifle/chinese/xuanlong
	name = "\improper Xuanlong assault rifle"
	desc = "A modified Chinese assault rifle sporting a more stable stock and a scope for improved accuracy and recoil. The added weight from the scope will slow down the user."
	icon_state = "xuanlong"
	inhand_icon_state = "xuanlong"
	has_scope = TRUE
	scope_range = 2
	spread = 6
	recoil = 0.75
	slowdown = 1

//Magazines
/obj/item/ammo_box/magazine/ms13/r20
	name = "20 round magazine (5.56mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "556r20"
	ammo_type = /obj/item/ammo_casing/ms13/a556
	caliber = "a556"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 20
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm10mm
	name = "24 round magazine (10mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "smg10mm"
	ammo_type = /obj/item/ammo_casing/ms13/c10mm
	caliber = "10mm"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 24
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm9mm
	name = "30 round magazine (9mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "smg9mm"
	ammo_type = /obj/item/ammo_casing/ms13/c9mm
	caliber = "9mm"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 30
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm45
	name = "50 round drum magazine (.45)"
	icon_state = "smg45"
	ammo_type = /obj/item/ammo_casing/ms13/c45
	caliber = ".45"
	w_class = WEIGHT_CLASS_NORMAL
	max_ammo = 50
	grid_width = 64
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/ar762
	name = "24 round magazine (7.62mm)"
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "ar762"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 24
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smgm22
	name = "60 round magazine (.22)"
	icon_state = "smg22"
	ammo_type = /obj/item/ammo_casing/ms13/c22
	caliber = ".22"
	w_class = WEIGHT_CLASS_NORMAL
	max_ammo = 60
	grid_width = 64
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/smg12mm
	name = "21 round magazine (12.7mm)"
	icon_state = "smg12mm"
	ammo_type = /obj/item/ammo_casing/ms13/m12mm
	caliber = "12.7mm"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 21
	grid_width = 32
	grid_height = 64

/obj/item/ammo_box/magazine/ms13/r308_10
	name = "10 round magazine (.308)"
	icon_state = "rangemaster"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 10
	grid_width = 32
	grid_height = 64
