/obj/item/weapon/melee/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7
	w_class = 3
	origin_tech = "combat=4"
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	hitsound = 'sound/effects/woodhit.ogg'

/obj/item/weapon/melee/chainofcommand/suicide_act(mob/user)
		user.visible_message("<span class='suicide'>[user] is strangling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
		return (OXYLOSS)

/obj/item/weapon/melee/chainofcommand/longchain
	name = "long chain"
	desc = "A long metal chain. A brutal way of dispatching enemies."
	icon_state = "longchain"
	item_state = "chain"
	hitsound = 'sound/effects/woodhit.ogg'
	force = 12
	attack_verb = list("flogged", "whipped", "lashed", "brutalised")

/obj/item/weapon/melee/classic_baton
	name = "police baton"
	desc = "A wooden truncheon for beating criminal scum."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "baton"
	item_state = "classic_baton"
	slot_flags = SLOT_BELT
	force = 10

/obj/item/weapon/melee/classic_baton/attack(mob/M, mob/living/user)
	add_fingerprint(user)
	if(user.has_organic_effect(/datum/organic_effect/clumsy) && prob(50))
		user << "<span class='warning'>You club yourself over the head!</span>"
		user.Weaken(3 * force)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(2 * force, BRUTE, "head")
			H.forcesay(hit_appends)
		else
			user.take_organ_damage(2 * force)
		return
	add_logs(user, M, "attacked", object="[src.name]")

	if(isrobot(M)) // Don't stun borgs, fix for issue #2436
		..()
		return
	if(!isliving(M)) // Don't stun nonhuman things
		return

	if(user.a_intent == "harm")
		if(!..()) return
		if(M.stuttering < 7 && !M.has_organic_effect(/datum/organic_effect/hulk))
			M.stuttering = 7
		M.Stun(7)
		M.Weaken(7)
		M.visible_message("<span class='danger'>[M] has been beaten with [src] by [user]!</span>", \
							"<span class='userdanger'>[M] has been beaten with [src] by [user]!</span>")
	else
		playsound(loc, 'sound/effects/woodhit.ogg', 75, 1, -1)
		M.Stun(7)
		M.Weaken(7)
		M.visible_message("<span class='danger'>[M] has been stunned with [src] by [user]!</span>", \
							"<span class='userdanger'>[M] has been stunned with [src] by [user]!</span>")

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.forcesay(hit_appends)


/obj/item/weapon/melee/telebaton
	name = "telescopic baton"
	desc = "A compact yet robust personal defense weapon. Can be concealed when folded."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "telebaton_0"
	item_state = "telebaton_0"
	slot_flags = SLOT_BELT
	w_class = 2
	force = 3
	var/on = 0

/obj/item/weapon/melee/telebaton/attack_self(mob/user as mob)
	on = !on
	if(on)
		user.visible_message("<span class ='warning'>With a flick of their wrist, [user] extends their telescopic baton.</span>",\
		"<span class ='warning'>You extend the baton.</span>",\
		"You hear an ominous click.")
		icon_state = "telebaton_1"
		item_state = "nullrod"
		w_class = 4 //doesnt fit in backpack when its on for balance
		force = 10 //seclite damage
		attack_verb = list("smacked", "struck", "cracked", "beaten")
	else
		user.visible_message("<span class ='notice'>[user] collapses their telescopic baton.</span>",\
		"<span class ='notice'>You collapse the baton.</span>",\
		"You hear a click.")
		icon_state = "telebaton_0"
		item_state = "telebaton_0" //no sprite in other words
		slot_flags = SLOT_BELT
		w_class = 2
		force = 3 //not so robust now
		attack_verb = list("hit", "poked")

	playsound(src.loc, 'sound/weapons/flipblade.ogg', 50, 1)
	add_fingerprint(user)

/obj/item/weapon/melee/telebaton/attack(mob/target as mob, mob/living/user as mob)
	if(on)
		if (user.has_organic_effect(/datum/organic_effect/clumsy) && prob(50))
			user << "<span class ='danger'>You club yourself over the head.</span>"
			user.Weaken(3 * force)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				H.apply_damage(2*force, BRUTE, "head")
			else
				user.take_organ_damage(2*force)
			return
		if (user.a_intent == "harm")
			if(!..()) return
			if(!isrobot(target))
				playsound(get_turf(src), "swing_hit", 50, 1, -1)
		else
			playsound(get_turf(src), 'sound/effects/woodhit.ogg', 75, 1, -1)
			target.Weaken(3)
			src.add_fingerprint(user)
			target.visible_message("<span class ='danger'>[target] has been knocked down with \the [src] by [user]!</span>")
			if(!iscarbon(user))
				target.LAssailant = null
			else
				target.LAssailant = user
		return
	else
		return ..()
