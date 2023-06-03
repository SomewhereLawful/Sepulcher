/*
	Screen objects
	Todo: improve/re-implement

	Screen objects are only used for the hud and should not appear anywhere "in-game".
	They are used with the client/screen list and the screen_loc var.
	For more information, see the byond documentation on the screen_loc and screen vars.
*/
/obj/screen
	name = ""
	icon = 'icons/mob/screen/screen_gen.dmi'
	layer = ABOVE_HUD_LAYER
	plane = ABOVE_HUD_PLANE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	appearance_flags = APPEARANCE_UI
	var/obj/master = null	//A reference to the object in the slot. Grabs or items, generally.
	var/datum/hud/hud = null // A reference to the owner HUD, if any.

/obj/screen/take_damage()
	return

/obj/screen/Destroy()
	master = null
	hud = null
	return ..()

/obj/screen/examine(mob/user)
	return

/obj/screen/orbit()
	return

/obj/screen/proc/component_click(obj/screen/component_button/component, params)
	return

/obj/screen/text
	icon = null
	icon_state = null
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	screen_loc = "CENTER-7,CENTER-7"
	maptext_height = 480
	maptext_width = 480

/obj/screen/swap_hand
	layer = HUD_LAYER
	plane = HUD_PLANE
	name = "swap hand"

/obj/screen/swap_hand/Click()
	// At this point in client Click() code we have passed the 1/10 sec check and little else
	// We don't even know if it's a middle click
	if(world.time <= usr.next_move)
		return 1

	if(usr.incapacitated())
		return 1

	if(ismob(usr))
		var/mob/M = usr
		M.swap_hand()
	return 1

/obj/screen/inventory
	var/slot_id	// The indentifier for the slot. It has nothing to do with ID cards.
	var/icon_empty // Icon when empty. For now used only by humans.
	var/icon_full  // Icon when contains an item. For now used only by humans.
	layer = HUD_LAYER
	plane = HUD_PLANE

/obj/screen/inventory/Click(location, control, params)
	// At this point in client Click() code we have passed the 1/10 sec check and little else
	// We don't even know if it's a middle click
	if(world.time <= usr.next_move)
		return 1

	if(usr.incapacitated())
		return 1
	if(ismecha(usr.loc)) // stops inventory actions in a mech
		return 1

	if(hud && hud.mymob && slot_id)
		var/obj/item/inv_item = hud.mymob.get_item_by_slot(slot_id)
		if(inv_item)
			return inv_item.Click(location, control, params)

	if(usr.attack_ui(slot_id))
		usr.update_inv_hands()
	return 1

/obj/screen/inventory/update_icon()
	if(!icon_empty)
		icon_empty = icon_state

	if(hud && hud.mymob && slot_id && icon_full)
		if(hud.mymob.get_item_by_slot(slot_id))
			icon_state = icon_full
		else
			icon_state = icon_empty

/obj/screen/inventory/hand
	var/mutable_appearance/handcuff_overlay
	var/static/mutable_appearance/blocked_overlay = mutable_appearance('icons/mob/screen/screen_gen.dmi', "blocked")
	var/held_index = 0

/obj/screen/inventory/hand/update_icon()
	..()

	if(!handcuff_overlay)
		var/state = (!(held_index % 2)) ? "markus" : "gabrielle"
		handcuff_overlay = mutable_appearance('icons/mob/screen/screen_gen.dmi', state)

	cut_overlays()

	if(hud && hud.mymob)
		if(iscarbon(hud.mymob))
			var/mob/living/carbon/C = hud.mymob
			if(C.handcuffed)
				add_overlay(handcuff_overlay)

			if(held_index)
				if(!C.has_hand_for_held_index(held_index))
					add_overlay(blocked_overlay)

		if(held_index == hud.mymob.active_hand_index)
			add_overlay("hand_active")


/obj/screen/inventory/hand/Click(location, control, params)
	// At this point in client Click() code we have passed the 1/10 sec check and little else
	// We don't even know if it's a middle click
	if(world.time <= usr.next_move)
		return 1
	if(usr.incapacitated() || isobserver(usr))
		return 1
	if (ismecha(usr.loc)) // stops inventory actions in a mech
		return 1

	if(hud.mymob.active_hand_index == held_index)
		var/obj/item/I = hud.mymob.get_active_held_item()
		if(I)
			I.Click(location, control, params)
	else
		hud.mymob.swap_hand(held_index)
	return 1

/obj/screen/close
	name = "close"
	layer = ABOVE_HUD_LAYER
	plane = ABOVE_HUD_PLANE
	icon_state = "backpack_close"

/obj/screen/close/Initialize(mapload, new_master)
	. = ..()
	master = new_master

/obj/screen/close/Click()
	var/datum/component/storage/S = master
	S.hide_from(usr)
	return TRUE

/obj/screen/drop
	name = "drop"
	icon = 'icons/mob/screen/screen_midnight.dmi'
	icon_state = "act_drop"
	layer = HUD_LAYER
	plane = HUD_PLANE

/obj/screen/drop/Click()
	if(usr.stat == CONSCIOUS)
		usr.dropItemToGround(usr.get_active_held_item())

/obj/screen/act_intent
	name = "intent"
	icon_state = "help"
	screen_loc = ui_acti

/obj/screen/act_intent/Click(location, control, params)
	usr.a_intent_change(INTENT_HOTKEY_RIGHT)

/obj/screen/act_intent/segmented/Click(location, control, params)
	if(usr.client.prefs.toggles & INTENT_STYLE)
		var/_x = text2num(params2list(params)["icon-x"])
		var/_y = text2num(params2list(params)["icon-y"])

		if(_x<=16 && _y<=16)
			usr.a_intent_change(INTENT_HARM)

		else if(_x<=16 && _y>=17)
			usr.a_intent_change(INTENT_HELP)

		else if(_x>=17 && _y<=16)
			usr.a_intent_change(INTENT_GRAB)

		else if(_x>=17 && _y>=17)
			usr.a_intent_change(INTENT_DISARM)
	else
		return ..()

/obj/screen/act_intent/alien
	icon = 'icons/mob/screen/screen_alien.dmi'
	screen_loc = ui_movi

/obj/screen/act_intent/robot
	icon = 'icons/mob/screen/screen_cyborg.dmi'
	screen_loc = ui_borg_intents

/obj/screen/mov_intent
	name = "run/walk toggle"
	icon = 'icons/mob/screen/screen_midnight.dmi'
	icon_state = "running"

/obj/screen/mov_intent/Click()
	toggle(usr)

/obj/screen/mov_intent/proc/toggle(mob/user)
	if(isobserver(user))
		return
	switch(user.m_intent)
		if("run")
			user.m_intent = MOVE_INTENT_WALK
			icon_state = "walking"
		if("walk")
			user.m_intent = MOVE_INTENT_RUN
			icon_state = "running"
	user.update_icons()

/obj/screen/pull
	name = "stop pulling"
	icon = 'icons/mob/screen/screen_midnight.dmi'
	icon_state = "pull"

/obj/screen/pull/Click()
	if(isobserver(usr))
		return
	usr.stop_pulling()

/obj/screen/pull/update_icon(mob/mymob)
	if(!mymob)
		return
	if(mymob.pulling)
		icon_state = "pull"
	else
		icon_state = "pull0"

/obj/screen/resist
	name = "resist"
	icon = 'icons/mob/screen/screen_midnight.dmi'
	icon_state = "act_resist"
	layer = HUD_LAYER
	plane = HUD_PLANE

/obj/screen/resist/Click()
	if(isliving(usr))
		var/mob/living/L = usr
		L.resist()

/obj/screen/storage
	name = "storage"
	icon_state = "block"
	screen_loc = "7,7 to 10,8"
	layer = HUD_LAYER
	plane = HUD_PLANE

/obj/screen/storage/Initialize(mapload, new_master)
	. = ..()
	master = new_master

/obj/screen/storage/Click(location, control, params)
	if(world.time <= usr.next_move)
		return TRUE
	if(usr.incapacitated())
		return TRUE
	if (ismecha(usr.loc)) // stops inventory actions in a mech
		return TRUE
	if(master)
		var/obj/item/I = usr.get_active_held_item()
		if(I)
			master.attackby(I, usr, params)
	return TRUE

/obj/screen/throw_catch
	name = "throw/catch"
	icon = 'icons/mob/screen/screen_midnight.dmi'
	icon_state = "act_throw_off"

/obj/screen/throw_catch/Click()
	if(iscarbon(usr))
		var/mob/living/carbon/C = usr
		C.toggle_throw_mode()

/obj/screen/zone_sel
	name = "damage zone"
	icon_state = "zone_sel1"
	screen_loc = ui_zonesel
	plane = 22 //since it's overlapping the healthdoll. Can't ever see how this might be a problem ever!
	var/selecting = BODY_ZONE_CHEST

/obj/screen/zone_sel/Click(location, control,params)
	if(isobserver(usr))
		return

	var/list/PL = params2list(params)
	var/icon_x = text2num(PL["icon-x"])
	var/icon_y = text2num(PL["icon-y"])
	var/choice

	switch(icon_y)
		if(1 to 9) //Legs
			switch(icon_x)
				if(10 to 15)
					choice = BODY_ZONE_R_LEG
				if(17 to 22)
					choice = BODY_ZONE_L_LEG
				else
					return 1
		if(10 to 13) //Hands and groin
			switch(icon_x)
				if(8 to 11)
					choice = BODY_ZONE_R_ARM
				if(12 to 20)
					choice = BODY_ZONE_PRECISE_GROIN
				if(21 to 24)
					choice = BODY_ZONE_L_ARM
				else
					return 1
		if(14 to 22) //Chest and arms to shoulders
			switch(icon_x)
				if(8 to 11)
					choice = BODY_ZONE_R_ARM
				if(12 to 20)
					choice = BODY_ZONE_CHEST
				if(21 to 24)
					choice = BODY_ZONE_L_ARM
				else
					return 1
		if(23 to 30) //Head, but we need to check for eye or mouth
			if(icon_x in 12 to 20)
				choice = BODY_ZONE_HEAD
				switch(icon_y)
					if(23 to 24)
						if(icon_x in 15 to 17)
							choice = BODY_ZONE_PRECISE_MOUTH
					if(26) //Eyeline, eyes are on 15 and 17
						if(icon_x in 14 to 18)
							choice = BODY_ZONE_PRECISE_EYES
					if(25 to 27)
						if(icon_x in 15 to 17)
							choice = BODY_ZONE_PRECISE_EYES

	return set_selected_zone(choice, usr)

/obj/screen/zone_sel/proc/set_selected_zone(choice, mob/user)
	if(isobserver(user))
		return

	if(choice != selecting)
		selecting = choice
		update_icon(usr)
	return 1

/obj/screen/zone_sel/update_icon(mob/user)
	cut_overlays()
	add_overlay(mutable_appearance('icons/mob/screen/screen_gen.dmi', "[selecting]"))
	user.zone_selected = selecting

/obj/screen/zone_sel/alien
	icon = 'icons/mob/screen/screen_alien.dmi'

/obj/screen/zone_sel/alien/update_icon(mob/user)
	cut_overlays()
	add_overlay(mutable_appearance('icons/mob/screen/screen_alien.dmi', "[selecting]"))
	user.zone_selected = selecting

/obj/screen/zone_sel/robot
	icon = 'icons/mob/screen/screen_cyborg.dmi'


/obj/screen/flash
	name = "flash"
	icon_state = "blank"
	blend_mode = BLEND_ADD
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	layer = FLASH_LAYER
	plane = FULLSCREEN_PLANE

/obj/screen/damageoverlay
	icon = 'icons/mob/screen/screen_full.dmi'
	icon_state = "oxydamageoverlay0"
	name = "dmg"
	blend_mode = BLEND_MULTIPLY
	screen_loc = "CENTER-7,CENTER-7"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = UI_DAMAGE_LAYER
	plane = FULLSCREEN_PLANE

/obj/screen/stats_panel // The health vials
	icon = 'icons/mob/screen/stats_bg.dmi'
	icon_state = "stats_mono"

/obj/screen/bar_stat
	icon = 'icons/mob/screen/stats_bars.dmi'

/obj/screen/bar_stat/health
	name = "vigor"
	icon_state = "health0"
	screen_loc = ui_drop_throw

/obj/screen/bar_stat/will
	name = "will"
	icon_state = "will0"
	screen_loc = ui_drop_throw

/obj/screen/bar_stat/hunger
	name = "hunger"
	icon_state = "hunger0"
	screen_loc = ui_drop_throw

/obj/screen/bar_stat/toxicity
	name = "toxicity"
	icon_state = "toxicity100"
	screen_loc = ui_drop_throw

/obj/screen/bar_stat/health/alien
	icon = 'icons/mob/screen/screen_alien.dmi'
	screen_loc = ui_alien_health

/obj/screen/bar_stat/health/robot
	icon = 'icons/mob/screen/screen_cyborg.dmi'
	screen_loc = ui_borg_health

/obj/screen/bar_stat/health/blob
	name = "blob health"
	icon_state = "block"
	screen_loc = ui_internal
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/screen/bar_stat/health/blob/naut
	name = "health"
	icon = 'icons/mob/blob.dmi'
	icon_state = "nauthealth"

/obj/screen/bar_stat/health/blob/naut/core
	name = "overmind health"
	screen_loc = ui_health
	icon_state = "corehealth"

/obj/screen/bar_stat/health/guardian
	name = "summoner health"
	icon = 'icons/mob/guardian.dmi'
	icon_state = "base"
	screen_loc = ui_health
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/screen/bar_stat/health/clock
	icon = 'icons/mob/actions/actions.dmi'
	icon_state = "bg_clock"
	screen_loc = ui_health
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/screen/bar_stat/health/clock/gear
	icon = 'icons/mob/clockwork_mobs.dmi'
	icon_state = "bg_gear"
	screen_loc = ui_internal

/obj/screen/bar_stat/health/revenant
	name = "essence"
	icon = 'icons/mob/actions/actions.dmi'
	icon_state = "bg_revenant"
	screen_loc = ui_health
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/screen/bar_stat/health/construct
	icon = 'icons/mob/screen/screen_construct.dmi'
	icon_state = "artificer_health0"
	screen_loc = ui_construct_health
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/screen/healthdoll
	name = "health doll"
	screen_loc = ui_healthdoll

/obj/screen/mood
	name = "mood"
	icon_state = "mood5"
	screen_loc = ui_mood

/obj/screen/mood/Click()
	GET_COMPONENT_FROM(mood, /datum/component/mood, usr)
	if(mood)
		mood.print_mood()

/obj/screen/splash
	icon = 'icons/blank_title.png'
	icon_state = ""
	screen_loc = "1,1"
	layer = SPLASHSCREEN_LAYER
	plane = SPLASHSCREEN_PLANE
	var/client/holder

/obj/screen/splash/New(client/C, visible, use_previous_title) //TODO: Make this use INITIALIZE_IMMEDIATE, except its not easy
	. = ..()

	holder = C

	if(!visible)
		alpha = 0

	if(!use_previous_title)
		if(SStitle.icon)
			icon = SStitle.icon
	else
		if(!SStitle.previous_icon)
			qdel(src)
			return
		icon = SStitle.previous_icon

	holder.screen += src

/obj/screen/splash/proc/Fade(out, qdel_after = TRUE)
	if(QDELETED(src))
		return
	if(out)
		animate(src, alpha = 0, time = 30)
	else
		alpha = 0
		animate(src, alpha = 255, time = 30)
	if(qdel_after)
		QDEL_IN(src, 30)

/obj/screen/splash/Destroy()
	if(holder)
		holder.screen -= src
		holder = null
	return ..()


/obj/screen/component_button
	var/obj/screen/parent

/obj/screen/component_button/Initialize(mapload, obj/screen/parent)
	. = ..()
	src.parent = parent

/obj/screen/component_button/Click(params)
	if(parent)
		parent.component_click(src, params)
