//Xeno Overlays Indexes//////////
#define X_HANDS_LAYER			1
#define X_FIRE_LAYER			2
#define X_TOTAL_LAYERS			2
/////////////////////////////////

/mob/living/carbon/alien/humanoid
	var/list/overlays_standing[X_TOTAL_LAYERS]

/mob/living/carbon/alien/humanoid/update_icons()
	update_hud()		//TODO: remove the need for this to be here
	overlays.Cut()
	for(var/image/I in overlays_standing)
		overlays += I

	if(stat == DEAD)
		//If we mostly took damage from fire
		if(fireloss > 125)
			icon_state = "alien[caste]_husked"
		else
			icon_state = "alien[caste]_dead"
	else if(stat == UNCONSCIOUS || lying || resting)
		icon_state = "alien[caste]_sleep"
	else if(m_intent == "run")
		icon_state = "alien[caste]_running"
	else
		icon_state = "alien[caste]_s"

/mob/living/carbon/alien/humanoid/regenerate_icons()
	..()
	if (notransform)	return

	update_inv_hands(0)
	update_inv_pockets(0)
	update_hud()
//	update_icons() //Handled in update_transform(), leaving this here as a reminder
	update_fire()
	update_transform()

/mob/living/carbon/alien/humanoid/update_transform() //The old method of updating lying/standing was update_icons(). Aliens still expect that.
	if(lying > 0)
		lying = 90 //Anything else looks retarded
	update_icons()
	..()


/mob/living/carbon/alien/humanoid/update_hud()
	if(client)
		client.screen |= contents


/mob/living/carbon/alien/humanoid/update_inv_pockets(update_icons = 1)
	if(l_store)
		l_store.screen_loc = ui_alien_storage_l
	if(r_store)
		r_store.screen_loc = ui_alien_storage_r

	if(update_icons)
		update_icons()

/mob/living/carbon/alien/humanoid/update_inv_hands(update_icons = 1)
	var/list/X_hands_overlays = list()

	if(l_hand)
		var/t_state = l_hand.item_state
		if(!t_state)
			t_state = l_hand.icon_state
		l_hand.screen_loc = ui_lhand
		X_hands_overlays	+= l_hand.get_onmob_icon("l_hand")

	if(r_hand)
		var/t_state = r_hand.item_state
		if(!t_state)
			t_state = r_hand.icon_state
		r_hand.screen_loc = ui_rhand
		X_hands_overlays	+= r_hand.get_onmob_icon("r_hand")

	if(X_hands_overlays.len)
		overlays_standing[X_HANDS_LAYER] = X_hands_overlays
		var/image/I = overlays_standing[X_HANDS_LAYER]
		if(I)
			overlays += I

	if(update_icons)
		update_icons()

/mob/living/carbon/alien/humanoid/update_fire()
	overlays -= overlays_standing[X_FIRE_LAYER]
	if(on_fire)
		overlays_standing[X_FIRE_LAYER] = image("icon"='icons/mob/OnFire.dmi', "icon_state"="Standing", "layer"= -X_FIRE_LAYER)
		overlays += overlays_standing[X_FIRE_LAYER]
		return
	else
		overlays_standing[X_FIRE_LAYER] = null

//Xeno Overlays Indexes//////////
#undef X_HANDS_LAYER
#undef X_FIRE_LAYER
#undef X_TOTAL_LAYERS
