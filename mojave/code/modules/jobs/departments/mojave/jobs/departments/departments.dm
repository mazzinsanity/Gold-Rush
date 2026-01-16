#define DEPARTMENT_BITFLAG_NCR (1<<10)
#define DEPARTMENT_NCR "NCR"
#define DEPARTMENT_BITFLAG_BOS (1<<11)
#define DEPARTMENT_BOS "BoS"
#define DEPARTMENT_BITFLAG_RAIDERS (1<<12)
#define DEPARTMENT_RAIDERS "Gangs"
#define DEPARTMENT_BITFLAG_TOWN (1<<13)
#define DEPARTMENT_TOWN "Snowcrest"
#define DEPARTMENT_BITFLAG_WASTELAND (1<<14)
#define DEPARTMENT_WASTELAND "Wasteland"
#define DEPARTMENT_BITFLAG_LEGION (1<<15)
#define DEPARTMENT_LEGION "Legion"
#define DEPARTMENT_BITFLAG_RANGERS (1<<16)
#define DEPARTMENT_RANGERS "Rangers"
#define DEPARTMENT_BITFLAG_DROUGHTTOWN (1<<17)
#define DEPARTMENT_DROUGHTTOWN "Carlin"
#define DEPARTMENT_BITFLAG_DRYLANDER (1<<18)
#define DEPARTMENT_DRYLANDER "Drylanders"
#define DEPARTMENT_BITFLAG_GOLDMAN (1<<19)
#define DEPARTMENT_GOLDMAN "Goldman"

// Fancy name for fancy boys
/datum/job_department/var/department_full_name = null

/datum/job_department/ncr
	department_name = DEPARTMENT_NCR
	department_bitflags = DEPARTMENT_BITFLAG_NCR
	department_experience_type = EXP_TYPE_NCR
	department_full_name = "New California Republic"

/datum/job_department/legion
	department_name = DEPARTMENT_LEGION
	department_bitflags = DEPARTMENT_BITFLAG_LEGION
	department_head = /datum/job/ms13/legion/veterandecanus
	department_experience_type = EXP_TYPE_LEGION
	department_full_name = "Caesar's Legion"

/datum/job_department/bos
	department_name = DEPARTMENT_BOS
	department_bitflags = DEPARTMENT_BITFLAG_BOS
	department_head = /datum/job/ms13/bos/head_paladin
	department_experience_type = EXP_TYPE_BOS
	department_full_name = "Brotherhood of Steel"	

/datum/job_department/town_drought
	department_name = DEPARTMENT_DROUGHTTOWN
	department_bitflags = DEPARTMENT_BITFLAG_DROUGHTTOWN
	department_head = /datum/job/ms13/town_drought/carlin_mayor
	department_experience_type = EXP_TYPE_DROUGHTTOWN
	department_full_name = "Carlin"

/datum/job_department/goldman
	department_name = DEPARTMENT_GOLDMAN
	department_bitflags = DEPARTMENT_BITFLAG_GOLDMAN
	department_head = /datum/job/ms13/goldman/ringleader
	department_experience_type = EXP_TYPE_GOLDMAN
	department_full_name = "Goldman Posse"

/datum/job_department/wasteland
	department_name = DEPARTMENT_WASTELAND
	department_bitflags = DEPARTMENT_BITFLAG_WASTELAND
	department_experience_type = EXP_TYPE_WASTELAND
	label_class = "WASTELAND"

/datum/job_department/drylander
	department_name = DEPARTMENT_DRYLANDER
	department_bitflags = DEPARTMENT_BITFLAG_DRYLANDER
	department_head = /datum/job/ms13/drylander/chieftain
	department_experience_type = EXP_TYPE_DRYLANDERS
	department_full_name = "Drylander Tribe"

/datum/job_department/town
	department_name = DEPARTMENT_TOWN
	department_bitflags = DEPARTMENT_BITFLAG_TOWN
	department_head = /datum/job/ms13/town/snowcrest_mayor
	department_experience_type = EXP_TYPE_TOWN
	department_full_name = "Town of Snowcrest"

/datum/job_department/raiders
	department_name = DEPARTMENT_RAIDERS
	department_bitflags = DEPARTMENT_BITFLAG_RAIDERS
	department_experience_type = EXP_TYPE_RAIDERS
	department_full_name = "Gangs of Mammoth"

// FLAG DEFINES

/datum/asset/simple/ms13/faction_flags
	assets = list(
		"NCR_flag.png" = 'mojave/icons/faction_flags/flag_ncr.png',
		"Legion_flag.png" = 'mojave/icons/faction_flags/flag_legion.png',
		"Rangers_flag.png" = 'mojave/icons/faction_flags/flag_rangers.png',
		"BoS_flag.png" = 'mojave/icons/faction_flags/flag_brotherhood.png',
		"Gangs_flag.png" = 'mojave/icons/faction_flags/flag_raiders.png',
		"Snowcrest_flag.png" = 'mojave/icons/faction_flags/flag_wastelanders.png', //placeholder
		"Wasteland_flag.png" = 'mojave/icons/faction_flags/flag_wastelanders.png',
		"Carlin_flag.png" = 'mojave/icons/faction_flags/flag_wastelanders.png', //placeholder
		"Drylanders_flag.png" = 'mojave/icons/faction_flags/flag_wastelanders.png',
		"Goldman_flag.png" = 'mojave/icons/faction_flags/flag_goldman.png'
	)
