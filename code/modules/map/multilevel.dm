/obj/machinery/button_up
	name = "elevator console"
	icon = 'icons/elevator.dmi'
	icon_state = "but2"
	var/z_teleport = 2
	use_power = 1

/obj/machinery/button_up_up
	name = "elevator console"
	icon = 'icons/elevator.dmi'
	icon_state = "but2"
	var/z_teleport = 3
	use_power = 1

/obj/machinery/button_down
	name = "elevator console"
	icon = 'icons/elevator.dmi'
	icon_state = "but1"
	var/z_teleport = 1
	use_power = 1

/obj/machinery/button_up/attack_hand(user as mob)
	for(var/atom/movable/O in range(2,src))
		if(z_teleport)
			O.z = z_teleport

/obj/machinery/button_down/attack_hand(user as mob)
	for(var/atom/movable/O in range(2,src))
		if(z_teleport)
			O.z = z_teleport

/obj/machinery/button_up_up/attack_hand(user as mob)
	for(var/atom/movable/O in range(2,src))
		if(z_teleport)
			O.z = z_teleport

//SHUTTLE

/obj/machinery/bort_comp1
	name = "console"
	icon = 'icons/obj/shuttle.dmi'
	icon_state = "shuttle"
	var/z_teleport = 6

/obj/machinery/bort_comp1/attack_hand(user as mob)
	for(var/obj/O in range(3,src))
		if(z_teleport)
			O.z = z_teleport
	for(var/mob/M in range(3,src))
		if(z_teleport)
			M.z = z_teleport
	for(var/turf/T in range(3,src))
		if(z_teleport)
			var/turf/J = locate(T.x, T.y, z_teleport)
			J = new(J)
			del(T)

	usr.z = z_teleport

/obj/machinery/forward
	name = "forward"
	icon = 'icons/obj/shuttle.dmi'
	icon_state = "no"
	var/y_teleport = 1

/obj/machinery/forward/attack_hand(user as mob)
	for(var/turf/simulated/wall/W in range(4,src))
		if(W.pirim_pom_pom == "forward")
			return
	for(var/mob/living/L in range(4,src))
		if(L.y == src.y + 4)
			L.gib()
	for(var/obj/O in range(3,src))
		if(y_teleport)
			O.y = O.y + y_teleport
	for(var/mob/M in range(3,src))
		if(y_teleport)
			M.y = M.y + y_teleport
/*	for(var/turf/T in range(3,src))
		if(y_teleport)
			var/turf/J = locate(T.x, T.y + y_teleport, T.z)
			J = new(J)
			del(T)*/

	//usr.y = usr.y + y_teleport

/obj/machinery/backward
	name = "backward"
	icon = 'icons/obj/shuttle.dmi'
	icon_state = "no"
	var/y_teleport = 1

/obj/machinery/backward/attack_hand(user as mob)
	for(var/turf/simulated/wall/W in range(4,src))
		if(W.pirim_pom_pom == "backward")
			return
	for(var/mob/living/L in range(4,src))
		if(L.y == src.y - 4)
			L.gib()
	for(var/obj/O in range(3,src))
		if(y_teleport)
			O.y = O.y - y_teleport
	for(var/mob/M in range(3,src))
		if(y_teleport)
			M.y = M.y - y_teleport
/*	for(var/turf/T in range(3,src))
		if(y_teleport)
			var/turf/J = locate(T.x, T.y - y_teleport, T.z)
			J = new(J)
			del(T)*/

	//usr.y = usr.y - y_teleport

//MULTICARS

/obj/wheel
	icon = 'icons/obj/shuttle.dmi'
	icon_state = "wheel"
	name = "wheel"

/obj/machinery/forward/car
	name = "forward"
	icon = 'icons/obj/shuttle.dmi'
	icon_state = "no"
	y_teleport = 1
	var/wheels = 0
	var/motor = 0

turf/simulated/wall
	var/pirim_pom_pom = ""

/obj/machinery/forward/car/attack_hand(user as mob)
	for(var/turf/simulated/wall/W in range(3,src))
		if(W.pirim_pom_pom == "forward")
			return
	for(var/mob/living/L in range(3,src))
		if(L.y == src.y + 3)
			L.gib()
	for(var/obj/wheel/O in range(2,src))
		wheels += 1
	if(wheels < 4)
		return
	for(var/obj/O in range(2,src))
		if(y_teleport)
			O.y = O.y + y_teleport
	for(var/mob/M in range(2,src))
		if(y_teleport)
			M.y = M.y + y_teleport
	wheels = 0
/*	for(var/turf/T in range(3,src))
		if(y_teleport)
			var/turf/J = locate(T.x, T.y + y_teleport, T.z)
			J = new(J)
			del(T)*/

	//usr.y = usr.y + y_teleport

/obj/machinery/backward/car
	name = "backward"
	icon = 'icons/obj/shuttle.dmi'
	icon_state = "no"
	y_teleport = 1
	var/wheels = 0
	var/motor = 0

/obj/machinery/backward/car/attack_hand(user as mob)
	for(var/turf/simulated/wall/W in range(3,src))
		if(W.pirim_pom_pom == "backward")
			return
	for(var/mob/living/L in range(3,src))
		if(L.y == src.y - 3)
			L.gib()
	for(var/obj/wheel/O in range(2,src))
		wheels += 1
	if(wheels < 4)
		return
	for(var/obj/O in range(2,src))
		if(y_teleport)
			O.y = O.y - y_teleport
	for(var/mob/M in range(2,src))
		if(y_teleport)
			M.y = M.y - y_teleport
	wheels = 0
