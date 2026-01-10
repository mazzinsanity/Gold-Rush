#define SHORT "short"
#define MEDIUM "medium"
#define LONG "long"
#define BALD "bald"

/proc/init_sprite_accessory_subtypes(prototype, list/L, list/male, list/female, list/bald, list/short, list/medium, list/long, roundstart = FALSE)//Roundstart argument builds a specific list for roundstart parts where some parts may be locked
	if(!istype(L))
		L = list()
	if(!istype(male))
		male = list()
	if(!istype(female))
		female = list()
	if(!istype(bald))
		bald = list()
	if(!istype(short))
		short = list()
	if(!istype(medium))
		medium = list()
	if(!istype(long))
		long = list()

	for(var/path in subtypesof(prototype))
		if(roundstart)
			var/datum/sprite_accessory/P = path
			if(initial(P.locked))
				continue
		var/datum/sprite_accessory/D = new path()

		if(D.icon_state)
			L[D.name] = D
		else
			L += D.name

		switch(D.length)
			if(BALD)
				bald += D.name
			if(SHORT)
				short += D.name
			if(MEDIUM)
				medium += D.name
			if(LONG)
				long += D.name

		switch(D.gender)
			if(MALE)
				male += D.name
			if(FEMALE)
				female += D.name
			else
				male += D.name
				female += D.name
	return L

/datum/sprite_accessory
	/// The icon file the accessory is located in.
	var/icon
	/// The icon_state of the accessory. 
	var/icon_state
	var/icon_state_2
	var/icon_state_3
	/// The preview name of the accessory.
	var/name
	/// Determines if the accessory will be skipped or included in random hair generations.
	var/gender = NEUTER
	/// Something that can be worn by either gender, but looks different on each.
	var/gender_specific
	/// Determines if the accessory will be skipped by color preferences.
	var/use_static
	/// Is this part locked from roundstart selection? Used for parts that apply effects.
	var/locked = FALSE
	/// Should we center the sprite?
	var/center = FALSE
	/// The width of the sprite in pixels. Used to center it if necessary.
	var/dimension_x = 32
	/// The height of the sprite in pixels. Used to center it if necessary.
	var/dimension_y = 32
	/// Should this sprite block emissives?
	var/em_block = FALSE
	/// Length of hair for use in haircutting/mirror use
	var/length

//////////////////////
// Hair Definitions //
//////////////////////
/datum/sprite_accessory/hair
	icon = 'icons/mob/human_face.dmi'   // default icon for all hairs

	// please make sure they're sorted alphabetically and, where needed, categorized
	// try to capitalize the names please~
	// try to spell
	// you do not need to define _s or _l sub-states, game automatically does this for you

/datum/sprite_accessory/hair/afro
	name = "Afro Small"
	icon_state = "hair_afro"
	length = MEDIUM

/datum/sprite_accessory/hair/afro2
	name = "Afro Medium"
	icon_state = "hair_afro2"
	length = MEDIUM

/datum/sprite_accessory/hair/afro_large
	name = "Afro Large"
	icon_state = "hair_bigafro"
	length = LONG

/datum/sprite_accessory/hair/bald
	name = "Bald"
	icon_state = null
	length = BALD

/datum/sprite_accessory/hair/balding
	name = "Balding"
	icon_state = "hair_e"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/boddicker
	name = "Balding Long"
	icon_state = "hair_boddicker"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/bedhead
	name = "Bedhead"
	icon_state = "hair_bedhead"
	length = MEDIUM

/datum/sprite_accessory/hair/bedhead2
	name = "Bedhead Fringe"
	icon_state = "hair_bedheadv2"
	length = MEDIUM

/datum/sprite_accessory/hair/bedhead3
	name = "Bedhead Flat"
	icon_state = "hair_bedheadv3"
	length = MEDIUM

/datum/sprite_accessory/hair/bob
	name = "Bob Hair"
	icon_state = "hair_bob"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/bob2
	name = "Bob Hair Long"
	icon_state = "hair_bob2"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/bob3
	name = "Bob Hair Short"
	icon_state = "hair_bobcut"
	gender = FEMALE
	length = SHORT

/datum/sprite_accessory/hair/bob4
	name = "Bob Hair Fringe"
	icon_state = "hair_bob4"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/bowlcut
	name = "Bowlcut"
	icon_state = "hair_bowlcut2"
	length = SHORT

/datum/sprite_accessory/hair/front_braid
	name = "Braided Front"
	icon_state = "hair_braidfront"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/lowbraid
	name = "Braid"
	icon_state = "hair_hbraid"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/braidtail
	name = "Braided Tail"
	icon_state = "hair_braidtail"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/bun
	name = "Bun"
	icon_state = "hair_bun"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/bun2
	name = "Bun Pigtails"
	icon_state = "hair_bunhead2"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/bun3
	name = "Bun Wavy"
	icon_state = "hair_bun3"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/largebun
	name = "Bun Large"
	icon_state = "hair_largebun"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/manbun
	name = "Bun Manbun"
	icon_state = "hair_manbun"
	gender = MALE
	length = MEDIUM

/datum/sprite_accessory/hair/tightbun
	name = "Bun Short"
	icon_state = "hair_tightbun"
	length = SHORT

/datum/sprite_accessory/hair/business
	name = "Business"
	icon_state = "hair_business"
	length = SHORT

/datum/sprite_accessory/hair/business2
	name = "Business Slick"
	icon_state = "hair_business2"
	length = SHORT

/datum/sprite_accessory/hair/business3
	name = "Business Pointed"
	icon_state = "hair_business3"
	length = SHORT

/datum/sprite_accessory/hair/business4
	name = "Business Combed"
	icon_state = "hair_business4"
	length = SHORT

/datum/sprite_accessory/hair/cia
	name = "Business Flat"
	icon_state = "hair_cia"
	length = SHORT

/datum/sprite_accessory/hair/buzz
	name = "Buzzcut"
	icon_state = "hair_buzzcut"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/combover
	name = "Combover"
	icon_state = "hair_combover"
	gender = MALE
	length = MEDIUM

/datum/sprite_accessory/hair/cornrows1
	name = "Cornrows"
	icon_state = "hair_cornrows"
	length = MEDIUM

/datum/sprite_accessory/hair/cornrows2
	name = "Cornrows Long"
	icon_state = "hair_cornrows2"
	length = LONG

/datum/sprite_accessory/hair/cornrowbun
	name = "Cornrow Bun"
	icon_state = "hair_cornrowbun"
	length = MEDIUM

/datum/sprite_accessory/hair/cornrowbraid
	name = "Cornrow Braid"
	icon_state = "hair_cornrowbraid"
	length = MEDIUM

/datum/sprite_accessory/hair/cornrowdualtail
	name = "Cornrow Tail"
	icon_state = "hair_cornrowtail"
	length = MEDIUM

/datum/sprite_accessory/hair/crew
	name = "Crewcut"
	icon_state = "hair_crewcut"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/curls
	name = "Curls"
	icon_state = "hair_curls"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/cut
	name = "Classic"
	icon_state = "hair_c"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/dreadlocks
	name = "Dreadlocks"
	icon_state = "hair_dreads"
	length = LONG

/datum/sprite_accessory/hair/emo
	name = "Emo"
	icon_state = "hair_emo"
	length = SHORT

/datum/sprite_accessory/hair/emofrine
	name = "Emo Fringe"
	icon_state = "hair_emofringe"
	length = SHORT

/datum/sprite_accessory/hair/baldfade
	name = "Fade Bald"
	icon_state = "hair_baldfade"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/highfade
	name = "Fade Most"
	icon_state = "hair_highfade"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/medfade
	name = "Fade Some"
	icon_state = "hair_medfade"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/lowfade
	name = "Fade Tiny"
	icon_state = "hair_lowfade"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/flair
	name = "Flair"
	icon_state = "hair_flair"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/flow_hair
	name = "Flow Hair"
	icon_state = "hair_f"
	length = SHORT

/datum/sprite_accessory/hair/gentle
	name = "Gentle"
	icon_state = "hair_gentle"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/halfbang
	name = "Half-banged Hair"
	icon_state = "hair_halfbang"
	length = SHORT

/datum/sprite_accessory/hair/halfshaved
	name = "Half-shaved"
	icon_state = "hair_halfshaved"
	length = LONG

/datum/sprite_accessory/hair/hedgehog
	name = "Hedgehog Hair"
	icon_state = "hair_hedgehog"
	length = SHORT

/datum/sprite_accessory/hair/himecut
	name = "Hime Cut"
	icon_state = "hair_himecut"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/himecut2
	name = "Hime Cut Straight"
	icon_state = "hair_himecut2"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/shorthime
	name = "Hime Cut Short"
	icon_state = "hair_shorthime"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/himeup
	name = "Hime Updo"
	icon_state = "hair_himeup"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/keanu
	name = "Keanu"
	icon_state = "hair_keanu"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/long3
	name = "Long Hair"
	icon_state = "hair_long3"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/long_over_eye
	name = "Long Over Eye"
	icon_state = "hair_longovereye"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/longbangs
	name = "Long Bangs"
	icon_state = "hair_lbangs"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/longemo
	name = "Long Emo"
	icon_state = "hair_longemo"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/longfringe
	name = "Long Fringe"
	icon_state = "hair_longfringe"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/sidepartlongalt
	name = "Long Side Part"
	icon_state = "hair_longsidepart"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/messy
	name = "Messy"
	icon_state = "hair_messy"
	length = MEDIUM

/datum/sprite_accessory/hair/modern
	name = "Modern"
	icon_state = "hair_modern"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/mohawk
	name = "Mohawk"
	icon_state = "hair_d"
	length = MEDIUM

/datum/sprite_accessory/hair/unshavenmohawk
	name = "Mohawk Unshaven"
	icon_state = "hair_unshaven_mohawk"
	length = LONG

/datum/sprite_accessory/hair/oxton
	name = "Oxton"
	icon_state = "hair_oxton"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/parted
	name = "Parted"
	icon_state = "hair_parted"
	gender = FEMALE
	length = SHORT

/datum/sprite_accessory/hair/partedside
	name = "Parted"
	icon_state = "hair_part"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/coffeehouse
	name = "Pointed"
	icon_state = "hair_coffeehouse"
	length = SHORT

/datum/sprite_accessory/hair/kagami
	name = "Pigtails"
	icon_state = "hair_kagami"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/pigtail
	name = "Pigtails Front"
	icon_state = "hair_pigtails"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/pigtail2
	name = "Pigtails Side"
	icon_state = "hair_pigtails2"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/pixie
	name = "Pixie Cut"
	icon_state = "hair_pixie"
	gender = FEMALE
	length = SHORT

/datum/sprite_accessory/hair/pompadour
	name = "Pompadour"
	icon_state = "hair_pompadour"
	gender = MALE
	length = MEDIUM

/datum/sprite_accessory/hair/bigpompadour
	name = "Pompadour Big"
	icon_state = "hair_bigpompadour"
	gender = MALE
	length = MEDIUM

/datum/sprite_accessory/hair/ponytail1
	name = "Ponytail Short"
	icon_state = "hair_ponytail"
	length = MEDIUM

/datum/sprite_accessory/hair/ponytail3
	name = "Ponytail Clean"
	icon_state = "hair_ponytail3"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/ponytail4
	name = "Ponytail Out"
	icon_state = "hair_ponytail4"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/stail
	name = "Ponytail Side"
	icon_state = "hair_stail"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/countryponytail
	name = "Ponytail Country"
	icon_state = "hair_country"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/fringetail
	name = "Ponytail Fringe"
	icon_state = "hair_fringetail"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/spikyponytail
	name = "Ponytail Spiky"
	icon_state = "hair_spikyponytail"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/poofy
	name = "Poofy"
	icon_state = "hair_poofy"
	length = MEDIUM

/datum/sprite_accessory/hair/quiff
	name = "Quiff"
	icon_state = "hair_quiff"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/shaved
	name = "Shaved"
	icon_state = "hair_shaved"
	length = SHORT

/datum/sprite_accessory/hair/shavedpart
	name = "Shaved Part"
	icon_state = "hair_shavedpart"
	length = SHORT

/datum/sprite_accessory/hair/short
	name = "Short"
	icon_state = "hair_a"
	length = SHORT

/datum/sprite_accessory/hair/shorthair2
	name = "Short Large"
	icon_state = "hair_shorthair2"
	length = SHORT

/datum/sprite_accessory/hair/shorthair3
	name = "Short Messy"
	icon_state = "hair_shorthair3"
	length = SHORT

/datum/sprite_accessory/hair/shorthaireighties
	name = "Short Hair 80s"
	icon_state = "hair_80s"
	length = MEDIUM

/datum/sprite_accessory/hair/shoulderlength
	name = "Shoulder-length Hair"
	icon_state = "hair_b"
	length = SHORT

/datum/sprite_accessory/hair/sidecut
	name = "Sidecut"
	icon_state = "hair_sidecut"
	length = SHORT

/datum/sprite_accessory/hair/skinhead
	name = "Skinhead"
	icon_state = "hair_skinhead"
	length = BALD

/datum/sprite_accessory/hair/spiky
	name = "Spiky"
	icon_state = "hair_spikey"
	length = SHORT

/datum/sprite_accessory/hair/swept
	name = "Swept Back Hair"
	icon_state = "hair_swept"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/thinning
	name = "Thinning"
	icon_state = "hair_thinning"
	gender = MALE
	length = SHORT

/datum/sprite_accessory/hair/topknot
	name = "Topknot"
	icon_state = "hair_topknot"
	length = SHORT

/datum/sprite_accessory/hair/trimmed
	name = "Trimmed"
	icon_state = "hair_trimmed"
	length = SHORT

/datum/sprite_accessory/hair/trimflat
	name = "Trimmed Flat"
	icon_state = "hair_trimflat"
	length = SHORT

/datum/sprite_accessory/hair/twintails
	name = "Twintails"
	icon_state = "hair_twintail"
	gender = FEMALE
	length = LONG

/datum/sprite_accessory/hair/undercut
	name = "Undercut"
	icon_state = "hair_undercut"
	length = SHORT

/datum/sprite_accessory/hair/undercutleft
	name = "Undercut Left"
	icon_state = "hair_undercutleft"
	length = SHORT

/datum/sprite_accessory/hair/undercutright
	name = "Undercut Right"
	icon_state = "hair_undercutright"
	length = SHORT

/datum/sprite_accessory/hair/longer
	name = "Very Long"
	icon_state = "hair_vlong"
	length = LONG

/datum/sprite_accessory/hair/veryshortovereye
	name = "Very Short Over Eye"
	icon_state = "hair_veryshortovereyealternate"
	gender = FEMALE
	length = MEDIUM

/datum/sprite_accessory/hair/longestalt
	name = "Very Long with Fringe"
	icon_state = "hair_vlongfringe"
	gender = FEMALE
	length = LONG

/*
/////////////////////////////////////
/  =---------------------------=    /
/  == Gradient Hair Definitions ==  /
/  =---------------------------=    /
/////////////////////////////////////
*/

/datum/sprite_accessory/hair_gradient
	icon = 'icons/mob/hair_gradients.dmi'

/datum/sprite_accessory/hair_gradient/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/hair_gradient/fadeup
	name = "Fade Up"
	icon_state = "fadeup"

/datum/sprite_accessory/hair_gradient/fadedown
	name = "Fade Down"
	icon_state = "fadedown"

/datum/sprite_accessory/hair_gradient/vertical_split
	name = "Vertical Split"
	icon_state = "vsplit"

/datum/sprite_accessory/hair_gradient/_split
	name = "Horizontal Split"
	icon_state = "bottomflat"

/datum/sprite_accessory/hair_gradient/reflected
	name = "Reflected"
	icon_state = "reflected_high"

/datum/sprite_accessory/hair_gradient/reflected_inverse
	name = "Reflected Inverse"
	icon_state = "reflected_inverse_high"

/datum/sprite_accessory/hair_gradient/wavy
	name = "Wavy"
	icon_state = "wavy"

/datum/sprite_accessory/hair_gradient/long_fade_up
	name = "Long Fade Up"
	icon_state = "long_fade_up"

/datum/sprite_accessory/hair_gradient/long_fade_down
	name = "Long Fade Down"
	icon_state = "long_fade_down"

/datum/sprite_accessory/hair_gradient/short_fade_up
	name = "Short Fade Up"
	icon_state = "short_fade_up"

/datum/sprite_accessory/hair_gradient/short_fade_down
	name = "Short Fade Down"
	icon_state = "short_fade_down"

/datum/sprite_accessory/hair_gradient/wavy_spike
	name = "Spiked Wavy"
	icon_state = "wavy_spiked"

/////////////////////////////
// Facial Hair Definitions //
/////////////////////////////

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_face.dmi'
	gender = MALE // barf (unless you're a dorf, dorfs dig chix w/ beards :P)
	em_block = TRUE

// please make sure they're sorted alphabetically and categorized

/datum/sprite_accessory/facial_hair/shaved
	name = "Shaved"
	icon_state = null
	gender = NEUTER

/datum/sprite_accessory/facial_hair/abe
	name = "Beard (Abraham Lincoln)"
	icon_state = "facial_abe"

/datum/sprite_accessory/facial_hair/chinstrap
	name = "Beard (Chinstrap)"
	icon_state = "facial_chin"

/datum/sprite_accessory/facial_hair/dwarf
	name = "Beard (Dwarf)"
	icon_state = "facial_dwarf"

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Beard (Full)"
	icon_state = "facial_fullbeard"

/datum/sprite_accessory/facial_hair/croppedfullbeard
	name = "Beard (Cropped Fullbeard)"
	icon_state = "facial_croppedfullbeard"

/datum/sprite_accessory/facial_hair/gt
	name = "Beard (Goatee)"
	icon_state = "facial_gt"

/datum/sprite_accessory/facial_hair/hip
	name = "Beard (Hipster)"
	icon_state = "facial_hip"

/datum/sprite_accessory/facial_hair/jensen
	name = "Beard (Jensen)"
	icon_state = "facial_jensen"

/datum/sprite_accessory/facial_hair/neckbeard
	name = "Beard (Neckbeard)"
	icon_state = "facial_neckbeard"

/datum/sprite_accessory/facial_hair/vlongbeard
	name = "Beard (Very Long)"
	icon_state = "facial_wise"

/datum/sprite_accessory/facial_hair/muttonmus
	name = "Beard (Muttonmus)"
	icon_state = "facial_muttonmus"

/datum/sprite_accessory/facial_hair/martialartist
	name = "Beard (Martial Artist)"
	icon_state = "facial_martialartist"

/datum/sprite_accessory/facial_hair/chinlessbeard
	name = "Beard (Chinless Beard)"
	icon_state = "facial_chinlessbeard"

/datum/sprite_accessory/facial_hair/moonshiner
	name = "Beard (Moonshiner)"
	icon_state = "facial_moonshiner"

/datum/sprite_accessory/facial_hair/longbeard
	name = "Beard (Long)"
	icon_state = "facial_longbeard"

/datum/sprite_accessory/facial_hair/volaju
	name = "Beard (Volaju)"
	icon_state = "facial_volaju"

/datum/sprite_accessory/facial_hair/threeoclock
	name = "Beard (Three o Clock Shadow)"
	icon_state = "facial_3oclock"

/datum/sprite_accessory/facial_hair/fiveoclock
	name = "Beard (Five o Clock Shadow)"
	icon_state = "facial_fiveoclock"

/datum/sprite_accessory/facial_hair/fiveoclockm
	name = "Beard (Five o Clock Moustache)"
	icon_state = "facial_5oclockmoustache"

/datum/sprite_accessory/facial_hair/sevenoclock
	name = "Beard (Seven o Clock Shadow)"
	icon_state = "facial_7oclock"

/datum/sprite_accessory/facial_hair/sevenoclockm
	name = "Beard (Seven o Clock Moustache)"
	icon_state = "facial_7oclockmoustache"

/datum/sprite_accessory/facial_hair/moustache
	name = "Moustache"
	icon_state = "facial_moustache"

/datum/sprite_accessory/facial_hair/pencilstache
	name = "Moustache (Pencilstache)"
	icon_state = "facial_pencilstache"

/datum/sprite_accessory/facial_hair/smallstache
	name = "Moustache (Smallstache)"
	icon_state = "facial_smallstache"

/datum/sprite_accessory/facial_hair/walrus
	name = "Moustache (Walrus)"
	icon_state = "facial_walrus"

/datum/sprite_accessory/facial_hair/fu
	name = "Moustache (Fu Manchu)"
	icon_state = "facial_fumanchu"

/datum/sprite_accessory/facial_hair/hogan
	name = "Moustache (Hulk Hogan)"
	icon_state = "facial_hogan" //-Neek

/datum/sprite_accessory/facial_hair/selleck
	name = "Moustache (Selleck)"
	icon_state = "facial_selleck"

/datum/sprite_accessory/facial_hair/chaplin
	name = "Moustache (Square)"
	icon_state = "facial_chaplin"

/datum/sprite_accessory/facial_hair/vandyke
	name = "Moustache (Van Dyke)"
	icon_state = "facial_vandyke"

/datum/sprite_accessory/facial_hair/watson
	name = "Moustache (Watson)"
	icon_state = "facial_watson"

/datum/sprite_accessory/facial_hair/elvis
	name = "Sideburns (Elvis)"
	icon_state = "facial_elvis"

/datum/sprite_accessory/facial_hair/mutton
	name = "Sideburns (Mutton Chops)"
	icon_state = "facial_mutton"

/datum/sprite_accessory/facial_hair/sideburn
	name = "Sideburns"
	icon_state = "facial_sideburn"

///////////////////////////
// Underwear Definitions //
///////////////////////////

/datum/sprite_accessory/underwear
	icon = 'mojave/icons/mob/clothing/underwear.dmi'
	use_static = FALSE
	em_block = TRUE


//MALE UNDERWEAR

/datum/sprite_accessory/underwear/nude
	name = "Nude"
	icon_state = null
	gender = NEUTER

/datum/sprite_accessory/underwear/rag_male
	name = "Rag"
	icon_state = "rag_u_m"
	gender = MALE
	use_static = TRUE

//FEMALE UNDERWEAR

/datum/sprite_accessory/underwear/rag_female
	name = "Ragkini"
	icon_state = "rag_u_f"
	gender = FEMALE
	use_static = TRUE

/datum/sprite_accessory/underwear/bikini
	name = "Bikini"
	icon_state = "bikini"
	gender = FEMALE

/datum/sprite_accessory/underwear/bralette
	name = "Bralette"
	icon_state = "bralette"
	gender = FEMALE

//NEUTRAL UNDERWEAR

/datum/sprite_accessory/underwear/briefs
	name = "Briefs"
	icon_state = "briefs"
	gender = NEUTER

/datum/sprite_accessory/underwear/boxers
	name = "Boxers"
	icon_state = "boxers"
	gender = NEUTER

////////////////////////////
// Undershirt Definitions //
////////////////////////////

/datum/sprite_accessory/undershirt
	icon = 'mojave/icons/mob/clothing/underwear.dmi'
	em_block = TRUE

/datum/sprite_accessory/undershirt/nude
	name = "Nude"
	icon_state = null
	gender = NEUTER

// please make sure they're sorted alphabetically and categorized

/datum/sprite_accessory/undershirt/rag
	name = "Rag"
	icon_state = "rag_s"
	gender = NEUTER
	use_static = TRUE

/datum/sprite_accessory/undershirt/shirt
	name = "T-Shirt"
	icon_state = "shirt"
	gender = NEUTER
	use_static = TRUE

/datum/sprite_accessory/undershirt/vest
	name = "Vest"
	icon_state = "vest"
	gender = NEUTER
	use_static = TRUE

///////////////////////
// Socks Definitions //
///////////////////////

/datum/sprite_accessory/socks
	icon = 'mojave/icons/mob/clothing/underwear.dmi'
	em_block = TRUE

/datum/sprite_accessory/socks/nude
	name = "Nude"
	icon_state = null

// please make sure they're sorted alphabetically and categorized

/datum/sprite_accessory/socks/rag
	name = "Rag"
	icon_state = "rag_so"
	use_static = TRUE

/datum/sprite_accessory/socks/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/socks/long
	name = "Long"
	icon_state = "long"

//END OF MOJAVE SUN CHANGES//

//////////////////////////
// Markings Definitions //
//////////////////////////

/datum/sprite_accessory/markings
	icon = 'icons/mob/markings.dmi'

///////////////////////////////
// Head Markings Definitions //
///////////////////////////////

/datum/sprite_accessory/markings/head/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/head/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/markings/head/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/markings/head/facemask
	name = "Facemask"
	icon_state = "facemask"

/datum/sprite_accessory/markings/head/facedisk
	name = "Facedisk"
	icon_state = "facedisk"

/datum/sprite_accessory/markings/head/verticalstripe
	name = "Vertical Stripe"
	icon_state = "verticalstripe"

/datum/sprite_accessory/markings/head/fangs
	name = "Fangs"
	icon_state = "fangs"

/datum/sprite_accessory/markings/head/lips
	name = "Lips"
	icon_state = "lips"

/datum/sprite_accessory/markings/head/cyclopssclera
	name = "Cyclops Sclera"
	icon_state = "cyclopssclera"

/datum/sprite_accessory/markings/head/monster3
	name = "Monster 3"
	icon_state = "monster3"

/datum/sprite_accessory/markings/head/monster2
	name = "Monster 2"
	icon_state = "monster2"

/datum/sprite_accessory/markings/head/clowncross
	name = "Clown Cross"
	icon_state = "clowncross"

/datum/sprite_accessory/markings/head/clownlips
	name = "Clown Lips"
	icon_state = "clownlips"

/datum/sprite_accessory/markings/head/eyesinner
	name = "Eyes Sinner"
	icon_state = "eyesinner"

/datum/sprite_accessory/markings/head/eyesouter
	name = "Eyes Outer"
	icon_state = "eyesouter"

/datum/sprite_accessory/markings/head/deer
	name = "Deer"
	icon_state = "deer"

/datum/sprite_accessory/markings/head/thirdeye
	name = "Third Eye"
	icon_state = "thirdeye"

/datum/sprite_accessory/markings/head/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/head/splotcheswap
	name = "Splotches Swap"
	icon_state = "splotchesswap"

/datum/sprite_accessory/markings/head/dome
	name = "Dome"
	icon_state = "dome"

/datum/sprite_accessory/markings/head/talleyes
	name = "Tall Eyes"
	icon_state = "talleyes"

/datum/sprite_accessory/markings/head/wideeyes
	name = "Wide Eyes"
	icon_state = "wideeyes"

/datum/sprite_accessory/markings/head/angledeyes
	name = "Angled Eyes"
	icon_state = "angledeyes"

/datum/sprite_accessory/markings/head/skintone
	name = "Skintone"
	icon_state = "skintone"

////////////////////////////////
// Chest Markings Definitions //
////////////////////////////////

/datum/sprite_accessory/markings/chest/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/chest/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/markings/chest/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/markings/chest/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/markings/chest/lbelly
	name = "Light Belly"
	icon_state = "lbelly"

/datum/sprite_accessory/markings/chest/floofer_f
	name = "Floofer (Female)"
	icon_state = "floofer_f"

/datum/sprite_accessory/markings/chest/chestplate
	name = "Chestplate"
	icon_state = "chestplate"

/datum/sprite_accessory/markings/chest/bellybutton
	name = "Belly Button"
	icon_state = "bellybutton"

/datum/sprite_accessory/markings/chest/cleavage
	name = "Cleavage"
	icon_state = "cleavage"

/datum/sprite_accessory/markings/chest/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/chest/topscars
	name = "Top Scars"
	icon_state = "topscars_1"
	icon_state_2 = "topscars_2"

/datum/sprite_accessory/markings/chest/cryptid_male
	name = "Cryptid"
	icon_state = "cryptid_marking_m"

/datum/sprite_accessory/markings/chest/cryptid_female
	name = "Cryptid (Female)"
	icon_state = "cryptid_marking_f"

/datum/sprite_accessory/markings/chest/cryptid_simple
	name = "Cryptid (Simple)"
	icon_state = "cryptid"

/datum/sprite_accessory/markings/chest/skintone_male
	name = "Skintone"
	icon_state = "skintone_m"

/datum/sprite_accessory/markings/chest/skintone_female
	name = "Skintone (Female)"
	icon_state = "skintone_f"

/datum/sprite_accessory/markings/chest/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/chest/weight2_m
	name = "Body Weight (Male)"
	icon_state = "weight2_m"

/datum/sprite_accessory/markings/chest/weight2_f
	name = "Body Weight (Female)"
	icon_state = "weight2_f"

/datum/sprite_accessory/markings/chest/bellymonster
	name = "Belly Monster"
	icon_state = "bellymonster"

/datum/sprite_accessory/markings/chest/bellymonster_alt
	name = "Belly Monster Alt"
	icon_state = "bellymonster_alt"

///////////////////////////////////
// Left Arm Markings Definitions //
///////////////////////////////////

/datum/sprite_accessory/markings/l_arm/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/l_arm/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/markings/l_arm/floofer
	name = "Floofer"
	icon_state = "floofer"

/datum/sprite_accessory/markings/l_arm/sleeve
	name = "Sleeve"
	icon_state = "sleeve"

/datum/sprite_accessory/markings/l_arm/shoulder
	name = "Shoulder"
	icon_state = "shoulder"

/datum/sprite_accessory/markings/l_arm/elbow
	name = "Elbow"
	icon_state = "elbow"

/datum/sprite_accessory/markings/l_arm/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/l_arm/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/l_arm/cryptid
	name = "Cryptid"
	icon_state = "cryptid_marking"

/datum/sprite_accessory/markings/l_arm/skintone
	name = "Skintone"
	icon_state = "skintone"

/datum/sprite_accessory/markings/l_arm/shoulderpad
	name = "Shoulderpad"
	icon_state = "shoulderpad"

////////////////////////////////////
// Left Hand Markings Definitions //
////////////////////////////////////

/datum/sprite_accessory/markings/l_hand/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/l_hand/floofer
	name = "Floofer"
	icon_state = "floofer"

/datum/sprite_accessory/markings/l_hand/claws
	name = "Claws"
	icon_state = "claws"

/datum/sprite_accessory/markings/l_hand/sleeve
	name = "Sleeve"
	icon_state = "sleeve"

/datum/sprite_accessory/markings/l_hand/glove
	name = "Glove"
	icon_state = "glove"

/datum/sprite_accessory/markings/l_hand/elbow
	name = "Elbow"
	icon_state = "elbow"

/datum/sprite_accessory/markings/l_hand/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/l_hand/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/l_hand/cryptid
	name = "Cryptid"
	icon_state = "cryptid_marking"

/datum/sprite_accessory/markings/l_hand/skintone
	name = "Skintone"
	icon_state = "skintone"

/datum/sprite_accessory/markings/l_hand/chitinarmor
	name = "Chitin Armor"
	icon_state = "chitinarmor"

////////////////////////////////////
// Right Arm Markings Definitions //
////////////////////////////////////

/datum/sprite_accessory/markings/r_arm/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/r_arm/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/markings/r_arm/floofer
	name = "Floofer"
	icon_state = "floofer"

/datum/sprite_accessory/markings/r_arm/sleeve
	name = "Sleeve"
	icon_state = "sleeve"

/datum/sprite_accessory/markings/r_arm/shoulder
	name = "Shoulder"
	icon_state = "shoulder"

/datum/sprite_accessory/markings/r_arm/elbow
	name = "Elbow"
	icon_state = "elbow"

/datum/sprite_accessory/markings/r_arm/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/r_arm/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/r_arm/cryptid
	name = "Cryptid"
	icon_state = "cryptid_marking"

/datum/sprite_accessory/markings/r_arm/skintone
	name = "Skintone"
	icon_state = "skintone"

/datum/sprite_accessory/markings/r_arm/shoulderpad
	name = "Shoulderpad"
	icon_state = "shoulderpad"

/////////////////////////////////////
// Right Hand Markings Definitions //
/////////////////////////////////////

/datum/sprite_accessory/markings/r_hand/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/r_hand/floofer
	name = "Floofer"
	icon_state = "floofer"

/datum/sprite_accessory/markings/r_hand/claws
	name = "Claws"
	icon_state = "claws"

/datum/sprite_accessory/markings/r_hand/sleeve
	name = "Sleeve"
	icon_state = "sleeve"

/datum/sprite_accessory/markings/r_hand/glove
	name = "Glove"
	icon_state = "glove"

/datum/sprite_accessory/markings/r_hand/elbow
	name = "Elbow"
	icon_state = "elbow"

/datum/sprite_accessory/markings/r_hand/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/r_hand/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/r_hand/cryptid
	name = "Cryptid"
	icon_state = "cryptid_marking"

/datum/sprite_accessory/markings/r_hand/skintone
	name = "Skintone"
	icon_state = "skintone"

/datum/sprite_accessory/markings/r_hand/chitinarmor
	name = "Chitin Armor"
	icon_state = "chitinarmor"

///////////////////////////////////
// Left Leg Markings Definitions //
///////////////////////////////////

/datum/sprite_accessory/markings/l_leg/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/l_leg/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/markings/l_leg/floofer
	name = "Floofer"
	icon_state = "floofer"

/datum/sprite_accessory/markings/l_leg/longsock
	name = "Long Sock"
	icon_state = "longsock"

/datum/sprite_accessory/markings/l_leg/hip
	name = "Hip"
	icon_state = "hip"

/datum/sprite_accessory/markings/l_leg/talon
	name = "Talon"
	icon_state = "talon"

/datum/sprite_accessory/markings/l_leg/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/l_leg/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/l_leg/skintone
	name = "Skintone"
	icon_state = "skintone"

////////////////////////////////////
// Left Foot Markings Definitions //
////////////////////////////////////

/datum/sprite_accessory/markings/l_foot/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/l_foot/claws
	name = "Claws"
	icon_state = "claws"

/datum/sprite_accessory/markings/l_foot/sock
	name = "Sock"
	icon_state = "sock"

///////////////////////////////////
// Right Leg Markings Definitions //
///////////////////////////////////

/datum/sprite_accessory/markings/r_leg/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/r_leg/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/markings/r_leg/floofer
	name = "Floofer"
	icon_state = "floofer"

/datum/sprite_accessory/markings/r_leg/longsock
	name = "Long Sock"
	icon_state = "longsock"

/datum/sprite_accessory/markings/r_leg/hip
	name = "Hip"
	icon_state = "hip"

/datum/sprite_accessory/markings/r_leg/talon
	name = "Talon"
	icon_state = "talon"

/datum/sprite_accessory/markings/r_leg/splotches
	name = "Splotches"
	icon_state = "splotches"

/datum/sprite_accessory/markings/r_leg/chitin
	name = "Chitin"
	icon_state = "chitin"

/datum/sprite_accessory/markings/r_leg/skintone
	name = "Skintone"
	icon_state = "skintone"

/////////////////////////////////////
// Right Foot Markings Definitions //
/////////////////////////////////////

/datum/sprite_accessory/markings/r_foot/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/markings/r_foot/claws
	name = "Claws"
	icon_state = "claws"

/datum/sprite_accessory/markings/r_foot/sock
	name = "Sock"
	icon_state = "sock"

///////////////////////
// Tails Definitions //
///////////////////////

/datum/sprite_accessory/tails
	icon = 'icons/mob/mutant_bodyparts/tails.dmi'
	em_block = TRUE

/datum/sprite_accessory/tails_animated
	icon = 'icons/mob/mutant_bodyparts/tails.dmi'
	em_block = TRUE

/datum/sprite_accessory/tails/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails_animated/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails_animated/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails_animated/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails_animated/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails_animated/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails/cat
	name = "Cat"
	icon_state = "cat"

/datum/sprite_accessory/tails_animated/cat
	name = "Cat"
	icon_state = "cat"

/datum/sprite_accessory/tails/monkey
	name = "Monkey"
	icon_state = "monkey"

/datum/sprite_accessory/tails/fox
	name = "Fox"
	icon_state = "fox"
	icon_state_2 = "fox_2"

/datum/sprite_accessory/tails_animated/fox
	name = "Fox"
	icon_state = "fox"
	icon_state_2 = "fox_2"

/datum/sprite_accessory/tails/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon_state_2 = "fennec_2"

/datum/sprite_accessory/tails_animated/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon_state_2 = "fennec_2"

/datum/sprite_accessory/tails/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/tails_animated/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/tails/murid
	name = "Murid"
	icon_state = "murid"

/datum/sprite_accessory/tails/hawk
	name = "Hawk"
	icon_state = "hawk"
	icon_state_2 = "hawk_2"

/datum/sprite_accessory/tails/australianshepherd
	name = "Australian Shepherd"
	icon_state = "australianshepherd"
	icon_state_2 = "australianshepherd_2"

/datum/sprite_accessory/tails_animated/australianshepherd
	name = "Australian Shepherd"
	icon_state = "australianshepherd"
	icon_state_2 = "australianshepherd_2"

/datum/sprite_accessory/tails/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	icon_state_2 = "rabbit_2"

/datum/sprite_accessory/tails_animated/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	icon_state_2 = "rabbit_2"

/datum/sprite_accessory/tails/deer
	name = "Deer"
	icon_state = "deer"
	icon_state_2 = "deer_2"

/datum/sprite_accessory/tails/cow
	name = "Cow"
	icon_state = "cow"

/datum/sprite_accessory/tails/bat
	name = "Bat"
	icon_state = "bat"
	icon_state_2 = "bat_2"

/datum/sprite_accessory/tails/bee
	name = "Bee"
	icon_state = "bee"
	icon_state_2 = "bee_2"

/datum/sprite_accessory/tails/queenbee
	name = "Queen Bee"
	icon_state = "queenbee"
	icon_state_2 = "queenbee_2"

/datum/sprite_accessory/tails/insectunder
	name = "Insect (Under)"
	icon_state = "insectunder"
	icon_state_2 = "insectunder_2"

/datum/sprite_accessory/tails/husky
	name = "Husky"
	icon_state = "husky"
	icon_state_2 = "husky_2"

/datum/sprite_accessory/tails/leopard
	name = "Leopard"
	icon_state = "leopard"
	icon_state_2 = "leopard_2"

/datum/sprite_accessory/tails_animated/leopard
	name = "Leopard"
	icon_state = "leopard"
	icon_state_2 = "leopard_2"

/datum/sprite_accessory/tails/snake
	name = "Snake"
	icon_state = "snake"

/datum/sprite_accessory/tails/snakestripe
	name = "Snake (Striped)"
	icon_state = "snakestripe"
	icon_state_2 = "snakestripe_2"

/datum/sprite_accessory/tails/snakeunder
	name = "Snake (Under)"
	icon_state = "snakeunder"
	icon_state_2 = "snakeunder_2"

/datum/sprite_accessory/tails/rattlesnake
	name = "Rattlesnake"
	icon_state = "rattlesnake"
	icon_state_2 = "rattlesnake_2"

/datum/sprite_accessory/tails_animated/rattlesnake
	name = "Rattlesnake"
	icon_state = "rattlesnake"
	icon_state_2 = "rattlesnake_2"

/datum/sprite_accessory/tails/peacock
	name = "Peacock"
	icon_state = "peacock"
	icon_state_2 = "peacock_2"
	icon_state_3 = "peacock_3"

/datum/sprite_accessory/tails_animated/peacock
	name = "Peacock"
	icon_state = "peacock"
	icon_state_2 = "peacock_2"
	icon_state_3 = "peacock_3"

/datum/sprite_accessory/tails/blackjackal
	name = "Black Jackal"
	icon_state = "blackjackal"
	icon_state_2 = "blackjackal_2"
	icon_state_3 = "blackjackal_3"

/datum/sprite_accessory/tails/gecko
	name = "Gecko"
	icon_state = "gecko"
	icon_state_2 = "gecko_2"
	icon_state_3 = "gecko_3"

/datum/sprite_accessory/tails/tuft
	name = "Tuft"
	icon_state = "tuft"

////////////////////////
// Spines Definitions //
////////////////////////

/datum/sprite_accessory/spines
	icon = 'icons/mob/mutant_bodyparts/spines.dmi'
	em_block = TRUE

/datum/sprite_accessory/spines_animated
	icon = 'icons/mob/mutant_bodyparts/spines.dmi'
	em_block = TRUE

/datum/sprite_accessory/spines/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines_animated/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines_animated/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines_animated/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines_animated/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines_animated/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines/aqautic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines_animated/aqautic
	name = "Aquatic"
	icon_state = "aqua"

////////////////////////
// Snouts Definitions //
////////////////////////

/datum/sprite_accessory/snouts
	icon = 'icons/mob/mutant_bodyparts/snouts.dmi'
	em_block = TRUE

/datum/sprite_accessory/snouts/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/snouts/sharp
	name = "Sharp"
	icon_state = "sharp"

/datum/sprite_accessory/snouts/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"

/datum/sprite_accessory/snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"

/datum/sprite_accessory/snouts/fox
	name = "Fox"
	icon_state = "fox"
	icon_state_2 = "fox_2"

/datum/sprite_accessory/snouts/cat
	name = "Cat"
	icon_state = "catsnout"
	icon_state_2 = "catsnout_2"

/datum/sprite_accessory/snouts/cervine
	name = "Cervine"
	icon_state = "cervine"
	icon_state_2 = "cervine_2"
	icon_state_3 = "cervine_3"

/datum/sprite_accessory/snouts/husky
	name = "Husky"
	icon_state = "husky"
	icon_state_2 = "husky_2"

/datum/sprite_accessory/snouts/mandibles
	name = "Mandibles"
	icon_state = "mandibles"

/datum/sprite_accessory/snouts/elephant
	name = "Elephant"
	icon_state = "elephant"
	icon_state_2 = "elephant_2"

/datum/sprite_accessory/snouts/rodent
	name = "Rodent"
	icon_state = "rodent"

/datum/sprite_accessory/snouts/lcanid
	name = "Mammal, Long"
	icon_state = "lcanid"
	icon_state_2 = "lcanid_2"

/datum/sprite_accessory/snouts/lcanidstriped
	name = "Mammal, Long, Striped"
	icon_state = "lcanidstripe"
	icon_state_2 = "lcanidstripe_2"

/datum/sprite_accessory/snouts/scanid
	name = "Mammal, Short"
	icon_state = "scanid"
	icon_state_2 = "scanid_2"
	icon_state_3 = "scanid_3"

/datum/sprite_accessory/snouts/scanidalt
	name = "Mammal, Short ALT"
	icon_state = "scanidalt"
	icon_state_2 = "scanidalt_2"
	icon_state_3 = "scanidalt_3"

/datum/sprite_accessory/snouts/scanidalt2
	name = "Mammal, Short ALT 2"
	icon_state = "scanidalt2"
	icon_state_2 = "scanidalt2_2"

/datum/sprite_accessory/snouts/scanidalt3
	name = "Mammal, Short ALT 3"
	icon_state = "scanidalt3"
	icon_state_2 = "scanidalt3_2"
	icon_state_3 = "scanidalt3_3"

/datum/sprite_accessory/snouts/bird
	name = "Bird"
	icon_state = "bird"
	icon_state_2 = "bird_2"
	icon_state_3 = "bird_3"

/datum/sprite_accessory/snouts/toucan
	name = "Toucan"
	icon_state = "toucan"
	icon_state_2 = "toucan_2"

/datum/sprite_accessory/snouts/leporid
	name = "Leporid"
	icon_state = "leporid"
	icon_state_2 = "leporid_2"

/datum/sprite_accessory/snouts/stubby
	name = "Stubby"
	icon_state = "stubby"
	icon_state_2 = "stubby_2"

/datum/sprite_accessory/snouts/tajaran
	name = "Tajaran"
	icon_state = "tajaran"
	icon_state_2 = "tajaran_2"

////////////////////////
// Frills Definitions //
////////////////////////

/datum/sprite_accessory/frills
	icon = 'icons/mob/mutant_bodyparts/frills.dmi'

/datum/sprite_accessory/frills/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/frills/simple
	name = "Simple"
	icon_state = "simple"
	icon_state_2 = "simple_2"

/datum/sprite_accessory/frills/short
	name = "Short"
	icon_state = "short"
	icon_state_2 = "short_2"

/datum/sprite_accessory/frills/aquatic
	name = "Aquatic"
	icon_state = "aqua"
	icon_state_2 = "aqua_2"

/datum/sprite_accessory/frills/droopy
	name = "Droopy"
	icon_state = "droopy"
	icon_state_2 = "droopy_2"

/datum/sprite_accessory/frills/neck
	name = "Neck"
	icon_state = "neck"
	icon_state_2 = "neck_2"

/datum/sprite_accessory/frills/neckbig
	name = "Neck (Alt)"
	icon_state = "neckbig"
	icon_state_2 = "neckbig_2"

/datum/sprite_accessory/frills/frillhawk
	name = "Frillhawk"
	icon_state = "frillhawk"
	icon_state_2 = "frillhawk_2"

/datum/sprite_accessory/frills/split
	name = "Split"
	icon_state = "split"

///////////////////////
// Horns Definitions //
///////////////////////

/datum/sprite_accessory/horns
	icon = 'icons/mob/mutant_bodyparts/horns.dmi'
	em_block = TRUE

/datum/sprite_accessory/horns/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/horns/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/horns/newsimple
	name = "Simple (Alt)"
	icon_state = "newsimple"

/datum/sprite_accessory/horns/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/horns/broken
	name = "Broken"
	icon_state = "newbroken"

/datum/sprite_accessory/horns/curled
	name = "Curled"
	icon_state = "curled"

/datum/sprite_accessory/horns/ram
	name = "Ram"
	icon_state = "ram"

/datum/sprite_accessory/horns/newram
	name = "Ram (Alt)"
	icon_state = "newram"

/datum/sprite_accessory/horns/angler
	name = "Angeler"
	icon_state = "angler"
	icon_state_2 = "angler_2"

/datum/sprite_accessory/horns/lightning
	name = "Lightning"
	icon_state = "lightning"

/datum/sprite_accessory/horns/drake
	name = "Drake"
	icon_state = "drake"

/datum/sprite_accessory/horns/dragon
	name = "Dragon"
	icon_state = "dragon"

/datum/sprite_accessory/horns/brimstone
	name = "Brimstone"
	icon_state = "brimstone"

/datum/sprite_accessory/horns/crippledbull
	name = "Crippled Bull"
	icon_state = "crippledbull"

/datum/sprite_accessory/horns/hollowpoint
	name = "Hollow Point"
	icon_state = "hollowpoint"

/datum/sprite_accessory/horns/ticketrack
	name = "Ticket Rack"
	icon_state = "ticketrack"

/datum/sprite_accessory/horns/hopefulhorns
	name = "Hopeful Horns"
	icon_state = "hopefulhorns"

/datum/sprite_accessory/horns/analyticalantlers
	name = "Analytical Antlers"
	icon_state = "analyticalantlers"

/datum/sprite_accessory/horns/lifted
	name = "Lifted"
	icon_state = "lifted"

/datum/sprite_accessory/horns/antlers
	name = "Antlers"
	icon = 'icons/mob/mutant_bodyparts/horns_big.dmi'
	icon_state = "antlers"

/datum/sprite_accessory/horns/antlersmore
	name = "Antlers (More)"
	icon = 'icons/mob/mutant_bodyparts/horns_big.dmi'
	icon_state = "antlersmore"

/datum/sprite_accessory/horns/antlersshort
	name = "Antlers (Short)"
	icon = 'icons/mob/mutant_bodyparts/horns_big.dmi'
	icon_state = "antlersshort"

/datum/sprite_accessory/horns/antlersregal
	name = "Antlers (Regal)"
	icon = 'icons/mob/mutant_bodyparts/horns_big.dmi'
	icon_state = "antlersregal"

//////////////////////
// Ears Definitions //
//////////////////////

/datum/sprite_accessory/ears
	icon = 'icons/mob/mutant_bodyparts/ears.dmi'
	em_block = TRUE

/datum/sprite_accessory/ears/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/ears/cat
	name = "Cat"
	icon_state = "cat"

/datum/sprite_accessory/ears/fox
	name = "Fox"
	icon_state = "fox"
	icon_state_2 = "fox_2"

/datum/sprite_accessory/ears/wolf
	name = "Wolf"
	icon_state = "wolf"
	icon_state_2 = "wolf_2"

/datum/sprite_accessory/ears/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"
	icon_state_2 = "bigwolf_2"

/datum/sprite_accessory/ears/mouse
	name = "Mouse"
	icon_state = "mouse"
	icon_state_2 = "mouse_2"

/datum/sprite_accessory/ears/sergal
	name = "Sergal"
	icon_state = "sergal"
	icon_state_2 = "sergal_2"

/datum/sprite_accessory/ears/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon_state_2 = "fennec_2"

/datum/sprite_accessory/ears/elf
	name = "Elf"
	icon_state = "elf"

/datum/sprite_accessory/ears/cobrahood
	name = "Cobra (Hood)"
	icon_state = "cobrahood"
	icon_state_2 = "cobrahood_2"

/datum/sprite_accessory/ears/elephant
	name = "Elephant"
	icon_state = "elephant"

/datum/sprite_accessory/ears/deer
	name = "Deer"
	icon_state = "deer"
	icon_state_2 = "deer_2"

/datum/sprite_accessory/ears/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	icon_state_2 = "rabbit_2"
	icon_state_3 = "rabbit_3"

/datum/sprite_accessory/ears/floppy
	name = "Floppy"
	icon_state = "floppy"
	icon_state_2 = "floppy_2"
	icon_state_3 = "floppy_3"

//////////////////////////
// Antennae Definitions //
//////////////////////////

/datum/sprite_accessory/antennae
	icon = 'icons/mob/mutant_bodyparts/antennae.dmi'

/datum/sprite_accessory/antennae/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/antennae/plain
	name = "Plain"
	icon_state = "plain"

/datum/sprite_accessory/antennae/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/antennae/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/antennae/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/antennae/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/antennae/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/antennae/burnt_off
	name = "Burnt Off"
	icon_state = "burnt_off"

/datum/sprite_accessory/antennae/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/antennae/deathshead
	name = "Deathshead"
	icon_state = "deathshead"

/datum/sprite_accessory/antennae/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/antennae/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/antennae/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/antennae/oakworm
	name = "Oak Worm"
	icon_state = "oakworm"

/datum/sprite_accessory/antennae/jungle
	name = "Jungle"
	icon_state = "jungle"

/datum/sprite_accessory/antennae/witchwing
	name = "Witch Wing"
	icon_state = "witchwing"

/datum/sprite_accessory/antennae/regal
	name = "Regal"
	icon_state = "regal"

///////////////////////
// Wings Definitions //
///////////////////////

/datum/sprite_accessory/wings
	icon = 'icons/mob/mutant_bodyparts/wings.dmi'
	em_block = TRUE

/datum/sprite_accessory/wings/none
	name = "None"
	icon_state = "none"

/* To do: Fix big wings' broken sprites

/datum/sprite_accessory/wings/angel
	name = "Angel"
	icon_state = "angel"
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/wings/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/wings/megamoth
	name = "Megamoth"
	icon_state = "megamoth"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/wings/mothra
	name = "Mothra"
	icon_state = "mothra"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/wings/fly
	name = "Fly"
	icon_state = "fly"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

*/

/datum/sprite_accessory/wings/dragon
	name = "Dragon"
	icon_state = "dragon"
	icon_state_2 = "dragon_2"

/datum/sprite_accessory/wings/harpy
	name = "Harpy (Top)"
	icon_state = "harpy_top"

/datum/sprite_accessory/wings/spider
	name = "Spider"
	icon_state = "spider"

/datum/sprite_accessory/wings/insect
	name = "Insect"
	icon_state = "insect"

/datum/sprite_accessory/wings/mantis
	name = "Mantis"
	icon_state = "mantis"
	icon_state_2 = "mantis_2"

/datum/sprite_accessory/wings/plain
	name = "Plain"
	icon_state = "plain"

/datum/sprite_accessory/wings/monarch
	name = "Monarch"
	icon_state = "monarch"

/datum/sprite_accessory/wings/luna
	name = "Luna"
	icon_state = "luna"

/datum/sprite_accessory/wings/atlas
	name = "Atlas"
	icon_state = "atlas"

/datum/sprite_accessory/wings/reddish
	name = "Reddish"
	icon_state = "redish"

/datum/sprite_accessory/wings/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/wings/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/wings/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/wings/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/wings/burnt_off
	name = "Burnt Off"
	icon_state = "burnt_off"

/datum/sprite_accessory/wings/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/wings/deathshead
	name = "Deathshead"
	icon_state = "deathshead"

/datum/sprite_accessory/wings/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/wings/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/wings/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/wings/snow
	name = "Snow"
	icon_state = "snow"

/datum/sprite_accessory/wings/oakworm
	name = "Oak Worm"
	icon_state = "oakworm"

/datum/sprite_accessory/wings/jungle
	name = "Jungle"
	icon_state = "jungle"

/datum/sprite_accessory/wings/witchwing
	name = "Witch Wing"
	icon_state = "witchwing"

/datum/sprite_accessory/wings/rosy
	name = "Rosy"
	icon_state = "rosy"

/datum/sprite_accessory/wings/feathery
	name = "Feathery"
	icon_state = "feathery"

/datum/sprite_accessory/wings/brown
	name = "Brown"
	icon_state = "brown"

/datum/sprite_accessory/wings/plasmafire
	name = "Plasmafire"
	icon_state = "plasmafire"

//////////////////////
// Legs Definitions //
//////////////////////

/datum/sprite_accessory/legs //legs are a special case, they aren't actually sprite_accessories but are updated with them.
	icon = null //These datums exist for selecting legs on preference, and little else
	em_block = TRUE

/datum/sprite_accessory/legs/none
	name = "Normal Legs"

/datum/sprite_accessory/legs/digitigrade_lizard
	name = "Digitigrade Legs"

/////////////////////
// Cap Definitions //
/////////////////////

/datum/sprite_accessory/mushcap
	icon = 'icons/mob/mutant_bodyparts/cap.dmi'
	em_block = TRUE

/datum/sprite_accessory/mushcap/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/mushcap/round
	name = "Round"
	icon_state = "round"
