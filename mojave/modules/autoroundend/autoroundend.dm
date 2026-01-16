#define NO_MAXVOTES_CAP -1

SUBSYSTEM_DEF(autoroundend)
	name = "Autoroundend Vote"
	flags = SS_KEEP_TIMING | SS_BACKGROUND
	wait = 1 MINUTES

	var/starttime
	var/targettime
	var/voteinterval
	var/maxvotes
	var/curvotes = 0

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
	if(maxvotes == NO_MAXVOTES_CAP || maxvotes > curvotes)
		SSvote.initiate_vote("autoroundend", "automatic roundend")
		targettime = targettime + voteinterval
		curvotes++
	else
		var/autoroundend_delay = CONFIG_GET(number/autoroundend_delay)
		SSticker.mode.autoroundend = TRUE
		SSticker.mode.round_end_time = REALTIMEOFDAY + autoroundend_delay
		to_chat(world, span_boldwarning("The round will end in [autoroundend_delay / 600] minutes."))

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

#undef NO_MAXVOTES_CAP
