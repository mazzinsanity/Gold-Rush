#define NO_MAXVOTES_CAP -1

SUBSYSTEM_DEF(autoroundend)
	name = "Autoroundend"
	flags = SS_KEEP_TIMING | SS_BACKGROUND
	wait = 1 MINUTES

	var/starttime
	var/targettime
	var/voteinterval
	var/maxvotes
	var/curvotes = 0
	var/roundend_allowed = FALSE

/datum/controller/subsystem/autoroundend/Initialize()
	if(!CONFIG_GET(flag/autoroundend)) //Autoroundend voting disabled.
		can_fire = FALSE
		return FALSE

	var/init_vote = CONFIG_GET(number/vote_autoroundend_initial)
	starttime = REALTIMEOFDAY
	targettime = starttime + init_vote
	voteinterval = CONFIG_GET(number/vote_autoroundend_interval)
	maxvotes = CONFIG_GET(number/vote_autoroundend_maximum)
	return TRUE

/datum/controller/subsystem/autoroundend/Recover()
	starttime = SSautoroundend.starttime
	voteinterval = SSautoroundend.voteinterval
	curvotes = SSautoroundend.curvotes

/datum/controller/subsystem/autoroundend/fire()
	if(REALTIMEOFDAY < targettime)
		return

	if(roundend_allowed)
		SSticker.force_ending = TRUE
		can_fire = FALSE
	else
		if(maxvotes == NO_MAXVOTES_CAP || maxvotes > curvotes)
			SSvote.initiate_vote("autoroundend", "automatic roundend")
			targettime = targettime + voteinterval
			curvotes++
		else
			end_round_after_delay()

/**
 * At round start, pulls the autoroundend interval from config and applies
 *
 * Arguments:
 * * real_round_start_time - World time the round left the pregame lobby
 */
/datum/controller/subsystem/autoroundend/proc/new_round(real_round_start_time)
	var/init_vote = CONFIG_GET(number/vote_autoroundend_initial) // Check if an admin has manually set an override in the pre-game lobby
	starttime = real_round_start_time
	targettime = starttime + init_vote
	log_game("Autoroundend enabled, first vote in [DisplayTimeText(targettime - starttime)]")
	message_admins("Autoroundend enabled, first vote in [DisplayTimeText(targettime - starttime)]")

/**
 * Sets up the Autoroundend subsystem to end the round after the delay specified in the config
 */
/datum/controller/subsystem/autoroundend/proc/end_round_after_delay()
	var/autoroundend_delay = CONFIG_GET(number/autoroundend_delay)
	targettime = REALTIMEOFDAY + autoroundend_delay
	roundend_allowed = TRUE
	to_chat(world, span_boldwarning("The week has come to a close and the round will end in [autoroundend_delay / 600] minutes."))
	for(var/client in GLOB.clients)
		if(client.prefs.toggles & SOUND_ANNOUNCEMENTS)
			SEND_SOUND(client, sound('mojave/sound/ms13/quest.ogg'))

#undef NO_MAXVOTES_CAP
