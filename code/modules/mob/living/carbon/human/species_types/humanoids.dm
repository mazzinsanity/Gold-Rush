/datum/species/humanoid
	name = "Humanoid"
	id = SPECIES_HUMANOID
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, MARKINGS, HAIR, FACEHAIR)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
	)
	mutant_bodyparts = list(
		"legs" = "Normal Legs", 
		"snout" = "Round",
		"horns" = "None",
		"frills" = "None",
		"ears" = "None",
		"antennae" = "None",
		"spines" = "None", 
		"tail" = "Smooth", 
		"wings" = "None",
	)
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW | CLOTH
	liked_food = JUNKFOOD | FRIED
	mutant_organs = list(/obj/item/organ/tail)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT

//I wag in death
/datum/species/humanoid/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		stop_wagging_tail(H)

/datum/species/humanoid/spec_stun(mob/living/carbon/human/H,amount)
	if(H)
		stop_wagging_tail(H)
	. = ..()

/datum/species/humanoid/can_wag_tail(mob/living/carbon/human/H)
	return mutant_bodyparts["tail"] || mutant_bodyparts["waggingtail"]

/datum/species/humanoid/is_wagging_tail(mob/living/carbon/human/H)
	return mutant_bodyparts["waggingtail"]

/datum/species/humanoid/start_wagging_tail(mob/living/carbon/human/H)
	if(mutant_bodyparts["tail"])
		mutant_bodyparts["waggingtail"] = mutant_bodyparts["tail"]
		mutant_bodyparts["waggingspines"] = mutant_bodyparts["spines"]
		mutant_bodyparts -= "tail"
		mutant_bodyparts -= "spines"
	H.update_body()

/datum/species/humanoid/stop_wagging_tail(mob/living/carbon/human/H)
	if(mutant_bodyparts["waggingtail"])
		mutant_bodyparts["tail"] = mutant_bodyparts["waggingtail"]
		mutant_bodyparts["spines"] = mutant_bodyparts["waggingspines"]
		mutant_bodyparts -= "waggingtail"
		mutant_bodyparts -= "waggingspines"
	H.update_body()

/datum/species/humanoid/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	var/real_tail_type = C.dna.features["tail"]
	var/real_spines = C.dna.features["spines"]

	. = ..()

	// Special handler for loading preferences. If we're doing it from a preference load, we'll want
	// to make sure we give the appropriate lizard tail AFTER we call the parent proc, as the parent
	// proc will overwrite the lizard tail. Species code at its finest.
	if(pref_load)
		C.dna.features["tail"] = real_tail_type
		C.dna.features["spines"] = real_spines

		var/obj/item/organ/tail/new_tail = new /obj/item/organ/tail()

		new_tail.tail_type = C.dna.features["tail"]
		new_tail.spines = C.dna.features["spines"]

		// organ.Insert will qdel any existing organs in the same slot, so
		// we don't need to manage that.
		new_tail.Insert(C, TRUE, FALSE)

/datum/species/humanoid/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/tail = pick(GLOB.tails_list)
	human_mob.dna.features["tail"] = tail
	mutant_bodyparts["tail"] = tail
	human_mob.update_body()

/datum/species/humanoid/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/humanoid/get_species_description()
	return "To do: Write humanoid species description."

/datum/species/humanoid/get_species_lore()
	return list(
		"To do: Write humanoid species lore or why hybrids are roaming around in Fallout.",
	)
