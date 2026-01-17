/datum/controller/subsystem/ticker/setup()
	. = ..()
	if(.)
		SSautoroundend.new_round(REALTIMEOFDAY)
