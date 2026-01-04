//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "_maps\map_files\Drought\Drought.dmm" // MOJAVE SUN EDIT // ORIGINAL PATH "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "_maps\map_files\debug\runtimestation.dmm"
		#include "_maps\map_files\debug\multiz.dmm"
		#include "_maps\map_files\sunlightDebug\sunlightDebug.dmm" //MOJAVE MODULE OUTDOOR_EFFECTS
		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
