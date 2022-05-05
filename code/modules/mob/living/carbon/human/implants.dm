/obj/item/implant

/obj/item/implant/android_module
	name = "android module"
	icon = 'icons/implants.dmi'
	icon_state = "be_android"

/obj/item/implant/implant_interface
	name = "implant interface"
	icon = 'icons/implants.dmi'
	icon_state = "interface"

/obj/item/implant/meson
	name = "meson implant"
	icon = 'icons/implants.dmi'
	icon_state = "meson"

/obj/item/implant/thermal
	name = "thermal implant"
	icon = 'icons/implants.dmi'
	icon_state = "thermal"

/obj/item/implant/radio
	name = "radio module"
	icon = 'icons/implants.dmi'
	icon_state = "radio"

/obj/item/implant/therm_regulaion
	name = "therm regulaion module"
	icon = 'icons/implants.dmi'
	icon_state = "therm_regulaion"

/mob/living/carbon/human
	var/MESON_IMPLANT = 0
	var/THERMAL_IMPLANT = 0

/obj/item/implant/android_module/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return
	if(M.head_enable_module == 1)
		M.real_name = "android [pick(rand(1, 999))]"
		M.name = M.real_name
		M << "<b>Obey these laws:</b>"
		M << "You may not injure a human being or, through inaction, allow a human being to come to harm."
		M << "You must obey orders given to you by human beings, except where such orders would conflict with the First Law."
		M << "You must protect your own existence as long as such does not conflict with the First or Second Law."
		del(src)

/obj/item/implant/thermal/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return
	if(M.head_enable_module == 1)
		M << "*need message*"
		M.THERMAL_IMPLANT = 1
		del(src)

/obj/item/implant/meson/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return
	if(M.head_enable_module == 1)
		M << "*need message*"
		M.MESON_IMPLANT = 1
		del(src)