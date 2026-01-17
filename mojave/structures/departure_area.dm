/obj/structure/ms13/departure
	name = "area departure"
	desc = "You can almost make out something in the distance. But what?"
	icon = 'mojave/icons/structure/departure.dmi'
	icon_state = "location_exit"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE | FIRE_PROOF | ACID_PROOF

/obj/structure/ms13/departure/MouseDrop_T(mob/living/dropped, mob/living/user)
	. = ..()
	if(user.incapacitated())
		return

	var/departing_self = user == dropped
	var/datum/job/assigned_role = dropped.mind?.assigned_role

	var/alert_text = "Are you sure you want to depart? This will despawn your character and open a slot for [assigned_role?.title]. [assigned_role?.req_admin_notify ? "You are playing an important role, and you should let people and admins know of your departure beforehand!" : ""]"
	var/alert_title = "Departing the Wasteland"

	if(!departing_self)
		if(dropped.client && !dropped.client.is_afk())
			to_chat(user, span_warning("[dropped] must be considered AFK for you to depart them."))
			return
		alert_text = "Are you sure you want to make [dropped.name] depart? This will despawn their character and open a slot for [assigned_role?.title]. [assigned_role?.req_admin_notify ? "They are playing an important role, and you should let people and admins know of their departure beforehand!" : ""]"
		alert_title = "Departing [dropped.name]"

	if(tgui_alert(user, alert_text, alert_title, list("Confirm", "Cancel")) != "Confirm")
		return

	if(QDELETED(dropped) || !isliving(dropped) || get_dist(src, dropped) > 2)
		return //Things have changed since the alert happened.

	if(!departing_self && (QDELETED(user) || user.incapacitated() || !isliving(user) || get_dist(src, user) > 2))
		return //Things have changed since the alert happened.
	
	if(assigned_role)
		assigned_role.current_positions--

	var/dat = "[key_name(dropped)] has departed, job [dropped.job], at [AREACOORD(src)]. Contents despawned along:"
	var/list/stuff = list()
	for(var/thing in dropped.get_all_contents())
		if(isobj(thing))
			stuff += "[thing]"
	dat = "[dat] [stuff.Join(", ")]."
	message_admins(dat)
	log_admin(dat)
	dropped.visible_message("<span class='notice'>[dropped] walks off into the distance, departing this area.</span>")
	qdel(dropped)
