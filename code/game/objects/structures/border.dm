/*
________
\______ \   ______________  __ ____   ____    ______   ______  _  __ ___________
 |    |  \_/ __ \_  __ \  \/ // __ \ /    \   \____ \ /  _ \ \/ \/ // __ \_  __ \
 |    `   \  ___/|  | \/\   /\  ___/|   |  \  |  |_> >  <_> )     /\  ___/|  | \/
/_______  /\___  >__|    \_/  \___  >___|  /  |   __/ \____/ \/\_/  \___  >__|
        \/     \/                 \/     \/   |__|                      \/

*/

/obj/border
	icon = 'icons/border.dmi' //WHAT'S YOUR ICON
	icon_state = "border"
	name = "border"
	flags = ON_BORDER
	density = 1
	anchored = 1.0
	var/ini_dir = null
	var/state = 0

/obj/border/CanPass(atom/movable/mover as mob|obj, turf/target, height=0, air_group=0)
	if(!mover)
		return 0
	if(air_group || (height==0)) return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(mover))
		return 1
	if(get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/border/CheckExit(atom/movable/mover, turf/target, height=0, air_group=0)
	if(!mover)
		return 0
	if(air_group || (height==0)) return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(mover))
		return 1
	if(get_dir(loc, target) == dir)
		return !density
	else
		return 1


/obj/border/attack_hand(mob/user as mob)
	user << "\red You climb onto border"
	sleep(5)
	user.loc = src.loc
