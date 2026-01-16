/// Length of time in deciseconds before the first autoroundend vote is called
/// Set to 0 to disable the subsystem altogether.
/datum/config_entry/number/vote_autoroundend_initial
	config_entry_value = 63000	// 1 hour 45 minutes
	min_val = 0

///length of time in deciseconds to wait before subsequent autoroundend votes
/datum/config_entry/number/vote_autoroundend_interval
	config_entry_value = 18000	// 30 minutes
	min_val = 0

///length of time in deciseconds to wait before ending the round
/datum/config_entry/number/autoroundend_delay
	config_entry_value = 12000	// 20 minutes
	min_val = 0

/// maximum extensions until the round autoends.
/// Set to 0 to force automatic round end after the 'vote_autoroundend_initial' elapsed.
/// Set to -1 to disable the maximum extensions cap.
/datum/config_entry/number/vote_autoroundend_maximum
	config_entry_value = 2
	min_val = -1

/// Determines if the autoroundend system runs or not.
/datum/config_entry/flag/autoroundend

/// Determines if the roundend vote can be started by anyone or not.
/datum/config_entry/flag/allow_vote_roundend
