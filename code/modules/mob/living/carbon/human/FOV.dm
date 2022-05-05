/mob/living/carbon/human
	var/image/IMAGE

/mob/living
	var/moving = 0

mob/living/carbon/human/Move()
	..()
	check_FOV()
	if(m_intent == "running")
		moving = 1
		sleep(1)
		moving = 0

mob/living/Move()
	..()
	moving = 1
	sleep(5)
	moving = 0

mob/living/carbon/human/proc/lol_procces(usr.client)
	spawn while(1)
		check_FOV()
		sleep(1)

mob/living/carbon/human/proc/check_FOV()
	var/icon/ANUSDRANUS
	for(var/mob/living/M in view(usr.client))
		if(dir == 1)
			if(M.y == y - 1 && (M.x < x - 1 || M.x < x + 1))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y - 2 && (M.x < x - 2 || M.x < x + 2))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y - 3 && (M.x < x - 3 || M.x < x + 3))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y - 4 && (M.x < x - 4 || M.x < x + 4))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y - 5 && (M.x < x - 5 || M.x < x + 5))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y - 6 && (M.x < x - 6 || M.x < x + 6))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y - 7 && (M.x < x - 7 || M.x < x + 7))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 255
				usr << IMAGE
		if(dir == 2)
			if(M.y == y + 1 && (M.x < x - 1 || M.x < x + 1))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y + 2 && (M.x < x - 2 || M.x < x + 2))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y + 3 && (M.x < x - 3 || M.x < x + 3))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y + 4 && (M.x < x - 4 || M.x < x + 4))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y + 5 && (M.x < x - 5 || M.x < x + 5))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y + 6 && (M.x < x - 6 || M.x < x + 6))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.y == y + 7 && (M.x < x - 7 || M.x < x + 7))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 255
				usr << IMAGE
		if(dir == 8)
			if(M.x == x + 1 && (M.y < y - 1 || M.y < y + 1))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x + 2 && (M.y < y - 2 || M.y < y + 2))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x + 3 && (M.y < y - 3 || M.y < y + 3))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x + 4 && (M.y < y - 4 || M.y < y + 4))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x + 5 && (M.y < y - 5 || M.y < y + 5))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x + 6 && (M.y < y - 6 || M.y < y + 6))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x + 7 && (M.y < y - 7 || M.y < y + 7))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 255
				usr << IMAGE
		if(dir == 4)
			if(M.x == x - 1 && (M.y < y - 1 || M.y < y + 1))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x - 2 && (M.y < y - 2 || M.y < y + 2))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x - 3 && (M.y < y - 3 || M.y < y + 3))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x - 4 && (M.y < y - 4 || M.y < y + 4))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x - 5 && (M.y < y - 5 || M.y < y + 5))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x - 6 && (M.y < y - 6 || M.y < y + 6))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else if(M.x == x - 7 && (M.y < y - 7 || M.y < y + 7))
				IMAGE = image(M.icon,M,M.icon_state)
				for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 1
				usr << IMAGE
			else
				IMAGE = image(M.icon,M,M.icon_state)
					for(var/G = 1, G < M.overlays.len, G++)
					ANUSDRANUS = M.overlays[G]
					M.icon.Blend(ANUSDRANUS,ICON_ADD)
				IMAGE = ANUSDRANUS
				IMAGE.override = TRUE
				IMAGE.alpha = 255
				usr << IMAGE
		if(M.moving == 1 && IMAGE.alpha == 1)
			IMAGE.alpha = 128