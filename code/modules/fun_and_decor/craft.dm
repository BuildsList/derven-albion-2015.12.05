/obj/structure/wood_wood
	icon = 'icons/obj/craft.dmi'
	icon_state = "fire0"
	name = "bonfire"

	attackby(var/obj/item/weapon/B as obj, var/mob/user as mob)
		if(istype(B, /obj/item/weapon/lighter))
			var/obj/item/weapon/lighter/L = B
			if(L.lit == 1)
				new /obj/machinery/fire(src.loc)
				del(src)
			else
				return
		if(istype(B, /obj/item/weapon/weldingtool))
			var/obj/item/weapon/weldingtool/W = B
			if(W.welding == 1)
				new /obj/machinery/fire(src.loc)
				del(src)
			else
				return
		if(istype(B, /obj/item/weapon/match))
			var/obj/item/weapon/match/M = B
			if(M.lit == 1)
				new /obj/machinery/fire(src.loc)
				del(src)
			else
				return

/obj/machinery/fire
	icon = 'icons/obj/craft.dmi'
	icon_state = "fire1"
	name = "bonfire"
	anchored = 1
	var/heating_power = 500
	var/set_temperature = 50

/obj/machinery/fire/process()
	var/turf/simulated/L = loc
	if(istype(L))
		var/datum/gas_mixture/env = L.return_air()
		if(env.temperature < (set_temperature+T0C))
			var/transfer_moles = 0.25 * env.total_moles()
			var/datum/gas_mixture/removed = env.remove(transfer_moles)
			if(removed)
				var/heat_capacity = removed.heat_capacity()
					//world << "heating ([heat_capacity])"
				if(heat_capacity == 0 || heat_capacity == null) // Added check to avoid divide by zero (oshi-) runtime errors
					heat_capacity = 1
				removed.temperature = min((removed.temperature*heat_capacity + heating_power)/heat_capacity, 1000) // Added min() check to try and avoid wacky superheating issues in low gas scenarios
				env.merge(removed)
				air_update_turf()

/obj/machinery/fire/New()
	SetLuminosity(4)
	process()

/obj/structure/closet/crate/wooden
	icon = 'icons/obj/craft.dmi'
	icon_state = "crate"

/obj/item/weapon/twohanded/spear/wooden
	icon = 'icons/obj/craft.dmi'
	icon_state = "stick"

