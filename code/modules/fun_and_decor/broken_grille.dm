/obj/structure/thorns
	icon = 'icons/obj/structures.dmi'
	name = "thorns"
	icon_state = "thorns"

	New()
		for(var/mob/living/carbon/human/H in src.loc)
			dir = H.dir

/obj/structure/thorns/Crossed(var/mob/living/carbon/human/O)
	if(O)
		O.adjustBruteLoss(10)
		spawn(10)
		if(dir == 1)
			O.y = src.y + 1
		if(dir == 2)
			O.y = src.y - 1
		if(dir == 4)
			O.x = src.x + 1
		if(dir == 8)
			O.x = src.x - 1
		usr << "\red Вы налетели на шипы, это больно"