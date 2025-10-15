/proc/random_voice_type()
	return pick(GLOB.voice_type_list)

GLOBAL_LIST_INIT(voice_type_list, sort_list(list(
	"male_01",
	"male_02",
	"male_03",
	"male_04",
	"male_05",
	"male_06",
	"male_07",
	"male_08",
	"male_09",
	"female_01",
	"female_02",
	"female_03",
	"female_04",
	"female_05",
	"female_06",
	"female_07",
	)))
