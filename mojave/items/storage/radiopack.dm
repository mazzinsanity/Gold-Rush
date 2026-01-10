/obj/item/storage/ms13/radiopack
	name = "radiopack"
	desc = "A radio backpack primarily in use by the NCR. The peak of NCR communication, when they feel like using it."
	icon = 'mojave/icons/objects/clothing/clothing_inventory/backpack_inventory.dmi'
	icon_state = "radiopack"
	inhand_icon_state = "radiopack"
	worn_icon = 'mojave/icons/mob/clothing/back.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/equipment/backpack_righthand.dmi'

	component_type = /datum/component/storage/concrete/ms13/rad_pack
	storage_flags = 0
	var/obj/item/radio/ms13/ncr/radio_type = /obj/item/radio/ms13/ncr
	var/last_frequency = 0

/obj/item/storage/ms13/radiopack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 16
	STR.max_combined_w_class = 100

/obj/item/storage/ms13/radiopack/alt_click_secondary(mob/user)
	. = ..()
	var/back_item = user.get_item_by_slot(ITEM_SLOT_BACK)
	if(!back_item || back_item != src)
		to_chat(user, "<span class='warning'>You must wear \the [src] on your back to access the radio!</span>")
		return
	
	for(var/item as anything in user.held_items)
		if(istype(item, radio_type))
			to_chat(user, "<span class='warning'>You are already holding \the [item]!</span>")
			return
	
	var/obj/item/radio/ms13/ncr/radio = new radio_type(src)
	radio.radiopack = src
	radio.set_frequency(last_frequency)
	user.put_in_hands(radio)
	update_icon()
	user.update_inv_back()

/obj/item/storage/ms13/radiopack/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, radio_type))
		user.dropItemToGround(W)

/obj/item/storage/ms13/radiopack/dropped(mob/user)
	. = ..()
	for(var/obj/item/item as anything in user.held_items)
		if(istype(item, radio_type))
			user.dropItemToGround(item)

/obj/item/radio/ms13/ncr
	name = "walkie-talkie"
	icon = 'mojave/icons/objects/tools/tools_inventory.dmi'
	icon_state = "handradio"
	inhand_icon_state = "handradio"
	desc = "The important bit of the radiopack, this broadcasts and recieves radio messages in high quality with an amplified volume."
	canhear_range = 3
	radio_broadcast = RADIOSTATIC_LIGHT
	static = TRUE
	grid_height = 32
	grid_width = 32
	item_flags = DROPDEL
	var/obj/item/storage/ms13/radiopack_type = /obj/item/storage/ms13/radiopack
	var/obj/item/storage/ms13/radiopack/radiopack = null

/obj/item/radio/ms13/ncr/Initialize()
	. = ..()
	become_hearing_sensitive()

/obj/item/radio/ms13/ncr/Destroy()
	if(radiopack)
		radiopack.last_frequency = frequency
	
	return ..()

