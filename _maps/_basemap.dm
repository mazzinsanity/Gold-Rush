//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\MojaveCom.dmm" // MOJAVE SUN EDIT // ORIGINAL PATH "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\debug\multiz.dmm"
		#include "map_files\sunlightDebug\sunlightDebug.dmm" //MOJAVE MODULE OUTDOOR_EFFECTS
		#include "map_files\Drought\Drought.dmm"
		#include "map_files\Drought\Drought_above.dmm"
		#include "map_files\Drought\Drought_below.dmm"
		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
