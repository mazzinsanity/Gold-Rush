/obj/item/bodypart
	name = "limb"
	desc = "Why is it detached..."
	force = 3
	throwforce = 3
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/mob/human_parts.dmi'
	icon_state = ""
	/// The icon for Organic limbs using greyscale
	var/icon_greyscale = DEFAULT_BODYPART_ICON_ORGANIC
	/// The icon for Robotic limbs
	var/icon_robotic = DEFAULT_BODYPART_ICON_ROBOTIC
	layer = BELOW_MOB_LAYER //so it isn't hidden behind objects when on the floor
	grind_results = list(/datum/reagent/bone_dust = 10, /datum/reagent/liquidgibs = 5) // robotic bodyparts and chests/heads cannot be ground
	var/mob/living/carbon/owner
	var/datum/weakref/original_owner
	/// If this limb can be scarred.
	var/scarrable = TRUE
	/**
	 * A bitfield of biological states, exclusively used to determine which wounds this limb will get,
	 * as well as how easily it will happen.
	 * Set to BIO_STANDARD_UNJOINTED because most species have both flesh bone and blood in their limbs.
	 */
	var/biological_state = BIO_STANDARD_UNJOINTED
	var/needs_processing = FALSE
	/// In the case we dont have dismemberable features, or literally cant get wounds, we will use this percent to determine when we can be dismembered.
	/// Compared to our ABSOLUTE maximum. Stored in decimal; 0.8 = 80%.
	var/hp_percent_to_dismemberable = 0.8
	/// If true, we will use [hp_percent_to_dismemberable] even if we are dismemberable via wounds. Useful for things with extreme wound resistance.
	var/use_alternate_dismemberment_calc_even_if_mangleable = FALSE
	/// If false, no wound that can be applied to us can mangle our exterior. Used for determining if we should use [hp_percent_to_dismemberable] instead of normal dismemberment.
	var/any_existing_wound_can_mangle_our_exterior
	/// If false, no wound that can be applied to us can mangle our interior. Used for determining if we should use [hp_percent_to_dismemberable] instead of normal dismemberment.
	var/any_existing_wound_can_mangle_our_interior

	/// BODY_ZONE_CHEST, BODY_ZONE_L_ARM, etc , used for def_zone
	var/body_zone
	var/aux_zone // used for hands
	var/aux_layer
	/// bitflag used to check which clothes cover this bodypart
	var/body_part
	/// Used for alternate legs, useless elsewhere
	var/use_digitigrade = NOT_DIGITIGRADE
	var/list/embedded_objects = list()
	/// are we a hand? if so, which one!
	var/held_index = 0
	/// For limbs that don't really exist, eg chainsaws
	var/is_pseudopart = FALSE

	///If disabled, limb is as good as missing.
	var/bodypart_disabled = FALSE
	///Multiplied by max_damage it returns the threshold which defines a limb being disabled or not. From 0 to 1. 0 means no disable thru damage
	var/disable_threshold = 0
	///Controls whether bodypart_disabled makes sense or not for this limb.
	var/can_be_disabled = FALSE
	///Multiplier of the limb's damage that gets applied to the mob
	var/body_damage_coeff = 1
	var/stam_damage_coeff = 0.75
	var/brutestate = 0
	var/burnstate = 0
	var/brute_dam = 0
	var/burn_dam = 0
	var/stamina_dam = 0
	var/max_stamina_damage = 0
	var/max_damage = 0
	///Gradually increases while burning when at full damage, destroys the limb when at 100
	var/cremation_progress = 0
	///Subtracted to brute damage taken
	var/brute_reduction = 0
	///Subtracted to burn damage taken
	var/burn_reduction = 0
	//Coloring and proper item icon update
	var/skin_tone = ""
	var/body_gender = ""
	var/species_id = ""
	var/should_draw_gender = FALSE
	var/should_draw_greyscale = FALSE
	var/species_color = ""
	var/mutation_color = ""
	var/no_update = 0

	///for nonhuman bodypart (e.g. monkey)
	var/animal_origin
	//for all bodyparts
	var/part_origin = HUMAN_BODY
	///whether it can be dismembered with a weapon.
	var/dismemberable = 1

	var/px_x = 0
	var/px_y = 0

	var/species_flags_list = list()
	///the type of damage overlay (if any) to use when this bodypart is bruised/burned.
	var/dmg_overlay_type
	/// If we're bleeding, which icon are we displaying on this part
	var/bleed_overlay_icon

	//Damage messages used by help_shake_act()
	var/light_brute_msg = "bruised"
	var/medium_brute_msg = "battered"
	var/heavy_brute_msg = "mangled"

	var/light_burn_msg = "numb"
	var/medium_burn_msg = "blistered"
	var/heavy_burn_msg = "peeling away"

	/// The wounds currently afflicting this body part
	var/list/wounds

	/// The scars currently afflicting this body part
	var/list/scars
	/// Our current stored wound damage multiplier
	var/wound_damage_multiplier = 1

	/// This number is subtracted from all wound rolls on this bodypart, higher numbers mean more defense, negative means easier to wound
	var/wound_resistance = 0
	/// When this bodypart hits max damage, this number is added to all wound rolls. Obviously only relevant for bodyparts that have damage caps.
	var/disabled_wound_penalty = 15

	/// A hat won't cover your face, but a shirt covering your chest will cover your... you know, chest
	var/scars_covered_by_clothes = TRUE
	/// So we know if we need to scream if this limb hits max damage
	var/last_maxed
	/// Our current bleed rate. Cached, update with refresh_bleed_rate()
	var/cached_bleed_rate = 0
	/// How much generic bleedstacks we have on this bodypart
	var/generic_bleedstacks
	/// If we have a gauze wrapping currently applied 	// MOJAVE SUN EDIT - ORIGINAL IS /// If we have a gauze wrapping currently applied (not including splints)
	var/datum/bodypart_aid/gauze/current_gauze 	// MOJAVE SUN EDIT - ORIGINAL IS var/obj/item/stack/current_gauze
	/// If we have a splint currently applied // MOJAVE SUN EDIT
	var/datum/bodypart_aid/splint/current_splint // MOJAVE SUN EDIT
	/// If something is currently grasping this bodypart and trying to staunch bleeding (see [/obj/item/self_grasp])
	var/obj/item/self_grasp/grasped_by


/obj/item/bodypart/Initialize(mapload)
	. = ..()
	if(can_be_disabled)
		RegisterSignal(src, SIGNAL_ADDTRAIT(TRAIT_PARALYSIS), PROC_REF(on_paralysis_trait_gain))
		RegisterSignal(src, SIGNAL_REMOVETRAIT(TRAIT_PARALYSIS), PROC_REF(on_paralysis_trait_loss))
	if(!(biological_state & BIO_STANDARD))
		grind_results = null

/obj/item/bodypart/Destroy()
	if(owner)
		owner.remove_bodypart(src)
		set_owner(null)
	for(var/wound in wounds)
		qdel(wound) // wounds is a lazylist, and each wound removes itself from it on deletion.
	if(length(wounds))
		stack_trace("[type] qdeleted with [length(wounds)] uncleared wounds")
		wounds.Cut()
	// MOJAVE SUN EDIT BEGIN
	if(current_gauze)
		qdel(current_gauze)
	if(current_splint)
		qdel(current_splint)
	// MOJAVE SUN EDIT END
	return ..()


/obj/item/bodypart/examine(mob/user)
	. = ..()
	if(brute_dam > DAMAGE_PRECISION)
		. += span_warning("This limb has [brute_dam > 30 ? "severe" : "minor"] bruising.")
	if(burn_dam > DAMAGE_PRECISION)
		. += span_warning("This limb has [burn_dam > 30 ? "severe" : "minor"] burns.")

	if(locate(/datum/wound/blunt) in wounds)
		. += span_warning("The bones in this limb appear badly cracked.")
	if(locate(/datum/wound/slash) in wounds)
		. += span_warning("The flesh on this limb appears badly lacerated.")
	if(locate(/datum/wound/pierce/bleed) in wounds)
		. += span_warning("The flesh on this limb appears badly perforated.")
	if(locate(/datum/wound/burn) in wounds)
		. += span_warning("The flesh on this limb appears badly cooked.")

/obj/item/bodypart/blob_act()
	take_damage(max_damage)


/obj/item/bodypart/attack(mob/living/carbon/victim, mob/user)
	if(ishuman(victim))
		var/mob/living/carbon/human/human_victim = victim
		if(HAS_TRAIT(victim, TRAIT_LIMBATTACHMENT))
			if(!human_victim.get_bodypart(body_zone) && !animal_origin)
				user.temporarilyRemoveItemFromInventory(src, TRUE)
				if(!attach_limb(victim))
					to_chat(user, span_warning("[human_victim]'s body rejects [src]!"))
					forceMove(human_victim.loc)
				if(human_victim == user)
					human_victim.visible_message(span_warning("[human_victim] jams [src] into [human_victim.p_their()] empty socket!"),\
					span_notice("You force [src] into your empty socket, and it locks into place!"))
				else
					human_victim.visible_message(span_warning("[user] jams [src] into [human_victim]'s empty socket!"),\
					span_notice("[user] forces [src] into your empty socket, and it locks into place!"))
				return
	..()

/* MOJAVE SUN EDIT REMOVAL
/obj/item/bodypart/attackby(obj/item/weapon, mob/user, params)
	if(weapon.get_sharpness())
		add_fingerprint(user)
		if(!contents.len)
			to_chat(user, span_warning("There is nothing left inside [src]!"))
			return
		playsound(loc, 'sound/weapons/slice.ogg', 50, TRUE, -1)
		user.visible_message(span_warning("[user] begins to cut open [src]."),\
			span_notice("You begin to cut open [src]..."))
		if(do_after(user, 54, target = src))
			drop_organs(user, TRUE)
	else
		return ..()
*/

/obj/item/bodypart/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..()
	if(!(biological_state & BIO_ROBOTIC))
		playsound(get_turf(src), 'sound/misc/splort.ogg', 50, TRUE, -1)
	pixel_x = rand(-3, 3)
	pixel_y = rand(-3, 3)

//empties the bodypart from its organs and other things inside it
/obj/item/bodypart/proc/drop_organs(mob/user, violent_removal)
	var/turf/bodypart_turf = get_turf(src)
	if(!(biological_state & BIO_ROBOTIC))
		playsound(bodypart_turf, 'sound/misc/splort.ogg', 50, TRUE, -1)
	// MOJAVE SUN EDIT BEGIN - ORIGINAL IS seep_gauze(9999) // destroy any existing gauze if any exists
	if(current_gauze)
		qdel(current_gauze)
	if(current_splint)
		qdel(current_splint)
	// MOJAVE SUN EDIT END
	for(var/obj/item/organ/bodypart_organ in get_organs())
		bodypart_organ.transfer_to_limb(src, owner)
	for(var/obj/item/item_in_bodypart in src)
		item_in_bodypart.forceMove(bodypart_turf)

///since organs aren't actually stored in the bodypart themselves while attached to a person, we have to query the owner for what we should have
/obj/item/bodypart/proc/get_organs()
	if(!owner)
		return FALSE

	var/list/bodypart_organs
	for(var/obj/item/organ/organ_check as anything in owner.internal_organs) //internal organs inside the dismembered limb are dropped.
		if(check_zone(organ_check.zone) == body_zone)
			LAZYADD(bodypart_organs, organ_check) // this way if we don't have any, it'll just return null

	return bodypart_organs


//Return TRUE to get whatever mob this is in to update health.
/obj/item/bodypart/proc/on_life(delta_time, times_fired, stam_regen)
	if(stamina_dam > DAMAGE_PRECISION && stam_regen) //DO NOT update health here, it'll be done in the carbon's life.
		heal_damage(0, 0, INFINITY, null, FALSE)
		. |= BODYPART_LIFE_UPDATE_HEALTH

//Applies brute and burn damage to the organ. Returns 1 if the damage-icon states changed at all.
//Damage will not exceed max_damage using this proc
//Cannot apply negative damage
/* MOJAVE EDIT REMOVAL
/obj/item/bodypart/proc/receive_damage(brute = 0, burn = 0, stamina = 0, blocked = 0, updating_health = TRUE, required_status = null, wound_bonus = 0, bare_wound_bonus = 0, sharpness = NONE, attack_direction = null)
*/
//MOJAVE EDIT BEGIN
/obj/item/bodypart/proc/receive_damage(brute = 0, \
									burn = 0, \
									stamina = 0, \
									blocked = 0, \
									updating_health = TRUE, \
									required_status = null, \
									wound_bonus = 0, \
									bare_wound_bonus = 0, \
									sharpness = NONE, \
									attack_direction = null, \
									reduced = 0, \
									edge_protection = 0, \
									subarmor_flags = NONE)
//MOJAVE EDIT END
	var/hit_percent = (100-blocked)/100
	if((!brute && !burn && !stamina) || hit_percent <= 0)
		return FALSE
	if(owner && (owner.status_flags & GODMODE))
		return FALSE //godmode

	if(required_status && !(biological_state & required_status))
		return FALSE

	var/dmg_multi = CONFIG_GET(number/damage_multiplier) * hit_percent
	brute = round(max(brute * dmg_multi, 0),DAMAGE_PRECISION)
	burn = round(max(burn * dmg_multi, 0),DAMAGE_PRECISION)
	stamina = round(max(stamina * dmg_multi, 0),DAMAGE_PRECISION)
	brute = max(0, brute - brute_reduction)
	burn = max(0, burn - burn_reduction)
	//MOJAVE EDIT BEGIN
	if(reduced)
		if(brute >= burn)
			var/brute_before = brute
			brute = round(max(brute - reduced, MAXIMUM_ARMOR_REDUCTION * brute), DAMAGE_PRECISION)
			if(subarmor_flags & SUBARMOR_FLEXIBLE)
				brute += FLOOR((brute_before - brute) * 0.1, 1)
		else
			burn = round(max(burn - reduced, burn * MAXIMUM_ARMOR_REDUCTION), DAMAGE_PRECISION)
	//MOJAVE EDIT END
	//No stamina scaling.. for now..

	if(!brute && !burn && !stamina)
		return FALSE

	brute *= wound_damage_multiplier
	burn *= wound_damage_multiplier

	switch(animal_origin)
		if(ALIEN_BODYPART,LARVA_BODYPART) //aliens take double burn //nothing can burn with so much snowflake code around
			burn *= 2

	/*
	// START WOUND HANDLING
	*/

	// what kind of wounds we're gonna roll for, take the greater between brute and burn, then if it's brute, we subdivide based on sharpness
	var/wounding_type = (brute > burn ? WOUND_BLUNT : WOUND_BURN)
	var/wounding_dmg = max(brute, burn)
	/* MOJAVE EDIT REMOVAL
	if(wounding_type == WOUND_BLUNT && sharpness)
	*/
	//MOJAVE EDIT BEGIN
	if(sharpness && (wounding_type == WOUND_BLUNT) && (wounding_dmg > edge_protection))
	//MOJAVE EDIT END
		if(sharpness & SHARP_EDGED)
			wounding_type = WOUND_SLASH
		else if (sharpness & SHARP_POINTY || sharpness & SHARP_IMPALING) //MOJAVE EDIT - Makes it so impaling sharpness class inflicts pierce/stab wounds.
			wounding_type = WOUND_PIERCE

	if(owner) // i tried to modularize the below, but the modifications to wounding_dmg and wounding_type cant be extracted to a proc
		var/mangled_state = get_mangled_state()
		var/easy_dismember = HAS_TRAIT(owner, TRAIT_EASYDISMEMBER) // if we have easydismember, we don't reduce damage when redirecting damage to different types (slashing weapons on mangled/skinless limbs attack at 100% instead of 50%)

		var/bio_status = get_bio_state_status()

		var/has_exterior = ((bio_status & ANATOMY_EXTERIOR))
		var/has_interior = ((bio_status & ANATOMY_INTERIOR))

		var/exterior_ready_to_dismember = (!has_exterior || ((mangled_state & BODYPART_MANGLED_EXTERIOR)))

		// if we're bone only, all cutting attacks go straight to the bone
		if(!has_exterior && has_interior)
			if(wounding_type == WOUND_SLASH)
				wounding_type = WOUND_BLUNT
				wounding_dmg *= (easy_dismember ? 1 : 0.6)
			else if(wounding_type == WOUND_PIERCE)
				wounding_type = WOUND_BLUNT
				wounding_dmg *= (easy_dismember ? 1 : 0.75)
		else
			// if we've already mangled the skin (critical slash or piercing wound), then the bone is exposed, and we can damage it with sharp weapons at a reduced rate
			// So a big sharp weapon is still all you need to destroy a limb
			if(has_interior && exterior_ready_to_dismember && !(mangled_state & BODYPART_MANGLED_INTERIOR) && sharpness)
				if(wounding_type == WOUND_SLASH && !easy_dismember)
					wounding_dmg *= 0.6 // edged weapons pass along 60% of their wounding damage to the bone since the power is spread out over a larger area
				if(wounding_type == WOUND_PIERCE && !easy_dismember)
					wounding_dmg *= 0.75 // piercing weapons pass along 75% of their wounding damage to the bone since it's more concentrated
				wounding_type = WOUND_BLUNT
		if ((dismemberable_by_wound() || dismemberable_by_total_damage()) && try_dismember(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus))
			return
		// now we have our wounding_type and are ready to carry on with wounds and dealing the actual damage
		if(wounding_dmg >= WOUND_MINIMUM_DAMAGE && wound_bonus != CANT_WOUND)
			// MOJAVE SUN EDIT BEGIN
			if(current_gauze)
				current_gauze.take_damage()
			if(current_splint)
				current_splint.take_damage()
			// MOJAVE SUN EDIT END
			check_wounding(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus, attack_direction)

	for(var/datum/wound/iter_wound as anything in wounds)
		iter_wound.receive_damage(wounding_type, wounding_dmg, wound_bonus)

	/*
	// END WOUND HANDLING
	*/

	//back to our regularly scheduled program, we now actually apply damage if there's room below limb damage cap
	var/can_inflict = max_damage - get_damage()
	var/total_damage = brute + burn
	if(total_damage > can_inflict && total_damage > 0) // TODO: the second part of this check should be removed once disabling is all done
		var/spillover_brute = brute
		var/spillover_burn = burn

		brute = round(brute * (can_inflict / total_damage),DAMAGE_PRECISION)
		burn = round(burn * (can_inflict / total_damage),DAMAGE_PRECISION)

		spillover_brute -= brute
		spillover_burn -= burn
		var/mob/living/carbon/limb_owner = owner
		var/obj/item/bodypart/chest = limb_owner.get_bodypart(BODY_ZONE_CHEST)
		chest.receive_damage(spillover_brute * chest.body_damage_coeff, spillover_burn * chest.body_damage_coeff, wound_bonus=CANT_WOUND)

	if(can_inflict <= 0)
		return FALSE
	if(brute)
		set_brute_dam(brute_dam + brute)
	if(burn)
		set_burn_dam(burn_dam + burn)

	//We've dealt the physical damages, if there's room lets apply the stamina damage.
	if(stamina)
		set_stamina_dam(stamina_dam + round(clamp(stamina, 0, max_stamina_damage - stamina_dam), DAMAGE_PRECISION))

	if(owner)
		if(can_be_disabled)
			update_disabled()
		if(updating_health)
			owner.updatehealth()
			if(stamina > DAMAGE_PRECISION)
				owner.update_stamina()
				owner.stam_regen_start_time = world.time + STAMINA_REGEN_BLOCK_TIME
				. = TRUE
	return update_bodypart_damage_state() || .

/// Returns a bitflag using ANATOMY_EXTERIOR or ANATOMY_INTERIOR. Used to determine if we as a whole have a interior or exterior biostate, or both.
/obj/item/bodypart/proc/get_bio_state_status()
	SHOULD_BE_PURE(TRUE)

	var/bio_status = NONE

	for (var/state as anything in GLOB.bio_state_anatomy)
		var/flag = text2num(state)
		if (!(biological_state & flag))
			continue

		var/value = GLOB.bio_state_anatomy[state]
		if (value & ANATOMY_EXTERIOR)
			bio_status |= ANATOMY_EXTERIOR
		if (value & ANATOMY_INTERIOR)
			bio_status |= ANATOMY_INTERIOR

		if ((bio_status & ANATOMY_EXTERIOR_AND_INTERIOR) == ANATOMY_EXTERIOR_AND_INTERIOR)
			break

	return bio_status

/// Returns if our current mangling status allows us to be dismembered. Requires both no exterior/mangled exterior and no interior/mangled interior.
/obj/item/bodypart/proc/dismemberable_by_wound()
	SHOULD_BE_PURE(TRUE)

	var/mangled_state = get_mangled_state()

	var/bio_status = get_bio_state_status()

	var/has_exterior = ((bio_status & ANATOMY_EXTERIOR))
	var/has_interior = ((bio_status & ANATOMY_INTERIOR))

	var/exterior_ready_to_dismember = (!has_exterior || ((mangled_state & BODYPART_MANGLED_EXTERIOR)))
	var/interior_ready_to_dismember = (!has_interior || ((mangled_state & BODYPART_MANGLED_INTERIOR)))

	return (exterior_ready_to_dismember && interior_ready_to_dismember)

/// Returns TRUE if our total percent damage is more or equal to our dismemberable percentage, but FALSE if a wound can cause us to be dismembered.
/obj/item/bodypart/proc/dismemberable_by_total_damage()

	update_wound_theory()

	var/bio_status = get_bio_state_status()

	var/has_interior = ((bio_status & ANATOMY_INTERIOR))
	var/can_theoretically_be_dismembered_by_wound = (any_existing_wound_can_mangle_our_interior || (any_existing_wound_can_mangle_our_exterior && has_interior))

	var/wound_dismemberable = dismemberable_by_wound()
	var/ready_to_use_alternate_formula = (use_alternate_dismemberment_calc_even_if_mangleable || (!wound_dismemberable && !can_theoretically_be_dismembered_by_wound))

	if (ready_to_use_alternate_formula)
		var/percent_to_total_max = (get_damage() / max_damage)
		if (percent_to_total_max >= hp_percent_to_dismemberable)
			return TRUE

	return FALSE

/// Updates our "can be theoretically dismembered by wounds" variables by iterating through all wound static data.
/obj/item/bodypart/proc/update_wound_theory()
	// We put this here so we dont increase init time by doing this all at once on initialization
	// Effectively, we "lazy load"
	if (isnull(any_existing_wound_can_mangle_our_interior) || isnull(any_existing_wound_can_mangle_our_exterior))
		any_existing_wound_can_mangle_our_interior = FALSE
		any_existing_wound_can_mangle_our_exterior = FALSE
		for (var/datum/wound/wound_type as anything in GLOB.all_wound_pregen_data)
			var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[wound_type]
			if (!pregen_data.can_be_applied_to(src, random_roll = TRUE)) // we only consider randoms because non-randoms are usually really specific
				continue
			if (initial(pregen_data.wound_path_to_generate.wound_flags) & MANGLES_EXTERIOR)
				any_existing_wound_can_mangle_our_exterior = TRUE
			if (initial(pregen_data.wound_path_to_generate.wound_flags) & MANGLES_INTERIOR)
				any_existing_wound_can_mangle_our_interior = TRUE

			if (any_existing_wound_can_mangle_our_interior && any_existing_wound_can_mangle_our_exterior)
				break

/// Allows us to roll for and apply a wound without actually dealing damage. Used for aggregate wounding power with pellet clouds
/obj/item/bodypart/proc/painless_wound_roll(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus, sharpness=NONE)
	SHOULD_CALL_PARENT(TRUE)

	if(!owner || wounding_dmg <= WOUND_MINIMUM_DAMAGE || wound_bonus == CANT_WOUND || (owner.status_flags & GODMODE))
		return

	var/mangled_state = get_mangled_state()
	var/easy_dismember = HAS_TRAIT(owner, TRAIT_EASYDISMEMBER) // if we have easydismember, we don't reduce damage when redirecting damage to different types (slashing weapons on mangled/skinless limbs attack at 100% instead of 50%)

	var/bio_status = get_bio_state_status()

	var/has_exterior = ((bio_status & ANATOMY_EXTERIOR))
	var/has_interior = ((bio_status & ANATOMY_INTERIOR))

	var/exterior_ready_to_dismember = (!has_exterior || ((mangled_state & BODYPART_MANGLED_EXTERIOR)))

	// if we're bone only, all cutting attacks go straight to the bone
	if(!has_exterior && has_interior)
		if(wounding_type == WOUND_SLASH)
			wounding_type = WOUND_BLUNT
			wounding_dmg *= (easy_dismember ? 1 : 0.6)
		else if(wounding_type == WOUND_PIERCE)
			wounding_type = WOUND_BLUNT
			wounding_dmg *= (easy_dismember ? 1 : 0.75)
	else
		// if we've already mangled the skin (critical slash or piercing wound), then the bone is exposed, and we can damage it with sharp weapons at a reduced rate
		// So a big sharp weapon is still all you need to destroy a limb
		if(has_interior && exterior_ready_to_dismember && !(mangled_state & BODYPART_MANGLED_INTERIOR) && sharpness)
			playsound(src, "sound/effects/wounds/crackandbleed.ogg", 100)
			if(wounding_type == WOUND_SLASH && !easy_dismember)
				wounding_dmg *= 0.6 // edged weapons pass along 60% of their wounding damage to the bone since the power is spread out over a larger area
			if(wounding_type == WOUND_PIERCE && !easy_dismember)
				wounding_dmg *= 0.75 // piercing weapons pass along 75% of their wounding damage to the bone since it's more concentrated
			wounding_type = WOUND_BLUNT
		if ((dismemberable_by_wound() || dismemberable_by_total_damage()) && try_dismember(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus))
			return
	return check_wounding(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus)

/**
 * check_wounding() is where we handle rolling for, selecting, and applying a wound if we meet the criteria
 *
 * We generate a "score" for how woundable the attack was based on the damage and other factors discussed in [/obj/item/bodypart/proc/check_woundings_mods], then go down the list from most severe to least severe wounds in that category.
 * We can promote a wound from a lesser to a higher severity this way, but we give up if we have a wound of the given type and fail to roll a higher severity, so no sidegrades/downgrades
 *
 * Arguments:
 * * woundtype- Either WOUND_BLUNT, WOUND_SLASH, WOUND_PIERCE, or WOUND_BURN based on the attack type.
 * * damage- How much damage is tied to this attack, since wounding potential scales with damage in an attack (see: WOUND_DAMAGE_EXPONENT)
 * * wound_bonus- The wound_bonus of an attack
 * * bare_wound_bonus- The bare_wound_bonus of an attack
 */
/obj/item/bodypart/proc/check_wounding(woundtype, damage, wound_bonus, bare_wound_bonus, attack_direction)
	SHOULD_CALL_PARENT(TRUE)
	RETURN_TYPE(/datum/wound)

	if(HAS_TRAIT(owner, TRAIT_NEVER_WOUNDED) || (owner.status_flags & GODMODE))
		return

	// note that these are fed into an exponent, so these are magnified
	if(HAS_TRAIT(owner, TRAIT_EASILY_WOUNDED))
		damage *= 1.5
	else
		damage = min(damage, WOUND_MAX_CONSIDERED_DAMAGE)

	if(HAS_TRAIT(owner,TRAIT_HARDLY_WOUNDED))
		damage *= 0.85

	if(HAS_TRAIT(owner, TRAIT_EASYDISMEMBER))
		damage *= 1.1

	var/base_roll = rand(1, round(damage ** WOUND_DAMAGE_EXPONENT))
	var/injury_roll = base_roll
	injury_roll += check_woundings_mods(woundtype, damage, wound_bonus, bare_wound_bonus)
	var/list/series_wounding_mods = check_series_wounding_mods()

	if(injury_roll > WOUND_DISMEMBER_OUTRIGHT_THRESH && prob(get_damage() / max_damage * 100))
		var/datum/wound/loss/dismembering = new
		dismembering.apply_dismember(src, woundtype, outright = TRUE, attack_direction = attack_direction)
		return

	var/list/datum/wound/possible_wounds = list()
	for (var/datum/wound/type as anything in GLOB.all_wound_pregen_data)
		var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[type]
		if (pregen_data.can_be_applied_to(src, list(woundtype), random_roll = TRUE))
			possible_wounds[type] = pregen_data.get_weight(src, woundtype, damage, attack_direction)
	// quick re-check to see if bare_wound_bonus applies, for the benefit of log_wound(), see about getting the check from check_woundings_mods() somehow
	if(ishuman(owner))
		var/mob/living/carbon/human/human_wearer = owner
		var/list/clothing = human_wearer.clothingonpart(src)
		for(var/obj/item/clothing/clothes_check as anything in clothing)
			// unlike normal armor checks, we tabluate these piece-by-piece manually so we can also pass on appropriate damage the clothing's limbs if necessary
			if(clothes_check.armor.getRating(WOUND))
				bare_wound_bonus = 0
				break

	//cycle through the wounds of the relevant category from the most severe down
	for (var/datum/wound/iterated_path as anything in possible_wounds)
		for (var/datum/wound/existing_wound as anything in wounds)
			if (iterated_path == existing_wound.type)
				possible_wounds -= iterated_path
				break // breaks out of the nested loop

		var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[iterated_path]
		var/specific_injury_roll = (injury_roll + series_wounding_mods[pregen_data.wound_series])
		if (pregen_data.get_threshold_for(src, attack_direction) > specific_injury_roll)
			possible_wounds -= iterated_path
			continue

		if (pregen_data.compete_for_wounding)
			for (var/datum/wound/other_path as anything in possible_wounds)
				if (other_path == iterated_path)
					continue
				if (initial(iterated_path.severity) == initial(other_path.severity) && pregen_data.overpower_wounds_of_even_severity)
					possible_wounds -= other_path
					continue
				else if (pregen_data.competition_mode == WOUND_COMPETITION_OVERPOWER_LESSERS)
					if (initial(iterated_path.severity) > initial(other_path.severity))
						possible_wounds -= other_path
						continue
				else if (pregen_data.competition_mode == WOUND_COMPETITION_OVERPOWER_GREATERS)
					if (initial(iterated_path.severity) < initial(other_path.severity))
						possible_wounds -= other_path
						continue

	while (length(possible_wounds))
		var/datum/wound/possible_wound = pick_weight(possible_wounds)
		var/datum/wound_pregen_data/possible_pregen_data = GLOB.all_wound_pregen_data[possible_wound]
		possible_wounds -= possible_wound

		var/datum/wound/replaced_wound
		for(var/datum/wound/existing_wound as anything in wounds)
			var/datum/wound_pregen_data/existing_pregen_data = GLOB.all_wound_pregen_data[existing_wound.type]
			if(existing_pregen_data.wound_series == possible_pregen_data.wound_series)
				if(existing_wound.severity >= initial(possible_wound.severity))
					continue
				else
					replaced_wound = existing_wound
				// if we get through this whole loop without continuing, we found our winner

		var/datum/wound/new_wound = new possible_wound
		if(replaced_wound)
			new_wound = replaced_wound.replace_wound(new_wound, attack_direction = attack_direction)
		else
			new_wound.apply_wound(src, attack_direction = attack_direction)
		log_wound(owner, new_wound, damage, wound_bonus, bare_wound_bonus, base_roll) // dismembering wounds are logged in the apply_wound() for loss wounds since they delete themselves immediately, these will be immediately returned
		return new_wound

// try forcing a specific wound, but only if there isn't already a wound of that severity or greater for that type on this bodypart
/obj/item/bodypart/proc/force_wound_upwards(datum/wound/potential_wound, smited = FALSE, wound_source)
	SHOULD_NOT_OVERRIDE(TRUE)

	if (isnull(potential_wound))
		return

	var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[potential_wound]
	for(var/datum/wound/existing_wound as anything in wounds)
		var/datum/wound_pregen_data/existing_pregen_data = existing_wound.get_pregen_data()
		if (existing_pregen_data.wound_series == pregen_data.wound_series)
			if(existing_wound.severity < initial(potential_wound.severity)) // we only try if the existing one is inferior to the one we're trying to force
				existing_wound.replace_wound(new potential_wound, smited)
			return

	var/datum/wound/new_wound = new potential_wound
	new_wound.apply_wound(src, smited = smited)
	return new_wound

/**
 *  A simple proc to force a type of wound onto this mob. If you just want to force a specific mainline (fractures, bleeding, etc.) wound, you only need to care about the first 3 args.
 *
 * Args:
 * * wounding_type: The wounding_type, e.g. WOUND_BLUNT, WOUND_SLASH to force onto the mob. Can be a list.
 * * obj/item/bodypart/limb: The limb we wil be applying the wound to. If null, a random bodypart will be picked.
 * * min_severity: The minimum severity that will be considered.
 * * max_severity: The maximum severity that will be considered.
 * * severity_pick_mode: The "pick mode" to be used. See get_corresponding_wound_type's documentation
 * * wound_source: The source of the wound to be applied. Nullable.
 *
 * For the rest of the args, refer to get_corresponding_wound_type().
 *
 * Returns:
 * A new wound instance if the application was successful, null otherwise.
*/
/mob/living/carbon/proc/cause_wound_of_type_and_severity(wounding_type, obj/item/bodypart/limb, min_severity, max_severity = min_severity, severity_pick_mode = WOUND_PICK_HIGHEST_SEVERITY, wound_source)
	if (isnull(limb))
		limb = pick(bodyparts)

	var/list/type_list = wounding_type
	if (!islist(type_list))
		type_list = list(type_list)

	var/datum/wound/corresponding_typepath = get_corresponding_wound_type(type_list, limb, min_severity, max_severity, severity_pick_mode)
	if (corresponding_typepath)
		return limb.force_wound_upwards(corresponding_typepath, wound_source = wound_source)

/// Limb is nullable, but picks a random one. Defers to limb.get_wound_threshold_of_wound_type, see it for documentation.
/mob/living/carbon/proc/get_wound_threshold_of_wound_type(wounding_type, severity, default, obj/item/bodypart/limb, wound_source)
	if (isnull(limb))
		limb = pick(bodyparts)

	if (!limb)
		return default

	return limb.get_wound_threshold_of_wound_type(wounding_type, severity, default, wound_source)

/**
 * A simple proc that gets the best wound to fit the criteria laid out, then returns its wound threshold.
 *
 * Args:
 * * wounding_type: The wounding_type, e.g. WOUND_BLUNT, WOUND_SLASH to force onto the mob. Can be a list of wounding_types.
 * * severity: The severity that will be considered.
 * * return_value_if_no_wound: If no wound is found, we will return this instead. (It is reccomended to use named args for this one, as its unclear what it is without)
 * * wound_source: The theoretical source of the wound. Nullable.
 *
 * Returns:
 * return_value_if_no_wound if no wound is found - if one IS found, the wound threshold for that wound.
 */
/obj/item/bodypart/proc/get_wound_threshold_of_wound_type(wounding_type, severity, return_value_if_no_wound, wound_source)
	var/list/type_list = wounding_type
	if (!islist(type_list))
		type_list = list(type_list)

	var/datum/wound/wound_path = get_corresponding_wound_type(type_list, src, severity, duplicates_allowed = TRUE, care_about_existing_wounds = FALSE)
	if (wound_path)
		var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[wound_path]
		return pregen_data.get_threshold_for(src, damage_source = wound_source)

	return return_value_if_no_wound

/**
 * check_wounding_mods() is where we handle the various modifiers of a wound roll
 *
 * A short list of things we consider: any armor a human target may be wearing, and if they have no wound armor on the limb, if we have a bare_wound_bonus to apply, plus the plain wound_bonus
 * We also flick through all of the wounds we currently have on this limb and add their threshold penalties, so that having lots of bad wounds makes you more liable to get hurt worse
 * Lastly, we add the inherent wound_resistance variable the bodypart has (heads and chests are slightly harder to wound), and a small bonus if the limb is already disabled
 *
 * Arguments:
 * * It's the same ones on [/obj/item/bodypart/proc/receive_damage]
 */
/obj/item/bodypart/proc/check_woundings_mods(wounding_type, damage, wound_bonus, bare_wound_bonus)
	SHOULD_CALL_PARENT(TRUE)

	var/armor_ablation = 0
	var/injury_mod = 0

	if(owner && ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/list/clothing = human_owner.clothingonpart(src)
		for(var/obj/item/clothing/clothes as anything in clothing)
			// unlike normal armor checks, we tabluate these piece-by-piece manually so we can also pass on appropriate damage the clothing's limbs if necessary
			armor_ablation += clothes.armor.getRating(WOUND)
			if(wounding_type == WOUND_SLASH)
				clothes.take_damage_zone(body_zone, damage, BRUTE)
			else if(wounding_type == WOUND_BURN && damage >= 10) // lazy way to block freezing from shredding clothes without adding another var onto apply_damage()
				clothes.take_damage_zone(body_zone, damage, BURN)

		if(!armor_ablation)
			injury_mod += bare_wound_bonus

	injury_mod -= armor_ablation
	injury_mod += wound_bonus

	for(var/datum/wound/wound as anything in wounds)
		injury_mod += wound.threshold_penalty

	var/part_mod = -wound_resistance
	if(get_damage() >= max_damage)
		part_mod += disabled_wound_penalty

	injury_mod += part_mod

	return injury_mod

//Heals brute and burn damage for the organ. Returns 1 if the damage-icon states changed at all.
//Damage cannot go below zero.
//Cannot remove negative damage (i.e. apply damage)
/obj/item/bodypart/proc/heal_damage(brute, burn, stamina, required_status, updating_health = TRUE)

	if(required_status && !(biological_state & required_status)) //So we can only heal certain kinds of limbs, ie robotic vs organic.
		return

	if(brute)
		set_brute_dam(round(max(brute_dam - brute, 0), DAMAGE_PRECISION))
	if(burn)
		set_burn_dam(round(max(burn_dam - burn, 0), DAMAGE_PRECISION))
	if(stamina)
		set_stamina_dam(round(max(stamina_dam - stamina, 0), DAMAGE_PRECISION))

	if(owner)
		if(can_be_disabled)
			update_disabled()
		if(updating_health)
			owner.updatehealth()
	cremation_progress = min(0, cremation_progress - ((brute_dam + burn_dam)*(100/max_damage)))
	return update_bodypart_damage_state()


///Proc to hook behavior associated to the change of the brute_dam variable's value.
/obj/item/bodypart/proc/set_brute_dam(new_value)
	if(brute_dam == new_value)
		return
	. = brute_dam
	brute_dam = new_value


///Proc to hook behavior associated to the change of the burn_dam variable's value.
/obj/item/bodypart/proc/set_burn_dam(new_value)
	if(burn_dam == new_value)
		return
	. = burn_dam
	burn_dam = new_value


///Proc to hook behavior associated to the change of the stamina_dam variable's value.
/obj/item/bodypart/proc/set_stamina_dam(new_value)
	if(stamina_dam == new_value)
		return
	. = stamina_dam
	stamina_dam = new_value
	if(stamina_dam > DAMAGE_PRECISION)
		needs_processing = TRUE
	else
		needs_processing = FALSE


//Returns total damage.
/obj/item/bodypart/proc/get_damage(include_stamina = FALSE)
	var/total = brute_dam + burn_dam
	if(include_stamina)
		total = max(total, stamina_dam)
	return total


//Checks disabled status thresholds
/obj/item/bodypart/proc/update_disabled()
	if(!owner)
		return

	if(!can_be_disabled)
		set_disabled(FALSE)
		CRASH("update_disabled called with can_be_disabled false")

	if(HAS_TRAIT(src, TRAIT_PARALYSIS))
		set_disabled(TRUE)
		return

	var/total_damage = max(brute_dam + burn_dam, stamina_dam)

	// this block of checks is for limbs that can be disabled, but not through pure damage (AKA limbs that suffer wounds, human/monkey parts and such)
	if(!disable_threshold)
		if(total_damage < max_damage)
			last_maxed = FALSE
		else
			if(!last_maxed && owner.stat < UNCONSCIOUS)
				INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "scream")
			last_maxed = TRUE
		set_disabled(FALSE) // we only care about the paralysis trait
		return

	// we're now dealing solely with limbs that can be disabled through pure damage, AKA robot parts
	if(total_damage >= max_damage * disable_threshold)
		if(!last_maxed)
			if(owner.stat < UNCONSCIOUS)
				INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "scream")
			last_maxed = TRUE
		set_disabled(TRUE)
		return

	if(bodypart_disabled && total_damage <= max_damage * 0.5) // reenable the limb at 50% health
		last_maxed = FALSE
		set_disabled(FALSE)


///Proc to change the value of the `disabled` variable and react to the event of its change.
/obj/item/bodypart/proc/set_disabled(new_disabled)
	if(bodypart_disabled == new_disabled)
		return
	. = bodypart_disabled
	bodypart_disabled = new_disabled

	if(!owner)
		return
	owner.update_health_hud() //update the healthdoll
	owner.update_body()


///Proc to change the value of the `owner` variable and react to the event of its change.
/obj/item/bodypart/proc/set_owner(new_owner)
	if(owner == new_owner)
		return FALSE //`null` is a valid option, so we need to use a num var to make it clear no change was made.
	. = owner
	owner = new_owner
	var/needs_update_disabled = FALSE //Only really relevant if there's an owner
	if(.)
		var/mob/living/carbon/old_owner = .
		if(initial(can_be_disabled))
			if(HAS_TRAIT(old_owner, TRAIT_NOLIMBDISABLE))
				if(!owner || !HAS_TRAIT(owner, TRAIT_NOLIMBDISABLE))
					set_can_be_disabled(initial(can_be_disabled))
					needs_update_disabled = TRUE
			UnregisterSignal(old_owner, list(
				SIGNAL_REMOVETRAIT(TRAIT_NOLIMBDISABLE),
				SIGNAL_ADDTRAIT(TRAIT_NOLIMBDISABLE),
				))
	if(owner)
		if(initial(can_be_disabled))
			if(HAS_TRAIT(owner, TRAIT_NOLIMBDISABLE))
				set_can_be_disabled(FALSE)
				needs_update_disabled = FALSE
			RegisterSignal(owner, SIGNAL_REMOVETRAIT(TRAIT_NOLIMBDISABLE), PROC_REF(on_owner_nolimbdisable_trait_loss))
			RegisterSignal(owner, SIGNAL_ADDTRAIT(TRAIT_NOLIMBDISABLE), PROC_REF(on_owner_nolimbdisable_trait_gain))
		if(needs_update_disabled)
			update_disabled()


///Proc to change the value of the `can_be_disabled` variable and react to the event of its change.
/obj/item/bodypart/proc/set_can_be_disabled(new_can_be_disabled)
	if(can_be_disabled == new_can_be_disabled)
		return
	. = can_be_disabled
	can_be_disabled = new_can_be_disabled
	if(can_be_disabled)
		if(owner)
			if(HAS_TRAIT(owner, TRAIT_NOLIMBDISABLE))
				CRASH("set_can_be_disabled to TRUE with for limb whose owner has TRAIT_NOLIMBDISABLE")
			RegisterSignal(owner, SIGNAL_ADDTRAIT(TRAIT_PARALYSIS), PROC_REF(on_paralysis_trait_gain))
			RegisterSignal(owner, SIGNAL_REMOVETRAIT(TRAIT_PARALYSIS), PROC_REF(on_paralysis_trait_loss))
		update_disabled()
	else if(.)
		if(owner)
			UnregisterSignal(owner, list(
				SIGNAL_ADDTRAIT(TRAIT_PARALYSIS),
				SIGNAL_REMOVETRAIT(TRAIT_PARALYSIS),
				))
		set_disabled(FALSE)


///Called when TRAIT_PARALYSIS is added to the limb.
/obj/item/bodypart/proc/on_paralysis_trait_gain(obj/item/bodypart/source)
	SIGNAL_HANDLER
	if(can_be_disabled)
		set_disabled(TRUE)


///Called when TRAIT_PARALYSIS is removed from the limb.
/obj/item/bodypart/proc/on_paralysis_trait_loss(obj/item/bodypart/source)
	SIGNAL_HANDLER
	if(can_be_disabled)
		update_disabled()


///Called when TRAIT_NOLIMBDISABLE is added to the owner.
/obj/item/bodypart/proc/on_owner_nolimbdisable_trait_gain(mob/living/carbon/source)
	SIGNAL_HANDLER
	set_can_be_disabled(FALSE)


///Called when TRAIT_NOLIMBDISABLE is removed from the owner.
/obj/item/bodypart/proc/on_owner_nolimbdisable_trait_loss(mob/living/carbon/source)
	SIGNAL_HANDLER
	set_can_be_disabled(initial(can_be_disabled))

//Updates an organ's brute/burn states for use by update_damage_overlays()
//Returns 1 if we need to update overlays. 0 otherwise.
/obj/item/bodypart/proc/update_bodypart_damage_state()
	var/tbrute = round( (brute_dam/max_damage)*3, 1 )
	var/tburn = round( (burn_dam/max_damage)*3, 1 )
	if((tbrute != brutestate) || (tburn != burnstate))
		brutestate = tbrute
		burnstate = tburn
		return TRUE
	return FALSE

//Change organ status
/obj/item/bodypart/proc/change_bodypart_status(new_limb_status, heal_limb, change_icon_to_default)
	biological_state = new_limb_status
	if(heal_limb)
		burn_dam = 0
		brute_dam = 0
		brutestate = 0
		burnstate = 0

	if(change_icon_to_default)
		if(biological_state & BIO_STANDARD)
			icon = icon_greyscale
		else if(biological_state & BIO_ROBOTIC)
			icon = icon_robotic

	if(owner)
		owner.updatehealth()
		owner.update_body() //if our head becomes robotic, we remove the lizard horns and human hair.
		owner.update_hair()
		owner.update_damage_overlays()

/obj/item/bodypart/proc/is_organic_limb()
	return (biological_state & BIO_STANDARD)

//we inform the bodypart of the changes that happened to the owner, or give it the informations from a source mob.
/obj/item/bodypart/proc/update_limb(dropping_limb, mob/living/carbon/source)
	var/mob/living/carbon/limb_owner
	if(source)
		limb_owner = source
		if(!original_owner)
			original_owner = WEAKREF(source)
	else
		limb_owner = owner
		if(original_owner && !IS_WEAKREF_OF(owner, original_owner)) //Foreign limb
			no_update = TRUE
		else
			no_update = FALSE

	if(HAS_TRAIT(limb_owner, TRAIT_HUSK) && is_organic_limb())
		species_id = "husk" //overrides species_id
		dmg_overlay_type = "" //no damage overlay shown when husked
		should_draw_gender = FALSE
		should_draw_greyscale = FALSE
		no_update = TRUE

	if(HAS_TRAIT(src, TRAIT_PLASMABURNT) && is_organic_limb())
		species_id = SPECIES_PLASMAMAN
		dmg_overlay_type = ""
		should_draw_gender = FALSE
		should_draw_greyscale = FALSE
		no_update = TRUE

	if(HAS_TRAIT(limb_owner, TRAIT_INVISIBLE_MAN) && is_organic_limb())
		species_id = "invisible" //overrides species_id
		dmg_overlay_type = "" //no damage overlay shown when invisible since the wounds themselves are invisible.
		should_draw_gender = FALSE
		should_draw_greyscale = FALSE
		no_update = TRUE

	if(no_update)
		return

	if(!animal_origin)
		var/mob/living/carbon/human/human_owner = limb_owner
		should_draw_greyscale = FALSE

		var/datum/species/owner_species = human_owner.dna.species
		species_id = owner_species.limbs_id
		species_flags_list = human_owner.dna.species.species_traits

		if(owner_species.use_skintones)
			skin_tone = human_owner.skin_tone
			should_draw_greyscale = TRUE
		else
			skin_tone = ""

		body_gender = human_owner.body_type
		should_draw_gender = owner_species.sexes

		if((MUTCOLORS in owner_species.species_traits) || (DYNCOLORS in owner_species.species_traits))
			if(owner_species.fixed_mut_color)
				species_color = owner_species.fixed_mut_color
			else
				species_color = human_owner.dna.features["mcolor"]
			should_draw_greyscale = TRUE
		else
			species_color = ""

		if(!dropping_limb && human_owner.dna.check_mutation(/datum/mutation/human/hulk))
			mutation_color = "#00aa00"
		else
			mutation_color = ""

		dmg_overlay_type = owner_species.damage_overlay_type

	else if(animal_origin == MONKEY_BODYPART) //currently monkeys are the only non human mob to have damage overlays.
		dmg_overlay_type = animal_origin

	if(biological_state & BIO_ROBOTIC)
		dmg_overlay_type = "robotic"

	if(dropping_limb)
		no_update = TRUE //when attached, the limb won't be affected by the appearance changes of its mob owner.

//to update the bodypart's icon when not attached to a mob
/obj/item/bodypart/proc/update_icon_dropped()
	cut_overlays()
	var/list/standing = get_limb_icon(1)
	if(!standing.len)
		icon_state = initial(icon_state)//no overlays found, we default back to initial icon.
		return
	for(var/image/img in standing)
		img.pixel_x = px_x
		img.pixel_y = px_y
	add_overlay(standing)

//Gives you a proper icon appearance for the dismembered limb
/obj/item/bodypart/proc/get_limb_icon(dropped)
	icon_state = "" //to erase the default sprite, we're building the visual aspects of the bodypart through overlays alone.

	. = list()

	var/image_dir = 0
	if(dropped)
		image_dir = SOUTH
		if(dmg_overlay_type)
			if(brutestate)
				. += image('icons/mob/dam_mob.dmi', "[dmg_overlay_type]_[body_zone]_[brutestate]0", -DAMAGE_LAYER, image_dir)
			if(burnstate)
				. += image('icons/mob/dam_mob.dmi', "[dmg_overlay_type]_[body_zone]_0[burnstate]", -DAMAGE_LAYER, image_dir)

	var/image/limb = image(layer = -BODYPARTS_LAYER, dir = image_dir)
	var/image/aux
	. += limb

	if(animal_origin)
		if(is_organic_limb())
			limb.icon = 'icons/mob/animal_parts.dmi'
			if(species_id == "husk")
				limb.icon_state = "[animal_origin]_husk_[body_zone]"
			else
				limb.icon_state = "[animal_origin]_[body_zone]"
		else
			limb.icon = 'icons/mob/augmentation/augments.dmi'
			limb.icon_state = "[animal_origin]_[body_zone]"

		if(blocks_emissive)
			var/mutable_appearance/limb_em_block = emissive_blocker(limb.icon, limb.icon_state, alpha = limb.alpha)
			limb_em_block.dir = image_dir
			limb.overlays += limb_em_block
		return

	var/icon_gender = (body_gender == FEMALE) ? "f" : "m" //gender of the icon, if applicable

	if((body_zone != BODY_ZONE_HEAD && body_zone != BODY_ZONE_CHEST))
		should_draw_gender = FALSE

	var/draw_color

	if(!is_organic_limb())
		limb.icon = icon
		limb.icon_state = "[body_zone]" //Inorganic limbs are agender

		if(blocks_emissive)
			var/mutable_appearance/limb_em_block = emissive_blocker(limb.icon, limb.icon_state, alpha = limb.alpha)
			limb_em_block.dir = image_dir
			limb.overlays += limb_em_block

		if(aux_zone)
			aux = image(limb.icon, "[aux_zone]", -aux_layer, image_dir)
			. += aux

			if(blocks_emissive)
				var/mutable_appearance/aux_em_block = emissive_blocker(aux.icon, aux.icon_state, alpha = aux.alpha)
				aux_em_block.dir = image_dir
				aux.overlays += aux_em_block

	else
		if(should_draw_greyscale)
			limb.icon = icon_greyscale
			if(should_draw_gender)
				limb.icon_state = "[species_id]_[body_zone]_[icon_gender]"
			else if(use_digitigrade)
				limb.icon_state = "digitigrade_[use_digitigrade]_[body_zone]"
			else
				limb.icon_state = "[species_id]_[body_zone]"
		else
			limb.icon = 'icons/mob/human_parts.dmi'
			if(should_draw_gender)
				limb.icon_state = "[species_id]_[body_zone]_[icon_gender]"
			else
				limb.icon_state = "[species_id]_[body_zone]"

		if(aux_zone)
			aux = image(limb.icon, "[species_id]_[aux_zone]", -aux_layer, image_dir)
			. += aux

		if(should_draw_greyscale)
			draw_color = mutation_color || species_color || (skin_tone && skintone2hex(skin_tone))
			if(draw_color)
				limb.color = draw_color
				if(aux_zone)
					aux.color = draw_color

		if(blocks_emissive)
			var/mutable_appearance/limb_em_block = emissive_blocker(limb.icon, limb.icon_state, alpha = limb.alpha)
			limb_em_block.dir = image_dir
			limb.overlays += limb_em_block

			if(aux_zone)
				var/mutable_appearance/aux_em_block = emissive_blocker(aux.icon, aux.icon_state, alpha = aux.alpha)
				aux_em_block.dir = image_dir
				aux.overlays += aux_em_block

/obj/item/bodypart/deconstruct(disassembled = TRUE)
	drop_organs()
	qdel(src)

/// Should return an assoc list of (wound_series -> penalty). Will be used in determining series-specific penalties for wounding.
/obj/item/bodypart/proc/check_series_wounding_mods()
	RETURN_TYPE(/list)

	var/list/series_mods = list()

	for (var/datum/wound/iterated_wound as anything in wounds)
		var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[iterated_wound.type]

		series_mods[pregen_data.wound_series] += iterated_wound.series_threshold_penalty

	return series_mods

/// Get whatever wound of the given type is currently attached to this limb, if any
/obj/item/bodypart/proc/get_wound_type(checking_type)
	RETURN_TYPE(checking_type)
	SHOULD_NOT_OVERRIDE(TRUE)

	if(isnull(wounds))
		return

	for(var/wound in wounds)
		if(istype(wound, checking_type))
			return wound

/**
 * update_wounds() is called whenever a wound is gained or lost on this bodypart, as well as if there's a change of some kind on a bone wound possibly changing disabled status
 *
 * Covers tabulating the damage multipliers we have from wounds (burn specifically), as well as deleting our gauze wrapping if we don't have any wounds that can use bandaging
 *
 * Arguments:
 * * replaced- If true, this is being called from the remove_wound() of a wound that's being replaced, so the bandage that already existed is still relevant, but the new wound hasn't been added yet
 */
/obj/item/bodypart/proc/update_wounds(replaced = FALSE)
	SHOULD_CALL_PARENT(TRUE)

	var/dam_mul = 1 //initial(wound_damage_multiplier)

	// we can (normally) only have one wound per type, but remember there's multiple types (smites like :B:loodless can generate multiple cuts on a limb)
	for(var/datum/wound/iter_wound as anything in wounds)
		dam_mul *= iter_wound.damage_mulitplier_penalty

	// if(!LAZYLEN(wounds) && current_gauze && !replaced) // no more wounds = no need for the gauze anymore - MOJAVE SUN EDIT
	// 	owner.visible_message(span_notice("\The [current_gauze.name] on [owner]'s [name] falls away."), span_notice("The [current_gauze.name] on your [name] falls away.")) - MOJAVE SUN EDIT
	// 	QDEL_NULL(current_gauze) - MOJAVE SUN EDIT

	wound_damage_multiplier = dam_mul
	refresh_bleed_rate()

/// Refresh the cache of our rate of bleeding sans any modifiers
/// ANYTHING ADDED TO THIS PROC NEEDS TO CALL IT WHEN IT'S EFFECT CHANGES
/obj/item/bodypart/proc/refresh_bleed_rate()
	SHOULD_NOT_OVERRIDE(TRUE)

	var/old_bleed_rate = cached_bleed_rate
	cached_bleed_rate = 0
	if(!owner)
		return

	if(!can_bleed())
		if(cached_bleed_rate != old_bleed_rate)
			update_part_wound_overlay()
		return

	if(generic_bleedstacks > 0)
		cached_bleed_rate += 0.5

	for(var/obj/item/embeddies in embedded_objects)
		if(!embeddies.isEmbedHarmless())
			cached_bleed_rate += 0.25

	for(var/datum/wound/iter_wound as anything in wounds)
		cached_bleed_rate += iter_wound.blood_flow

	// Our bleed overlay is based directly off bleed_rate, so go aheead and update that would you?
	if(cached_bleed_rate != old_bleed_rate)
		update_part_wound_overlay()

	return cached_bleed_rate

/// Returns our bleed rate, taking into account laying down and grabbing the limb
/obj/item/bodypart/proc/get_modified_bleed_rate()
	var/bleed_rate = cached_bleed_rate
	if(owner.body_position == LYING_DOWN)
		bleed_rate *= 0.75
	if(grasped_by)
		bleed_rate *= 0.7
	return bleed_rate

/**
 * Calculates how much blood this limb is losing per life tick
 *
 * Arguments:
 * * ignore_modifiers - If TRUE, ignore the bleed reduction for laying down and grabbing your limb
 */
/obj/item/bodypart/proc/get_part_bleed_rate(ignore_modifiers = FALSE)
	if(!can_bleed())
		return
	if(!(biological_state & BIO_STANDARD)) // maybe in the future we can bleed oil from aug parts, but not now
		return

	var/bleed_rate = 0
	if(generic_bleedstacks > 0)
		bleed_rate += 0.5

	//We want an accurate reading of .len
	list_clear_nulls(embedded_objects)
	for(var/obj/item/embeddies in embedded_objects)
		if(!embeddies.isEmbedHarmless())
			bleed_rate += 0.25

	for(var/datum/wound/iter_wound as anything in wounds)
		bleed_rate += iter_wound.blood_flow

	if(!ignore_modifiers)
		if(owner.body_position == LYING_DOWN)
			bleed_rate *= 0.75
		if(grasped_by)
			bleed_rate *= 0.7

	if(!bleed_rate)
		QDEL_NULL(grasped_by)

	return bleed_rate

// how much blood the limb needs to be losing per tick (not counting laying down/self grasping modifiers) to get the different bleed icons
#define BLEED_OVERLAY_LOW 0.5
#define BLEED_OVERLAY_MED 1.5
#define BLEED_OVERLAY_GUSH 3.25

/obj/item/bodypart/proc/update_part_wound_overlay()
	if(!owner)
		return FALSE
	if(!can_bleed())
		if(bleed_overlay_icon)
			bleed_overlay_icon = null
			owner.update_wound_overlays()
		return FALSE

	var/bleed_rate = get_part_bleed_rate(ignore_modifiers = TRUE)
	var/new_bleed_icon

	switch(bleed_rate)
		if(-INFINITY to BLEED_OVERLAY_LOW)
			new_bleed_icon = null
		if(BLEED_OVERLAY_LOW to BLEED_OVERLAY_MED)
			new_bleed_icon = "[body_zone]_1"
		if(BLEED_OVERLAY_MED to BLEED_OVERLAY_GUSH)
			if(owner.body_position == LYING_DOWN || IS_IN_STASIS(owner) || owner.stat == DEAD)
				new_bleed_icon = "[body_zone]_2s"
			else
				new_bleed_icon = "[body_zone]_2"
		if(BLEED_OVERLAY_GUSH to INFINITY)
			if(IS_IN_STASIS(owner) || owner.stat == DEAD)
				new_bleed_icon = "[body_zone]_2s"
			else
				new_bleed_icon = "[body_zone]_3"

	if(new_bleed_icon != bleed_overlay_icon)
		bleed_overlay_icon = new_bleed_icon
		return TRUE

#undef BLEED_OVERLAY_LOW
#undef BLEED_OVERLAY_MED
#undef BLEED_OVERLAY_GUSH

/obj/item/bodypart/proc/can_bleed()
	SHOULD_BE_PURE(TRUE)

	return ((biological_state & BIO_BLOODED) && (!owner || !HAS_TRAIT(owner, TRAIT_NOBLEED)))

/**
 * apply_gauze() is used to- well, apply gauze to a bodypart
 *
 * As of the Wounds 2 PR, all bleeding is now bodypart based rather than the old bleedstacks system, and 90% of standard bleeding comes from flesh wounds (the exception is embedded weapons).
 * The same way bleeding is totaled up by bodyparts, gauze now applies to all wounds on the same part. Thus, having a slash wound, a pierce wound, and a broken bone wound would have the gauze
 * applying blood staunching to the first two wounds, while also acting as a sling for the third one. Once enough blood has been absorbed or all wounds with the ACCEPTS_GAUZE flag have been cleared,
 * the gauze falls off.
 *
 * Arguments:
 * * new_gauze- Just the gauze stack we're taking a sheet from to apply here	// MOJAVE SUN EDIT - ORIGINAL IS * * gauze- Just the gauze stack we're taking a sheet from to apply here
 */
/obj/item/bodypart/proc/apply_gauze(obj/item/stack/medical/gauze/new_gauze)// MOJAVE SUN EDIT - ORIGINAL IS /obj/item/bodypart/proc/apply_gauze(obj/item/stack/gauze)
	if(!istype(new_gauze) || current_gauze)// MOJAVE SUN EDIT - ORIGINAL IS 	if(!istype(gauze) || !gauze.absorption_capacity)
		return
	// MOJAVE SUN EDIT BEGIN
	current_gauze = new new_gauze.gauze_type(src)
	new_gauze.use(1)
	// var/newly_gauzed = FALSE
	// if(!current_gauze)
	//	newly_gauzed = TRUE
	// QDEL_NULL(current_gauze)
	// current_gauze = new gauze.type(src, 1)
	// gauze.use(1)
	// if(newly_gauzed)
	// SEND_SIGNAL(src, COMSIG_BODYPART_GAUZED, gauze)
	// MOJAVE SUN EDIT END
/**
* apply_splint() much like above, except with a splint // MOJAVE SUN EDIT - ORIGINAL IS seep_gauze() is for when a gauze wrapping absorbs blood or pus from wounds, lowering its absorption capacity.
 *
 * This proc applies a splint to a bodypart. Splints are used to stabilize muscle and bone wounds, aswell as to protect from hits causing internal bleeding // MOJAVE SUN EDIT - ORIGINAL IS The passed amount of seepage is deducted from the bandage's absorption capacity, and if we reach a negative absorption capacity, the bandages falls off and we're left with nothing.
 *
 * Arguments:
 * * new_splint- Just the gauze stack we're taking a sheet from to apply here // MOJAVE SUN EDIT - ORIGINAL IS seep_amt - How much absorption capacity we're removing from our current bandages (think, how much blood or pus are we soaking up this tick?)
 */
// MOJAVE SUN EDIT BEGIN

/obj/item/bodypart/proc/apply_splint(obj/item/stack/medical/splint/new_splint)
	if(!istype(new_splint) || current_splint)
		return
	current_splint = new new_splint.splint_type(src)
	new_splint.use(1)

/*/obj/item/bodypart/proc/seep_gauze(seep_amt = 0)
	if(!current_gauze)
		return
	current_gauze.absorption_capacity -= seep_amt
	if(current_gauze.absorption_capacity <= 0)
		owner.visible_message(span_danger("\The [current_gauze.name] on [owner]'s [name] falls away in rags."), span_warning("\The [current_gauze.name] on your [name] falls away in rags."), vision_distance=COMBAT_MESSAGE_RANGE)
		QDEL_NULL(current_gauze)
		SEND_SIGNAL(src, COMSIG_BODYPART_GAUZE_DESTROYED)*/
// MOJAVE SUN EDIT END

///Proc to turn bodypart into another.
/obj/item/bodypart/proc/change_bodypart(obj/item/bodypart/new_type)
	var/mob/living/carbon/our_owner = owner //dropping nulls the limb
	drop_limb(TRUE)
	var/obj/item/bodypart/new_part = new new_type()
	new_part.attach_limb(our_owner, TRUE)
	qdel(src)

/// Returns the generic description of our BIO_EXTERNAL feature(s), prioritizing certain ones over others. Returns error on failure.
/obj/item/bodypart/proc/get_external_description()
	if (biological_state & BIO_FLESH)
		return "flesh"
	if (biological_state & BIO_WIRED)
		return "wiring"

	return "error"

/// Returns the generic description of our BIO_INTERNAL feature(s), prioritizing certain ones over others. Returns error on failure.
/obj/item/bodypart/proc/get_internal_description()
	if (biological_state & BIO_BONE)
		return "bone"
	if (biological_state & BIO_METAL)
		return "metal"

	return "error"
