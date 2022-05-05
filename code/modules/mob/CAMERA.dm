//Õ¿√ÀŒ —œ»«ƒ»À

 ////////////////////
// Library made by //
// Hugh Katzenbach //
//  (aka Garthor)  //
//   Nov 8, 2003   //
////////////////////
proc
	limitAngle(var/A)
		while(A < 0)
			A += 360
		A %= 360
		return A
	getTurf(var/turf/start, var/angle, var/dist)
		if(!istype(start) || dist == 0)
			return start
		var/X = round( start.x + cos(angle) * dist , 1)
		var/Y = round( start.y + sin(angle) * dist , 1)
		var/turf/T = locate(X, Y, start.z)
		if(T)
			return T
		else
			return getTurf(start, angle, max(dist-1, 0))
	dir2Angle(var/dir)
		if(dir == NORTH)
			return 90
		if(dir == SOUTH)
			return 270
		if(dir == EAST)
			return 0
		if(dir == WEST)
			return 180
		if(dir == NORTHEAST)
			return 45
		if(dir == NORTHWEST)
			return 135
		if(dir == SOUTHEAST)
			return 315
		if(dir == SOUTHWEST)
			return 225

obj
	camera
		New(var/mob/living/carbon/human/O)
			owner = O
		var/angle = 0			// The current angle of the camera
		var/destAngle			// For keeping track of the current destination angle.
		var/mob/living/carbon/human/owner			// The person this camera belongs to.
		proc
			isMoving()
				return ( angle == destAngle ) ? FALSE : TRUE
			setDest(var/dest)
				var/direction	// Direction (clockwise or counter-clockwise) to rotate the camera.
				dest = limitAngle(dest)
				destAngle = dest
				var/A = dest
				A -= angle
				A = limitAngle(A)
				if(A > 180)
					direction = -1

				else if(A < 180)
					direction = 1

				else
					direction = pick(1, -1)

				do
					if(dest == 0)
						angle += direction * min(owner.cameraSpeed, min( abs(angle - dest), abs(angle - 360)))
					else
						angle += direction * min(owner.cameraSpeed, abs(angle - dest))
					angle = limitAngle(angle)
					sleep(1)
					loc = getTurf( owner.loc, angle, owner.camDist )
				while(dest == destAngle && dest != angle) // So that it stops if another setDest() is called.

/mob/living/carbon/human
	var
		camDist = 4				// Distance between character and camera.
		cameraSpeed = 18
		obj/camera/cam			// The actual camera object.
		moveWhileTurning = 0	// setting to 1 allows moving while in the middle of turning.

	Login() // Login() is called when a client connects to a mob, not when a client connects to the world.
			// client/New() is what is called when someone connects to the world.
		..()
		cam = new /obj/camera(src)
		cam.setDest( dir2Angle(dir) )
		client.eye = cam
	Move()
		if(cam)
			if(!moveWhileTurning)
				if(cam.isMoving())
					return 0
			. = ..()
			cam.setDest( dir2Angle(dir) )
		else
			. = ..()

/mob/living/carbon/human/proc/cam_cam()
	if(cam)
		if(!moveWhileTurning)
			if(cam.isMoving())
				return 0
		. = ..()
		cam.setDest( dir2Angle(dir) )
	else
		. = ..()