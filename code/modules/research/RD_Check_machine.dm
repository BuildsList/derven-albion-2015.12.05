/obj/machinery/research_check/process()
	analyze()

/mob/living/carbon/human
	var/for_machine = 0

/obj/machinery/research_check

/datum
	technology
		var
			tech_name
			level = 0

		optics
			tech_name = "optics"
		weapon
			tech_name = "weapon"
		tools
			tech_name = "tools"
		armor
			tech_name = "armor"
		robotics
			tech_name = "robotics"
		biotech
			tech_name = "biotech"

/*
/obj/machinery/research_check/New()
	process()
*/
/obj/machinery/research_check
	name = "research_machine"
	icon = 'rnd_machine.dmi'
	icon_state = "main_machine"
	use_power = 1
	var/brute = 0
	var/tox = 0
	var/burn = 0
	var/brain = 0
	var/radiation
	var/nutri = 0
	var/list/technology_list = list()
	density = 1
	//icon
	//icon_state
	var/list/datum/technology/tech = list()
	var/datum/technology/optics/optics
	var/datum/technology/weapon/weapon
	var/datum/technology/tools/tools
	var/datum/technology/armor/armor
	var/datum/technology/robotics/robotics
	var/datum/technology/biotech/biotech


/obj/machinery/research_check/proc/check_check()
	for(var/mob/living/carbon/human/H in range(1,src))
		if(H)
			if(H.lying > 0)
				icon_state = "bingo"
				brute = 1
				tox = 1
				burn = 1
				brain = 1
				nutri = 1
				H.for_machine = 1
			else
				icon_state = "main_machine"


/obj/machinery/research_check/proc/analyze()

	check_check()
	optics = new /datum/technology/optics(src)
	weapon = new /datum/technology/weapon(src)
	tools = new /datum/technology/tools(src)
	armor = new /datum/technology/armor(src)
	robotics = new /datum/technology/robotics(src)
	biotech = new /datum/technology/biotech(src)
	tech += optics
	tech += weapon
	tech += tools
	tech += armor
	tech += robotics
	tech += biotech


	for(var/mob/living/carbon/human/H in range(1,src))
		if(H)
			if(H.lying > 0)
				for(var/g = 1, g < tech.len, g++)
					var/datum/technology/R = tech[g]
					if(R.tech_name == "optics")
						optics = R
					if(R.tech_name == "weapon")
						weapon = R
					if(R.tech_name == "tools")
						tools = R
					if(R.tech_name == "armor")
						armor = R
					if(R.tech_name == "robotics")
						robotics = R
					if(R.tech_name == "biotech")
						biotech = R

				if(H.for_machine == 1)
					brute = H.bruteloss - brute
					tox = H.toxloss - tox
					burn = H.fireloss - burn
					brain = H.brainloss - brain
					nutri = H.nutrition - nutri

					//WAVES OF PROGRESS

					if(brute < 6 && brute > 2)
						weapon.level += 1
					if(brute < 8 && brute > 6)
						weapon.level += 1
					if(brute < 10 && brute > 8)
						weapon.level += 1
					if(brute < 12 && brute > 10)
						weapon.level += 1

					//BRUTE TECHNOLOGY

					if(tox < 6 && tox > 2)
						armor.level += 1
					if(tox < 8 && tox > 6)
						armor.level += 1
					if(tox < 10 && tox > 8)
						armor.level += 1
					if(tox < 12 && tox > 10)
						armor.level += 1

					//TOXIN TECHNOLOGY

					if(burn < 6 && burn > 2)
						optics.level += 1
					if(burn < 8 && burn > 6)
						optics.level += 1
					if(burn < 10 && burn > 8)
						optics.level += 1
					if(burn < 12 && burn > 10)
						optics.level += 1

					//BURN TECHNOLOGY

					if(brain < 6 && brain > 2)
						tools.level += 1
					if(brain < 8 && brain > 6)
						tools.level += 1
					if(brain < 10 && brain > 8)
						tools.level += 1
					if(brain < 12 && brain > 10)
						tools.level += 1

					//B*R*A*I*N TECHNOLOGY

					if(weapon.level > 0 && weapon.level < 2 && armor.level > 0 && armor.level < 2 && optics.level > 0 && optics.level < 2 && tools.level > 0 && tools.level < 2)
						robotics.level += 1
					if(weapon.level > 1 && weapon.level < 3 && armor.level > 1 && armor.level < 3 && optics.level > 1 && optics.level < 3 && tools.level > 1 && tools.level < 3)
						robotics.level += 1
					if(weapon.level > 2 && weapon.level < 4 && armor.level > 2 && armor.level < 4 && optics.level > 2 && optics.level < 4 && tools.level > 2 && tools.level < 4)
						robotics.level += 1
					if(weapon.level > 3 && weapon.level < 2 && armor.level > 3 && armor.level < 2 && optics.level > 3 && optics.level < 2 && tools.level > 3 && tools.level < 2)
						robotics.level += 1

					// FUTURE TECHNOLOGY

					if(nutri < 300)
						biotech.level = 1
					if(nutri < 200)
						biotech.level = 2
					if(nutri < 100)
						biotech.level = 3

/obj/machinery/autolathe24
	name = "research_autolathe"
	desc = "It produces items using NOTHING."
	icon_state = "autolathe"
	icon = 'stationobjs.dmi'
	density = 1
	var/datum/technology/optics/optics
	var/datum/technology/weapon/weapon
	var/datum/technology/tools/tools
	var/datum/technology/armor/armor
	var/datum/technology/robotics/robotics
	var/datum/technology/biotech/biotech

/obj/machinery/autolathe24/proc/CHECK()
	for(var/obj/machinery/research_check/RC in range(2,src))
		optics = RC.optics
		weapon = RC.weapon
		tools = RC.tools
		armor = RC.armor
		robotics = RC.robotics
		biotech = RC.biotech

/*
/obj/machinery/autolathe24/attack_hand(mob/user as mob)

	CHECK()

	if(optics.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];meson'>Meson</A>")
		dat += text("<br><br><A href='?src=\ref[src];glasses'>Glasses</A>")
	if(optics.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];sunglasses'>Sunglasses</A>")
		dat += text("<br><br><A href='?src=\ref[src];modern'>Modern glasses</A>")
	if(optics.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];med_hud'>Medical HUD</A>")
		dat += text("<br><br><A href='?src=\ref[src];sec_hud'>Security HUD</A>")
	if(optics.level == 4)
		dat += text("<br><br><A href='?src=\ref[src];laser'>Laser</A>")

	if(weapon.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];revolver'>Revolver</A>")
	if(weapon.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];stunbaton'>Stunbaton</A>")
	if(weapon.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];taser'>Taser</A>")
	if(weapon.level == 4)
		dat += text("<br><br><A href='?src=\ref[src];light_saber'>Light saber</A>")

	//if(tools.level == 1)
		//dat += text("<br><br><A href='?src=\ref[src];defib'>Defib</A>")
	//if(tools.level == 2)
	//	dat += text("<br><br><A href='?src=\ref[src];wrench'>Big wrench</A>")
	if(tools.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];'>Multitool</A>")
		//dat += text("<br><br><A href='?src=\ref[src];laser_scalpel'>Laser scalpel</A>")
	//if(tools.level == 4)
	//	dat += text("<br><br><A href='?src=\ref[src];live_machine'>Live machine</A>")

	if(armor.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];biosuit'>Biosuit</A>")
	if(armor.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];space_suit'>Space suit</A>")
	if(armor.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];firesuit'>Firesuit</A>")
//	if(armor.level == 4)
//		dat += text("<br><br><A href='?src=\ref[src];space_suit_new_g'>Modern space suit</A>")


	if(robotics.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];ripley'>Ripley circuit</A>")
	if(robotics.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];implants'>Implants machine circuit</A>")
	if(robotics.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];space_suit_new_g'>Mechtronic machine circuit</A>")
	if(robotics.level == 4)
		dat += text("<br><br><A href='?src=\ref[src];grand_machine_circuit'>Grand machine circuit</A>")

	return ..()


/obj/machinery/autolathe24/Topic(href,href_list[])
	switch(href_list["action"])
		if("meson")
			new /obj/item/clothing/glasses/meson(src.loc)
		else if("glasses")
			new /obj/item/clothing/glasses/regular(src.loc)
		else if("sunglasses")
			new /obj/item/clothing/glasses/sunglasses(src.loc)
		else if("modern")
			new /obj/item/clothing/glasses/science(src.loc)
		else if("modern")
			new /obj/item/clothing/glasses/science(src.loc)
		else if("med_hud")
			new /obj/item/clothing/glasses/hud/health(src.loc)
		else if("sec_hud")
			new /obj/item/clothing/glasses/hud/security(src.loc)
		else if("laser")
			new /obj/item/weapon/gun/energy/laser/retro/sc_retro(src.loc)
		else if("revolver")
			new /obj/item/weapon/gun/projectile/revolver/russian(src.loc)
		else if("stunbaton")
			new /obj/item/weapon/melee/baton(src.loc)
		else if("taser")
			new /obj/item/weapon/gun/energy/stunrevolver(src.loc)
		else if("light_saber")
			new /obj/item/weapon/melee/energy/sword/red(src.loc)
		else if("multitool")
			new /obj/item/device/multitool(src.loc)
		else if("biosuit")
			new /obj/item/clothing/suit/bio_suit(src.loc)
		else if("space_suit")
			new /obj/item/clothing/suit/space/oldsuit(src.loc)
		else if("firesuit")
			new /obj/item/clothing/suit/fire/firefighter(src.loc)
		else
			return ..()
*/


/obj/machinery/autolathe24/attack_hand(mob/user as mob)

	CHECK()
	var/dat = text("<b>Science!</b><br>")

	if(optics.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];meson=1'>Meson glasses</A>")
		dat += text("<br><br><A href='?src=\ref[src];glasses=1'>Glasses</A>")
	if(optics.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];sunglasses=1'>Sunglasses</A>")
		dat += text("<br><br><A href='?src=\ref[src];modern=1'>Modern glasses</A>")
	if(optics.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];med_hud=1'>Medical HUD</A>")
		dat += text("<br><br><A href='?src=\ref[src];sec_hud=1'>Security HUD</A>")
	if(optics.level == 4)
		dat += text("<br><br><A href='?src=\ref[src];laser=1'>Laser</A>")

	if(weapon.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];revolver=1'>Revolver</A>")
	if(weapon.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];stunbaton=1'>Stunbaton</A>")
	if(weapon.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];taser=1'>Taser</A>")
	if(weapon.level == 4)
		dat += text("<br><br><A href='?src=\ref[src];light_saber=1'>Light saber</A>")

	//if(tools.level == 1)
		//dat += text("<br><br><A href='?src=\ref[src];defib'>Defib</A>")
	//if(tools.level == 2)
	//	dat += text("<br><br><A href='?src=\ref[src];wrench'>Big wrench</A>")
	if(tools.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];multitool=1'>Multitool</A>")
		//dat += text("<br><br><A href='?src=\ref[src];laser_scalpel'>Laser scalpel</A>")
	//if(tools.level == 4)
	//	dat += text("<br><br><A href='?src=\ref[src];live_machine'>Live machine</A>")

	if(armor.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];biosuit=1'>Biosuit</A>")
	if(armor.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];space_suit=1'>Space suit</A>")
	if(armor.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];firesuit=1'>Firesuit</A>")


	if(biotech.level == 1)
		dat += text("<br><br><A href='?src=\ref[src];soap=1'>Soap</A>")
	if(biotech.level == 2)
		dat += text("<br><br><A href='?src=\ref[src];plant=1'>Plant analyser</A>")
	if(biotech.level == 3)
		dat += text("<br><br><A href='?src=\ref[src];health=1'>Health analyser</A>")




	user << browse("[dat]", "window=orebox")
	return

/obj/machinery/autolathe24/Topic(href, href_list)
	if(..())
		return
	usr.set_machine(src)
	src.add_fingerprint(usr)
	if(href_list["meson"])
	else if(href_list["glasses"])
		new /obj/item/clothing/glasses/regular(src.loc)
	else if(href_list["sunglasses"])
		new /obj/item/clothing/glasses/sunglasses(src.loc)
	else if(href_list["meson"])
		new /obj/item/clothing/glasses/science(src.loc)
	else if(href_list["modern"])
		new /obj/item/clothing/glasses/science(src.loc)
	else if(href_list["soap"])
		new /obj/item/weapon/soap(src.loc)
	else if(href_list["plant"])
		new /obj/item/device/analyzer/plant_analyzer(src.loc)
	else if(href_list["health"])
		new /obj/item/device/healthanalyzer(src.loc)
	else if(href_list["med_hud"])
		new /obj/item/clothing/glasses/hud/health(src.loc)
	else if(href_list["sec_hud"])
		new /obj/item/clothing/glasses/hud/security(src.loc)
	else if(href_list["laser"])
		new /obj/item/weapon/gun/energy/laser/retro/sc_retro(src.loc)
	else if(href_list["revolver"])
		new /obj/item/weapon/gun/projectile/revolver(src.loc)
	else if(href_list["stunbaton"])
		new /obj/item/weapon/melee/baton(src.loc)
	else if(href_list["taser"])
		new /obj/item/weapon/gun/energy/stunrevolver(src.loc)
	else if(href_list["light_saber"])
		new /obj/item/weapon/melee/energy/sword/red(src.loc)
	else if(href_list["multitool"])
		new /obj/item/device/multitool(src.loc)
	else if(href_list["biosuit"])
		new /obj/item/clothing/suit/bio_suit(src.loc)
	else if(href_list["space_suit"])
		new /obj/item/clothing/suit/space/oldsuit(src.loc)
	else if(href_list["firesuit"])
		new /obj/item/clothing/suit/fire/firefighter(src.loc)
	src.updateUsrDialog()
	return

