/obj/item/weapon/surgicaldrill/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return
	if(user.zone_sel.selecting == "head")
		var/mob/living/carbon/human/H = M
		if(istype(M, /mob/living/carbon/human) && ((H.head && H.head.flags & HEADCOVERSEYES) || (H.wear_mask && H.wear_mask.flags & MASKCOVERSEYES) || (H.glasses && H.glasses.flags & GLASSESCOVERSEYES)))
			// you can't stab someone in the eyes wearing a mask!
			user << "\blue You're going to need to remove that mask/helmet/glasses first."
			return

		switch(M:head_op_stage)
			if(1.0)
				var/datum/bone/G = M.select_bone("cranium")
				if(G.broken == 0)
					user << "\blue Вы сверлите дыру в черепе"
					M:head_op_stage = 2.0

/mob/living/carbon/human
	var
		head_op_stage = 0.0


/mob/living
	var
		MOUTHTHREAD = 0
		cranium_repair_op_stage = 0.0
		chest_repair_op_stage = 0.0
		groin_repair_op_stage = 0.0
		r_arm_repair_op_stage = 0.0
		l_arm_repair_op_stage = 0.0
		l_leg_repair_op_stage = 0.0
		r_leg_repair_op_stage = 0.0


/obj/item/weapon/scalpel/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return

	src.add_fingerprint(user)

	if(user.zone_sel.selecting == "head" && M.broken_bone_head == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез на голове [M] с помощью [src]."), 1)
		switch(M:cranium_repair_op_stage)
			if(0.0)
				M:cranium_repair_op_stage = 1.0

	else if(user.zone_sel.selecting == "chest" && M.broken_bone_chest == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез на туловище [M] с помощью [src]."), 1)
		switch(M:chest_repair_op_stage)
			if(0.0)
				M:chest_repair_op_stage = 1.0

	else if(user.zone_sel.selecting == "groin" && M.broken_bone_groin == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез в области таза [M] с помощью [src]."), 1)
		switch(M:groin_repair_op_stage)
			if(0.0)
				M:groin_repair_op_stage = 1.0

	else if(user.zone_sel.selecting == "r_arm" && M.broken_bone_r_arm == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез в области правой руки [M] с помощью [src]."), 1)
		switch(M:r_arm_repair_op_stage)
			if(0.0)
				M:r_arm_repair_op_stage = 1.0

	else if(user.zone_sel.selecting == "l_arm" && M.broken_bone_l_arm == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез в области левой руки [M] с помощью [src]."), 1)
		switch(M:l_arm_repair_op_stage)
			if(0.0)
				M:l_arm_repair_op_stage = 1.0

	else if(user.zone_sel.selecting == "l_leg" && M.broken_bone_l_leg == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез в области левой ноги [M] с помощью [src]."), 1)
		switch(M:l_leg_repair_op_stage)
			if(0.0)
				M:l_leg_repair_op_stage = 1.0

	else if(user.zone_sel.selecting == "r_leg" && M.broken_bone_r_leg == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез в области правой ноги [M] с помощью [src]."), 1)
		switch(M:r_leg_repair_op_stage)
			if(0.0)
				M:r_leg_repair_op_stage = 1.0


	else if(user.zone_sel.selecting == "head")
		var/mob/living/carbon/human/H = M
		if(istype(M, /mob/living/carbon/human) && ((H.head && H.head.flags & HEADCOVERSEYES) || (H.wear_mask && H.wear_mask.flags & MASKCOVERSEYES) || (H.glasses && H.glasses.flags & GLASSESCOVERSEYES)))
			// you can't stab someone in the eyes wearing a mask!
			user << "\blue You're going to need to remove that mask/helmet/glasses first."
			return

		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] начинает делать надрез на голове [M] с помощью [src]."), 1)

		switch(M:head_op_stage)
			if(0.0)
				M:head_op_stage = 1.0



/obj/item/implant/implant_interface/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return
	if(user.zone_sel.selecting == "head")
		var/mob/living/carbon/human/H = M
		if(istype(M, /mob/living/carbon/human) && ((H.head && H.head.flags & HEADCOVERSEYES) || (H.wear_mask && H.wear_mask.flags & MASKCOVERSEYES) || (H.glasses && H.glasses.flags & GLASSESCOVERSEYES)))
			// you can't stab someone in the eyes wearing a mask!
			user << "\blue You're going to need to remove that mask/helmet/glasses first."
			return

		switch(M:head_op_stage)
			if(2.0)
				user << "\blue Вы устанавливаете имплант интерфейс в тело [M]"
				M.head_enable_module = 1
				del(src)

/obj/item/weapon/surgery/thread
	name = "thread"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "thread"

/obj/item/weapon/surgery/bone
	name = "bone fixer"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bone_fixer"

/obj/item/weapon/surgery/bone_replacer
	name = "bone replacer"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bone_replacer"


/obj/item/weapon/surgery/bone/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)

	if(!istype(M, /mob))
		return

	src.add_fingerprint(user)

	if(user.zone_sel.selecting == "head" && M.broken_bone_head == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
			M.repair_broken_bones_in_location(user.zone_sel.selecting)
		switch(M:cranium_repair_op_stage)
			if(1.0)
				M:cranium_repair_op_stage = 2.0

	else if(user.zone_sel.selecting == "chest" && M.broken_bone_chest == 1)
		switch(M:chest_repair_op_stage)
			if(1.0)
				M:chest_repair_op_stage = 2.0
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
				M.repair_broken_bones_in_location(user.zone_sel.selecting)

	else if(user.zone_sel.selecting == "groin" && M.broken_bone_groin == 1)
		switch(M:groin_repair_op_stage)
			if(1.0)
				M:groin_repair_op_stage = 2.0
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
				M.repair_broken_bones_in_location(user.zone_sel.selecting)

	else if(user.zone_sel.selecting == "right arm" && M.broken_bone_r_arm == 1)
		switch(M:r_arm_repair_op_stage)
			if(1.0)
				M:r_arm_repair_op_stage = 2.0
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
				M.repair_broken_bones_in_location(user.zone_sel.selecting)

	else if(user.zone_sel.selecting == "left arm" && M.broken_bone_l_arm == 1)
		switch(M:l_arm_repair_op_stage)
			if(1.0)
				M:l_arm_repair_op_stage = 2.0
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
				M.repair_broken_bones_in_location(user.zone_sel.selecting)

	else if(user.zone_sel.selecting == "left leg" && M.broken_bone_l_leg == 1)
		switch(M:l_leg_repair_op_stage)
			if(1.0)
				M:l_arm_repair_op_stage = 2.0
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
				M.repair_broken_bones_in_location(user.zone_sel.selecting)

	else if(user.zone_sel.selecting == "right leg" && M.broken_bone_r_leg == 1)
		switch(M:r_leg_repair_op_stage)
			if(1.0)
				M:cranium_repair_op_stage = 2.0
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] сращивает кости [M] с помощью [src]."), 1)
				M.repair_broken_bones_in_location(user.zone_sel.selecting)

/obj/item/weapon/surgery/thread/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return

	src.add_fingerprint(user)

	if(user.zone_sel.selecting == "head" && M.broken_bone_head == 1)
		switch(M:cranium_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:cranium_repair_op_stage = 3.0
				M.broken_bone_head = 0

	else if(user.zone_sel.selecting == "chest" && M.broken_bone_chest == 1)
		switch(M:chest_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:chest_repair_op_stage = 3.0
				M.broken_bone_chest = 0

	else if(user.zone_sel.selecting == "groin" && M.broken_bone_groin == 1)
		switch(M:groin_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:groin_repair_op_stage = 3.0
				M.broken_bone_groin = 0

	else if(user.zone_sel.selecting == "right arm" && M.broken_bone_r_arm == 1)
		switch(M:r_arm_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:r_arm_repair_op_stage = 3.0
				M.broken_bone_r_arm = 0

	else if(user.zone_sel.selecting == "left arm" && M.broken_bone_l_arm == 1)
		switch(M:l_arm_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:l_arm_repair_op_stage = 3.0
				M.broken_bone_l_arm = 0

	else if(user.zone_sel.selecting == "left leg" && M.broken_bone_l_leg == 1)
		switch(M:l_leg_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:l_leg_repair_op_stage = 3.0
				M.broken_bone_l_leg = 0

	else if(user.zone_sel.selecting == "right leg" && M.broken_bone_r_leg == 1)
		switch(M:r_leg_repair_op_stage)
			if(2.0)
				for(var/mob/O in viewers(M, null))
					O.show_message(text("\red [user] зашивает голову [M] с помощью [src]."), 1)
				M:r_leg_repair_op_stage = 3.0
				M.broken_bone_r_leg = 0

	else if(user.zone_sel.selecting == "mouth")
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] зашивает рот [M]."), 1)
		M.MOUTHTHREAD = 1

	else if(user.zone_sel.selecting == "head" && M.whore_in_head == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] зашивает рану [M]."), 1)
		M.repair_broken_artery_in_location(user.zone_sel.selecting)
		M.whore_in_head = 0

	else if(user.zone_sel.selecting == "chest" && M.whore_in_chest == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] зашивает рану [M]."), 1)
		M.repair_broken_artery_in_location(user.zone_sel.selecting)
		M.whore_in_chest = 0

	else if(user.zone_sel.selecting == "groin" && M.whore_in_groin == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] зашивает рану [M]."), 1)
		M.repair_broken_artery_in_location(user.zone_sel.selecting)
		M.whore_in_groin = 0

	else if(user.zone_sel.selecting == "right arm" && M.whore_in_r_arm == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] зашивает рану [M]."), 1)
		M.repair_broken_artery_in_location(user.zone_sel.selecting)
		M.whore_in_r_arm = 0

	else if(user.zone_sel.selecting == "left leg" && M.whore_in_l_leg == 1)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] зашивает рану [M]."), 1)
		M.repair_broken_artery_in_location(user.zone_sel.selecting)
		M.whore_in_l_leg = 0

/obj/item/weapon/surgery/bone_replacer/attack(mob/living/carbon/human/M as mob, mob/living/carbon/user as mob)
	if(user.zone_sel.selecting == "head" && M:cranium_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет череп [M] на металлический с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)
	else if(user.zone_sel.selecting == "chest" && M:chest_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет кости [M] на металлические с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)
	else if(user.zone_sel.selecting == "groin" && M:groin_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет кости [M] на металлические с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)
	else if(user.zone_sel.selecting == "left leg" && M:l_leg_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет кости [M] на металлические с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)
	else if(user.zone_sel.selecting == "right leg" && M:r_leg_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет кости [M] на металлические с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)
	else if(user.zone_sel.selecting == "right arm" && M:r_arm_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет кости [M] на металлические с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)
	else if(user.zone_sel.selecting == "left arm" && M:r_arm_repair_op_stage == 1.0)
		for(var/mob/O in viewers(M, null))
			O.show_message(text("\red [user] заменяет кости [M] на металлические с помощью [src]."), 1)
		M.replace_bone_in_location(user.zone_sel.selecting)