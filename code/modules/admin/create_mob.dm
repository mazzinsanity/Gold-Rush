/datum/admins/proc/create_mob(mob/user)
	var/static/create_mob_html
	if (!create_mob_html)
		var/mobjs = null
		mobjs = jointext(typesof(/mob), ";")
		create_mob_html = file2text('html/create_object.html')
		create_mob_html = replacetext(create_mob_html, "Create Object", "Create Mob")
		create_mob_html = replacetext(create_mob_html, "null /* object types */", "\"[mobjs]\"")

	user << browse(create_panel_helper(create_mob_html), "window=create_mob;size=425x475")

/proc/randomize_human(mob/living/carbon/human/H)
	H.gender = pick(MALE, FEMALE, PLURAL)
	H.body_type = H.gender
	H.real_name = random_unique_name(H.gender)
	H.name = H.real_name
	H.underwear = random_underwear()
	H.underwear_color = "#[random_color()]"
	H.skin_tone = random_skin_tone()
	H.hairstyle = random_hairstyle()
	H.facial_hairstyle = random_facial_hairstyle()
	H.hair_color = "#[random_color()]"
	H.facial_hair_color = H.hair_color
	H.eye_color = "#[random_color()]"
	H.dna.blood_type = random_blood_type()
	H.voice_type = random_voice_type() // MOJAVE SUN EDIT - Voice!!
	H.generic_adjective = pick(GLOB.preference_adjectives) // MOJAVE SUN EDIT - Bobnames!!

	// Mutant randomizing, doesn't affect the mob appearance unless it's the specific mutant.
	H.dna.features["mcolor"] = "#[random_color()]"
	H.dna.features["ethcolor"] = GLOB.color_list_ethereal[pick(GLOB.color_list_ethereal)]
	H.dna.features["tail"] = pick(GLOB.tails_list)
	H.dna.features["spines"] = pick(GLOB.spines_list)
	H.dna.features["snout"] = pick(GLOB.snouts_list)
	H.dna.features["horns"] = pick(GLOB.horns_list)
	H.dna.features["frills"] = pick(GLOB.frills_list)
	H.dna.features["ears"] = pick(GLOB.ears_list)
	H.dna.features["wings"] = pick(GLOB.moth_wings_list)
	H.dna.features["moth_wings"] = pick(GLOB.moth_wings_list)
	H.dna.features["antennae"] = pick(GLOB.antennae_list)

	H.update_body()
	H.update_hair()
	H.update_body_parts()
