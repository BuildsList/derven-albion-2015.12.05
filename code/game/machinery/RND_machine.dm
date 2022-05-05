/obj/machinery/r_n_d/machine
	name = "Research machine"
//	icon = 'icon_name.dmi'
	icon_state = "machine"
	density = 1
	anchored = 1

/obj/machinery/r_n_d/machine/proc/check_and_run()
	var/mob/living/carbon/human/H
	for(H in range(1, src))
