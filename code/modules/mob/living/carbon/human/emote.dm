/datum/emote/living/carbon/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)

/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	message = "cries."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/dap
	key = "dap"
	key_third_person = "daps"
	message = "sadly can't find anybody to give daps to, and daps themself. Shameful."
	message_param = "give daps to %t."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	message = "raises an eyebrow."

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	message = "grumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	message = "shakes their own hands."
	message_param = "shakes hands with %t."
	hands_use_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/hug
	key = "hug"
	key_third_person = "hugs"
	message = "hugs themself."
	message_param = "hugs %t."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "mumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/scream
	key = "scream"
	key_third_person = "screams"
	message = "screams!"
	message_mime = "acts out a scream!"
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	vary = TRUE

/datum/emote/living/carbon/human/scream/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human = user
	if(human.mind?.miming)
		return
	return human.dna.species.get_scream_sound(human)

/datum/emote/living/carbon/human/scream/screech //If a human tries to screech it'll just scream.
	key = "screech"
	key_third_person = "screeches"
	message = "screeches."
	emote_type = EMOTE_AUDIBLE
	vary = FALSE

/datum/emote/living/carbon/human/scream/screech/should_play_sound(mob/user, intentional)
	if(ismonkey(user))
		return TRUE
	return ..()

/datum/emote/living/carbon/human/pale
	key = "pale"
	message = "goes pale for a second."

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	message = "raises a hand."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/salute
	key = "salute"
	key_third_person = "salutes"
	message = "salutes."
	message_param = "salutes to %t."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	message = "shrugs."

/datum/emote/living/carbon/human/wag
	key = "wag"
	key_third_person = "wags"
	message = "wags their tail."

/datum/emote/living/carbon/human/wag/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
		return
	if(!H.dna.species.is_wagging_tail())
		H.dna.species.start_wagging_tail(H)
	else
		H.dna.species.stop_wagging_tail(H)

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	return H.dna && H.dna.species && H.dna.species.can_wag_tail(user)

/datum/emote/living/carbon/human/wag/select_message_type(mob/user, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.dna || !H.dna.species)
		return
	if(H.dna.species.is_wagging_tail())
		. = null

/* Commented out until moth wings have an icon state for being open

/datum/emote/living/carbon/human/wing
	key = "wing"
	key_third_person = "wings"
	message = "their wings."

/datum/emote/living/carbon/human/wing/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(.)
		var/mob/living/carbon/human/H = user
		var/wings_key = H.dna.species.mutant_bodyparts["wings"]
		if(wings_key && wings_key != "None" && findtext(select_message_type(user,intentional), "opens"))
			H.dna.species.mutant_bodyparts["wings"] = "[wings_key]_open"
		else
			H.dna.species.mutant_bodyparts["wings"] = "[wings_key]"

/datum/emote/living/carbon/human/wing/select_message_type(mob/user, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(findtext(H.dna.species.mutant_bodyparts["wings"], "_open"))
		. = "closes " + message
	else
		. = "opens " + message

/datum/emote/living/carbon/human/wing/can_run_emote(mob/user, status_check = TRUE, intentional)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	if(H.dna.features["wings"] != "None")
		return TRUE

*/

///Snowflake emotes only for le epic chimp
/datum/emote/living/carbon/human/monkey

/datum/emote/living/carbon/human/monkey/can_run_emote(mob/user, status_check = TRUE, intentional)
	if(ismonkey(user))
		return ..()
	return FALSE

/datum/emote/living/carbon/human/monkey/gnarl
	key = "gnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."

/datum/emote/living/carbon/human/monkey/roll
	key = "roll"
	key_third_person = "rolls"
	message = "rolls."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/monkey/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "scratches."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/monkey/screech/roar
	key = "roar"
	key_third_person = "roars"
	message = "roars."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/monkey/tail
	key = "tail"
	message = "waves their tail."

/datum/emote/living/carbon/human/monkeysign
	key = "sign"
	key_third_person = "signs"
	message_param = "signs the number %t."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/special_check
	cooldown = 3 SECONDS
	var/delay = 2.5 SECONDS
	var/list/attempt_message_list
	var/list/success_message_list
	var/list/failure_message_list

/datum/emote/living/carbon/human/special_check/run_emote(mob/user, params, type_override, intentional = FALSE)
	. = ..()
	if(.)
		sleep(delay)

		var/mob/living/carbon/human/human = user
		var/chance = 0

		switch(key)
			if("strength")
				chance = human.special_stats[SPECIAL_STRENGTH] * 10
			if("perception")
				chance = human.special_stats[SPECIAL_PERCEPTION] * 10
			if("endurance")
				chance = human.special_stats[SPECIAL_ENDURANCE] * 10
			if("charisma")
				chance = human.special_stats[SPECIAL_CHARISMA] * 10
			if("intelligence")
				chance = human.special_stats[SPECIAL_INTELLIGENCE] * 10
			if("agility")
				chance = human.special_stats[SPECIAL_AGILITY] * 10
			if("luck")
				chance = human.special_stats[SPECIAL_LUCK] * 10

		var/msg = prob(chance) ? span_green("[pick(success_message_list)] ([chance]%)") : span_red("[pick(failure_message_list)] ([chance]%)")
		
		msg = replace_pronoun(user, msg)

		user.visible_message(msg, blind_message = span_emote("You notice how <b>[user]</b> [msg]"), visible_message_flags = EMOTE_MESSAGE, separation = " ")

/datum/emote/living/carbon/human/special_check/select_message_type(mob/user, msg, intentional)
	return pick(attempt_message_list)

/datum/emote/living/carbon/human/special_check/strength
	key = "strength"
	key_third_person = "str"
	attempt_message_list = list(
		"tests their strength...",
		"puts their back into it...",
		"begins to flex...",
	)

	success_message_list = list(
		"has some real guns!",
		"is truly beefy!",
		"shows off their muscle!",
	)

	failure_message_list = list(
		"is a little wet noodle.",
		"would lose in an arm wrestling match against a mouse.",
		"should eat more protein.",
	)

/datum/emote/living/carbon/human/special_check/perception
	key = "perception"
	key_third_person = "per"
	attempt_message_list = list(
		"takes a good, long look...",
		"focuses in...",
		"squints...",
	)

	success_message_list = list(
		"has eyes like a hawk!",
		"sees what others don't!",
		"has perfect 20/20 vision!",
	)

	failure_message_list = list(
		"is totally oblivious.",
		"forgot their glasses.",
		"is blind.",
	)

/datum/emote/living/carbon/human/special_check/endurance
	key = "endurance"
	key_third_person = "end"
	attempt_message_list = list(
		"tests their toughness...",
		"braces themselves...",
		"prepares to endure...",
	)

	success_message_list = list(
		"doesn't even flinch!",
		"is solid as an oak!",
		"is one tough nut to crack!",
	)

	failure_message_list = list(
		"has paper skin.",
		"would be torn to shreds by a light breeze.",
		"has a glass jaw.",
	)

/datum/emote/living/carbon/human/special_check/charisma
	key = "charisma"
	key_third_person = "chr"
	attempt_message_list = list(
		"puts on the charm...",
		"clears their throat...",
		"smirks...",
	)

	success_message_list = list(
		"proves the pen is mightier than the sword!",
		"captures everyone's hearts!",
		"is a master with words!",
	)

	failure_message_list = list(
		"isn't fooling anyone.",
		"has their charms fall flat.",
		"is awkward.",
	)

/datum/emote/living/carbon/human/special_check/intelligence
	key = "intelligence"
	key_third_person = "int"
	attempt_message_list = list(
		"thinks hard...",
		"furrows their brows...",
		"rubs their chin...",
	)

	success_message_list = list(
		"is a genius!",
		"has a mind sharp as a whip!",
		"knows what they're doing!",
	)

	failure_message_list = list(
		"is as dumb as a rock.",
		"is missing their brain.",
		"couldn't put 2 and 2 together.",
	)

/datum/emote/living/carbon/human/special_check/agility
	key = "agility"
	key_third_person = "agi"
	attempt_message_list = list(
		"prepares their moves...",
		"starts to get limber...",
		"tries to get agile...",
	)

	success_message_list = list(
		"is in perfect control!",
		"is as agile as a cat!",
		"is very flexible!",
	)

	failure_message_list = list(
		"has two left feet.",
		"trips over themselves.",
		"is slower than a snail.",
	)

/datum/emote/living/carbon/human/special_check/luck
	key = "luck"
	key_third_person = "lck"
	attempt_message_list = list(
		"tries their luck...",
		"takes a chance...",
		"goes all in...",
	)

	success_message_list = list(
		"could make a bullet turn around and climb back into the gun!",
		"has a rabbit's paw in their pocket!",
		"succeeds through pure luck!",
	)

	failure_message_list = list(
		"realizes the game was rigged from the start.",
		"gets dealt a bad hand.",
		"has the odds stacked against them.",
	)
