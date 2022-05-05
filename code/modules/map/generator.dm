/obj/structure/flora/ausbushes/reedbush/FORASTEROID
	var/chance

/obj/structure/flora/ausbushes/reedbush/FORASTEROID/New()
	chance = rand(0,100)
	var/turf/T = src.loc
	if(chance > 8 || T.density == 1)
		del(src)

/obj/effect/glowshroom/FORASTEROID
	var/chance
	luminosity = 3
/obj/effect/glowshroom/FORASTEROID/New()
	chance = rand(0,100)
	var/turf/T = src.loc
	SetLuminosity(3)
	if(chance > 4 || T.density == 1)
		del(src)

/obj/effect/mine/FORASTEROID
	var/chance
	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 2 || T.density == 1)
			del(src)

/obj/effect/decal/remains/human/FORASTEROID
	var/chance
	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 3 || T.density == 1)
			del(src)

/obj/structure/flora/ausbushes/ppflowers/FORASTEROID
	var/chance
	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 6 || T.density == 1)
			del(src)

/obj/structure/barricade/wooden/FORASTEROID
	var/chance
	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 3 || T.density == 1)
			del(src)

/obj/item/weapon/lighter/zippo/FORASTEROID
	var/chance
	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 2 || T.density == 1)
			del(src)

/mob/living/simple_animal/crab/FORASTEROID
	var/chance

	New()
		Life()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 8 || T.density == 1)
			del(src)

/mob/living/simple_animal/crab/FORASTEROID/Life()
	..()
	//CRAB movement
	if(!ckey && !stat)
		if(isturf(src.loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				Move(get_step(src,pick(4,8)))
				turns_since_move = 0
	regenerate_icons()

/mob/living/simple_animal/hostile/bear/FORASTEROID
	var/chance
	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		Life()
		if(chance > 2 || T.density == 1)
			del(src)

/obj/structure/flora/tree/pine/FORASTEROID
	var/chance

	New()
		chance = rand(0,100)
		var/turf/T = src.loc
		if(chance > 8 || T.density == 1)
			del(src)

/mob/living/simple_animal/hostile/giant_spider/FORASTEROID
	var/chance
	New()
		var/turf/T = src.loc
		chance = rand(0,100)
		Life()
		if(chance > 2 || T.density == 1)
			del(src)

/mob/living/simple_animal/hostile/giant_spider/FORASTEROID/Life()
	..()
	if(!stat)
		if(stance == HOSTILE_STANCE_IDLE)
			//1% chance to skitter madly away
			if(!busy && prob(1))
				/*var/list/move_targets = list()
				for(var/turf/T in orange(20, src))
					move_targets.Add(T)*/
				stop_automated_movement = 1
				Goto(pick(orange(20, src)), move_to_delay)
				spawn(50)
					stop_automated_movement = 0
					walk(src,0)

/turf/simulated/mineral
	thermal_conductivity = 0.040
	heat_capacity = 10000
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD

/turf/simulated/mineral/ultra

/turf/simulated/mineral/ultra/snow
	icon_state = "snow_rock"

	randomization_myself()
		var/chance = pick(1,0,1,0,3,4,5,1)
		if(chance != 1)
			density = 0
			icon_state = "snow"
			temperature = 265


/turf/simulated/mineral/ultra/proc/randomization_myself()
	var/chance = pick(1,0,1,0,3,4,5,1)
	if(chance != 1)
		density = 0
		icon_state = "sand"

/turf/simulated/mineral/ultra/New()
	randomization_myself()

	/*

*/

// HATE TURFS, HATE BYOND, HATE BLOCK
/*

world
	maxx = 100
	maxy = 100

proc/generate()
	var/turf/space/T
	for(T in block(locate(1,1,3),locate(100,100,3)))
		var/chance = pick(1,0,1,0,3,4,5,1)
		if(chance == 1)
			new /turf/simulated/floor/plating/asteroid_ultra_high_advance(T.loc)
		else
			new /turf/simulated/mineral/random(T.loc)

/mob/living/carbon/human/verb/Gen()
	generate()
*/
/*
proc/generate_wall_and_floor()
	for(var/area/asteroid2500/A in world)
		var/chance = pick(1,0,1,0,3,4,5,1)
		var/turf/simulated/floor/plating/asteroid_ultra_high_advance/FLOOR = locate(A.x, A.y, A.z)
		var/turf/simulated/mineral/random/WALL = locate(A.x, A.y, A.z)
		if(chance == 1)
			new WALL
		else
			new FLOOR

/area/asteroid2500
*/
/*
/datum/anal_generator
	var/grid = new/list(100, 100)

/datum/anal_generator/proc/gen()
	var/YOY
	var/anus
	var/dranus
	var/turf/nothing
	for(var/i = 1, i < 100, i++)
		YOY += 1
		if(!(i > 74 && i < 78) || !(YOY > 37 && YOY < 40))
			grid[i][YOY] = pick(1,0)
		else
			grid[i][YOY] = 3
		anus = grid[i]
		dranus = grid[YOY]
		nothing = locate(i, YOY, 2)
		if(anus == 1 && dranus == 1)
			new /turf/simulated/mineral(nothing.loc)
			world << "ANUS"
		else if(anus == 3 || dranus == 3)
			world << "DRANUS"
		else
			new /turf/simulated/floor/plating/asteroid_ultra_high_advance(nothing.loc)
			world << "ANUSDRANUS"

/datum/anal_generator/New()
	sleep(3)
	world << "HELLO"
	gen()
*/