//Captain's Spacesuit
/obj/item/clothing/head/helmet/space/capspace
	name = "captain's space helmet"
	icon_state = "capspace"
	item_state = "capspacehelmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Only for the most fashionable of military figureheads."
	flags_inv = HIDEFACE
	permeability_coefficient = 0.01
	armor = list(melee = 65, bullet = 50, laser = 50,energy = 25, bomb = 50, bio = 100, rad = 50)

//Captain's space suit This is not the proper path but I don't currently know enough about how this all works to mess with it.
/obj/item/clothing/suit/space/captain
	name = "captain's armor"
	desc = "A bulky, heavy-duty piece of exclusive Nanotrasen armor. YOU are in charge!"
	icon_state = "caparmor"
	item_state = "capspacesuit"
	w_class = 4
	allowed = list(/obj/item/weapon/tank/emergency_oxygen, /obj/item/device/flashlight,/obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	slowdown = 1
	armor = list(melee = 65, bullet = 50, laser = 50, energy = 25, bomb = 50, bio = 100, rad = 50)

//Old Spacesuit
/obj/item/clothing/head/helmet/space/oldsuit
	name = "Old Space Helmet"
	desc = "An old fashioned space helmet. Good times."
	icon_state = "spaceold"
	item_state = "spaceold"

/obj/item/clothing/suit/space/oldsuit
	name = "Old Space Suit"
	icon_state = "spaceold"
	item_state = "spaceold"
	desc = "An old fashioned baggy grey space suit. Good times."
	slowdown = 1



//Deathsquad suit
/obj/item/clothing/head/helmet/space/deathsquad
	name = "deathsquad helmet"
	desc = "That's not red paint. That's real blood."
	icon_state = "deathsquad"
	item_state = "deathsquad"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 50, bomb = 50, bio = 100, rad = 30)

/obj/item/clothing/head/helmet/space/deathsquad/beret
	name = "officer's beret"
	desc = "An armored beret commonly used by special operations officers. Uses forcefield technology to protect the head from space."
	icon_state = "beret_badge"
	flags = STOPSPRESSUREDMAGE
	flags_inv = 0


//NASA Voidsuit
/obj/item/clothing/head/helmet/space/nasavoid
	name = "NASA Void Helmet"
	desc = "An old, NASA Centcom branch designed, dark red space suit helmet."
	icon_state = "void"
	item_state = "void"

/obj/item/clothing/suit/space/nasavoid
	name = "NASA Voidsuit"
	icon_state = "void"
	item_state = "void"
	desc = "An old, NASA Centcom branch designed, dark red Space suit."
	slowdown = 1
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/multitool)


//Space santa outfit suit
/obj/item/clothing/head/helmet/space/santahat
	name = "Santa's hat"
	desc = "Ho ho ho. Merrry X-mas!"
	icon_state = "santahat"
	flags = HEADCOVERSEYES | BLOCKHAIR | STOPSPRESSUREDMAGE

/obj/item/clothing/suit/space/santa
	name = "Santa's suit"
	desc = "Festive!"
	icon_state = "santa"
	item_state = "santa"
	slowdown = 0
	flags = STOPSPRESSUREDMAGE
	allowed = list(/obj/item) //for stuffing exta special presents


//Space pirate outfit
/obj/item/clothing/head/helmet/space/pirate
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 30, bio = 30, rad = 30)
	flags = HEADCOVERSEYES | BLOCKHAIR | STOPSPRESSUREDMAGE

/obj/item/clothing/suit/space/pirate
	name = "pirate coat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	w_class = 3
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank/emergency_oxygen)
	slowdown = 0
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 30, bio = 30, rad = 30)

//ERT Suits
//Normal
/obj/item/clothing/suit/space/ert
	name = "ert hardsuit"
	icon_state = "ert"
	desc = "A hardsuit used by Emergency Response Team personnel."
	item_state = "ert_suit"

	w_class = 4
	allowed = list(/obj/item/weapon/tank/oxygen, /obj/item/device/flashlight,/obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/weapon/melee/baton, /obj/item/weapon/handcuffs)
	slowdown = 1
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 50, bio = 100, rad = 30)

/obj/item/clothing/head/helmet/space/ert
	name = "ert helmet"
	desc = "A space helmet used by Emergency Response Team personnel."
	icon_state = "ert"
	item_state = "ert_suit"
	item_color = "ert"

	permeability_coefficient = 0.01
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 40, bomb = 50, bio = 100, rad = 30)

/obj/item/clothing/suit/space/ert/red
	name = "red ert hardsuit"
	icon_state = "ert-red"
	desc = "A hardsuit used by Emergency Response Team personnel who specialize in combat and peacekeeping."
	item_state = "ert_suit-red"

/obj/item/clothing/head/helmet/space/ert/red
	name = "red ert helmet"
	desc = "A space helmet used by Emergency Response Team personnel who specialize in combat and peacekeeping."
	icon_state = "ert-red"
	item_state = "ert_suit-red"
	item_color = "ertred"

/obj/item/clothing/suit/space/ert/green
	name = "green ert hardsuit"
	icon_state = "ert-green"
	desc = "A hardsuit used by Emergency Response Team personnel who specialize in leadership and command."
	item_state = "ert_suit-green"

/obj/item/clothing/head/helmet/space/ert/green
	name = "green ert helmet"
	desc = "A space helmet used by Emergency Response Team personnel who specialize in leadership and command."
	icon_state = "ert-green"
	item_state = "ert_suit-green"
	item_color = "ertgreen"

/obj/item/clothing/suit/space/ert/blue
	name = "blue ert hardsuit"
	icon_state = "ert-blue"
	desc = "A hardsuit used by Emergency Response Team personnel who specialize in first aid and healing."
	item_state = "ert_suit-blue"

/obj/item/clothing/head/helmet/space/ert/blue
	name = "blue ert helmet"
	desc = "A space helmet used by Emergency Response Team personnel who specialize in first aid and healing."
	icon_state = "ert-blue"
	item_state = "ert_suit-blue"
	item_color = "ertblue"

/obj/item/clothing/suit/space/ert/yellow
	name = "yellow ert hardsuit"
	icon_state = "ert-yellow"
	desc = "A hardsuit used by Emergency Response Team personnel who specialize in engineering and repair."
	item_state = "ert_suit-yellow"

/obj/item/clothing/head/helmet/space/ert/yellow
	name = "yellow ert helmet"
	desc = "A space helmet used by Emergency Response Team personnel who specialize in engineering and repair."
	icon_state = "ert-yellow"
	item_state = "ert_suit-yellow"
	item_color = "ertyellow"