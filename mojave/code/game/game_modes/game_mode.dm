/datum/game_mode
	var/autoroundend = FALSE
	var/round_end_time = NONE

/datum/game_mode/check_finished(force_ending) //to be called by SSticker
	. = ..()
	if(!isnull(.) && autoroundend && REALTIMEOFDAY > round_end_time)
		return TRUE
