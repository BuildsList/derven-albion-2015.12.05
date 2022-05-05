/mob/living/carbon/human
	var/list/datum/bone/bones = list()
	var/list/datum/organ/interna_l_organs = list()
	var/list/implants = list()
	var/list/artery = list()
	//var/list/other = list(legs,arms,groin,carotid_artery)
	var
		head_enable_module = 0
		chest_enable_module = 0
		l_arm_enable_module = 0
		r_arm_enable_module = 0
		r_leg_enable_module = 0
		l_leg_enable_module = 0
		PAIN
		sleepity = 0

/mob/living/carbon
	var
		broken_bone_head = 0
		broken_bone_chest = 0
		broken_bone_r_leg = 0
		broken_bone_l_leg = 0
		broken_bone_r_arm = 0
		broken_bone_l_arm = 0
		broken_bone_groin = 0
		whore_in_head = 0
		whore_in_groin = 0
		whore_in_r_arm = 0
		whore_in_l_leg = 0
		whore_in_chest = 0

/datum/bone
	var/into_human_location
	var/broken = 0
	var/name
	var/broke_effect = "pain_explos"
	var/destruction = 0
	var/metal = 0

/datum/artery_and_veins
	var/into_human_location
	var/name
	var/whore = 0

/datum/organ
	var/into_human_location
	var/damage_level = 0
	var/on_damage_effect

/datum/bone/cranium
	into_human_location = "head"
	name = "cranium"
	broke_effect = "sleeping"

/datum/bone/costae
	into_human_location = "chest"
	name = "costae"

/datum/bone/sternum
	into_human_location = "chest"
	name = "sternum"

/datum/bone/vertebrae
	into_human_location = "chest"
	name = "vertebrae"
	broke_effect = "paralysing"

/datum/bone/r_scapula
	into_human_location = "right arm"
	name = "scapula"
	broke_effect = "r_arm_broke"

/datum/bone/r_clavicula
	into_human_location = "right arm"
	name = "clavicula"
	broke_effect = "r_arm_broke"

/datum/bone/r_humerus
	into_human_location = "right arm"
	name = "humerus"
	broke_effect = "r_arm_broke"

/datum/bone/r_ulna
	into_human_location = "right arm"
	name = "ulna"
	broke_effect = "r_arm_broke"

/datum/bone/r_radius
	into_human_location = "right arm"
	name = "radius"
	broke_effect = "r_arm_broke"

/datum/bone/r_manus
	into_human_location = "right arm"
	name = "manus"
	broke_effect = "r_arm_broke"

/datum/bone/r_ossa_digitorum
	into_human_location = "right arm"
	name = "ossa_digitorum"
	broke_effect = "r_arm_broke"

/datum/bone/l_scapula
	into_human_location = "left arm"
	name = "scapula"
	broke_effect = "l_arm_broke"

/datum/bone/l_clavicula
	into_human_location = "left arm"
	name = "clavicula"
	broke_effect = "l_arm_broke"

/datum/bone/l_humerus
	into_human_location = "left arm"
	name = "humerus"
	broke_effect = "l_arm_broke"

/datum/bone/l_ulna
	into_human_location = "left arm"
	name = "ulna"
	broke_effect = "l_arm_broke"

/datum/bone/l_radius
	into_human_location = "left arm"
	name = "radius"
	broke_effect = "l_arm_broke"

/datum/bone/l_manus
	into_human_location = "left arm"
	name = "manus"
	broke_effect = "l_arm_broke"

/datum/bone/l_ossa_digitorum
	into_human_location = "left arm"
	name = "ossa_digitorum"
	broke_effect = "l_arm_broke"

/datum/bone/os_coxa
	into_human_location = "groin"
	name = "os_coxa"

/datum/bone/r_femur
	into_human_location = "right leg"
	name = "femur"
	broke_effect = "r_leg_broke"

/datum/bone/r_tibia
	into_human_location = "right leg"
	name = "tibia"
	broke_effect = "r_leg_broke"

/datum/bone/r_fibula
	into_human_location = "right leg"
	name = "fibula"
	broke_effect = "r_leg_broke"

/datum/bone/r_pedis
	into_human_location = "right leg"
	name = "pedis"
	broke_effect = "r_leg_broke"

/datum/bone/r_foot_ossa_digitorum
	into_human_location = "right leg"
	name = "foot_ossa_digitorum"
	broke_effect = "r_leg_broke"

/datum/bone/l_femur
	into_human_location = "left leg"
	name = "femur"
	broke_effect = "l_leg_broke"

/datum/bone/l_tibia
	into_human_location = "left leg"
	name = "tibia"
	broke_effect = "l_leg_broke"

/datum/bone/l_fibula
	into_human_location = "left leg"
	name = "fibula"
	broke_effect = "l_leg_broke"

/datum/bone/l_pedis
	into_human_location = "left leg"
	name = "pedis"
	broke_effect = "l_leg_broke"

/datum/bone/l_foot_ossa_digitorum
	into_human_location = "left leg"
	name = "foot_ossa_digitorum"
	broke_effect = "l_leg_broke"

/datum/artery_and_veins/l_leg
	into_human_location = "left leg"
	whore = 0

/datum/artery_and_veins/r_arm
	into_human_location = "right arm"
	whore = 0

/datum/artery_and_veins/carotid_artery
	into_human_location = "head"
	whore = 0

/datum/artery_and_veins/groin_artery
	into_human_location = "groin"
	whore = 0

/datum/organ/heart
	into_human_location = "chest"
	damage_level = 0

/datum/organ/lungs
	into_human_location = "chest"
	damage_level = 0

/datum/organ/liver
	into_human_location = "chest"
	damage_level = 0

/datum/organ/kidneys
	into_human_location = "chest"
	damage_level = 0

/mob
	var/cranium = new/datum/bone/cranium
	var/sternum = new/datum/bone/sternum
	var/costae = new/datum/bone/costae
	var/vertebrae= new/datum/bone/vertebrae
	var/r_scapula = new/datum/bone/r_scapula
	var/l_scapula = new/datum/bone/l_scapula
	var/r_humerus = new/datum/bone/r_humerus
	var/r_ulna = new/datum/bone/r_ulna
	var/r_radius = new/datum/bone/r_radius
	var/r_manus = new/datum/bone/r_manus
	var/r_ossa_digitorum = new/datum/bone/r_ossa_digitorum
	var/os_coxa = new/datum/bone/os_coxa
	var/r_tibia = new/datum/bone/r_tibia
	var/r_fibula = new/datum/bone/r_fibula
	var/r_pedis = new/datum/bone/r_pedis
	var/r_foot_ossa_digitorum = new/datum/bone/r_foot_ossa_digitorum
	var/l_humerus = new/datum/bone/l_humerus
	var/l_ulna = new/datum/bone/l_ulna
	var/l_radius = new/datum/bone/l_radius
	var/l_manus = new/datum/bone/l_manus
	var/l_ossa_digitorum = new/datum/bone/l_ossa_digitorum
	var/l_tibia = new/datum/bone/l_tibia
	var/l_fibula = new/datum/bone/l_fibula
	var/l_pedis = new/datum/bone/l_pedis
	var/l_foot_ossa_digitorum = new/datum/bone/l_foot_ossa_digitorum

	var/legs = new/datum/artery_and_veins/l_leg
	var/arms = new/datum/artery_and_veins/r_arm
	var/carotid_artery = new/datum/artery_and_veins/carotid_artery
	var/groin = new/datum/artery_and_veins/groin_artery
	var/heart = new/datum/organ/heart
	var/lungs = new/datum/organ/lungs
	var/liver = new/datum/organ/liver
	var/kidneys = new/datum/organ/kidneys

mob/living/carbon/human/proc/ADD_ORGANS()
	bones += cranium
	bones += sternum
	bones += costae
	bones += vertebrae
	bones += r_scapula
	bones += r_humerus
	bones += r_ulna
	bones += r_radius
	bones += r_ossa_digitorum
	bones += os_coxa
	bones += r_tibia
	bones += r_fibula
	bones += r_pedis
	bones += r_foot_ossa_digitorum
	bones += l_scapula
	bones += l_humerus
	bones += l_ulna
	bones += l_radius
	bones += l_ossa_digitorum
	bones += l_tibia
	bones += l_fibula
	bones += l_pedis
	bones += l_foot_ossa_digitorum
	interna_l_organs += heart
	interna_l_organs += lungs
	interna_l_organs += liver
	interna_l_organs += kidneys
	artery += legs
	artery += arms
	artery += carotid_artery
	artery += groin

/mob/living/carbon/human/proc/select_bone(var/bone_name)
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		if(bone_name == B.name)
			return B

/mob/living/carbon/human/proc/broken_this_bone(var/bone_name)
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		if(bone_name == B.name)
			B.broken = 1
			bones[g] = B

/mob/living/carbon/human/proc/into_human_location(var/bone_name)
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		if(bone_name == B.name)
			return B.into_human_location

/mob/living/carbon/human/proc/broken_random_bone_into_location(var/location)
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		var/chance = 0
		if(location == B.into_human_location)
			chance = pick(0,1,2,1)
			if(chance == 1 && B.metal != 1)
				B.broken = 1
				bones[g] = B
				return()

/mob/living/carbon/human/proc/damage_random_organ_into_location(var/location)
	for(var/g = 1, g < bones.len, g++)
		var/datum/organ/O = interna_l_organs[g]
		var/chance = 0
		if(location == O.into_human_location)
			chance = pick(0,1,2,3,4,5,6,7)
			if(chance == 1)
				if(O.damage_level == 1)
					O.damage_level = 2
					interna_l_organs[g] = O
				else if(O.damage_level == 0)
					O.damage_level = 1
					interna_l_organs[g] = O
				interna_l_organs[g] = O

/mob/living/carbon/human/proc/damage_random_artery_into_location(var/location)
	for(var/g = 1, g < artery.len, g++)
		var/datum/artery_and_veins/A = artery[g]
		var/chance = 0
		if(location == A.into_human_location)
			chance = pick(0,1)
			if(chance == 1)
				A.whore = 1

/mob/living/carbon/human/proc/check_bones()
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		var/pain_message = rand(0,100)
		if(B.broken == 1)
			spawn(80)
			if(pain_message < 6)
				src << "\red У вас сломана кость!"
			if(B.broke_effect == "pain_explos")
				spawn(50)
				switch(B.into_human_location)
					if("chest")
						PAIN = "туловища"
					if("head")
						PAIN = "головы"
					if("groin")
						PAIN = "паха"
					if("right arm")
						PAIN = "правой руки"
					if("left arm")
						PAIN = "левой руки"
					if("right leg")
						PAIN = "правой ноги"
					if("left leg")
						PAIN = "левой ноги"
				if(pain_message < 6)
					src << "\red Вы чувствуете резкую боль в области [PAIN]!"
			if(B.broke_effect == "sleeping" && sleepity == 0)
				src << "\red Похоже вас вырубили!"
				sleeping = 1
				sleepity = 1
			if(B.broke_effect == "sleeping" && sleepity == 1)
				spawn(50)
				if(pain_message < 6)
					src << "\red У вас очень сильно болит голова!"
			if(B.broke_effect == "paralysing")
				resting = 1
				if(pain_message < 6)
					src << "\red Похоже вы парализованы!"
			if(B.broke_effect == "r_arm_broke")
				//equip_to_slot_or_del(new /obj/item/weapon/block(src), slot_r_hand)
				spawn(50)
				if(pain_message < 6)
					drop_item()
					src << "\red У вас очень сильно болит рука!"
					src << "\red Взаимодействие с предметами ограничено!"
			if(B.broke_effect == "l_arm_broke")
				//equip_to_slot_or_del(new /obj/item/weapon/block(src), slot_l_hand)
				spawn(50)
				if(pain_message < 6)
					drop_item()
					src << "\red У вас очень сильно болит рука!"
			if(B.broke_effect == "l_leg_broke")
				if(pain_message < 6)
					src << "\red У вас очень сильно болит нога!"
				var/what = rand(0,100)
				if(what < 50)
					resting = 1
				if(what > 50)
					resting = 0
			if(B.broke_effect == "r_leg_broke")
				if(pain_message < 6)
					src << "\red У вас очень сильно болит нога!"
				var/what = rand(0,100)
				if(what < 50)
					resting = 1
				if(what > 50)
					resting = 0

/mob/living/carbon/human/proc/check_artery_and_veins()
	var/pain_message
	//var/blood_volume
	var/locat
	for(var/g = 1, g < artery.len, g++)
		var/datum/artery_and_veins/A = artery[g]
		if(A.whore == 1)
			pain_message = rand(0,100)
			if(pain_message < 6)
				src << "\red Вы истекаете кровью!"
				switch(A.into_human_location)
					if("right arm")
						locat = "правой руки"
					if("left leg")
						locat = "левой ноги"
					if("groin")
						locat = "паха"
					if("head")
						locat = "шеи"
				src << "\red Кровотечение в области [locat]!"
				new /obj/effect/decal/cleanable/blood(src.loc)
				adjustBruteLoss(10)
			//blood_volume = 1
			//spawn(60) reagents.remove_reagent("blood", blood_volume, 0)

/mob/living/carbon/human/proc/check_broken_bones()
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		if(B.broken == 1)
			switch(B.into_human_location)
				if("head")
					broken_bone_head = 1
				if("chest")
					broken_bone_chest = 1
				if("groin")
					broken_bone_groin = 1
				if("right arm")
					broken_bone_r_arm = 1
				if("left arm")
					broken_bone_l_arm = 1
				if("right leg")
					broken_bone_r_leg = 1
				if("left leg")
					broken_bone_l_leg = 1

/mob/living/carbon/human/proc/repair_broken_bones_in_location(var/location_epta)
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		if(B.broken == 1)
			if(B.into_human_location == location_epta)
				B.broken = 0
				bones[g] = B

/mob/living/carbon/human/proc/repair_broken_artery_in_location(var/location_epta)
	for(var/g = 1, g < artery.len, g++)
		var/datum/artery_and_veins/A = artery[g]
		if(A.whore == 1)
			if(A.into_human_location == location_epta)
				A.whore = 0
				artery[g] = A

/mob/living/carbon/human/proc/check_broken_artery()
	for(var/g = 1, g < artery.len, g++)
		var/datum/artery_and_veins/A = artery[g]
		if(A.whore == 1)
			switch(A.into_human_location)
				if("head")
					whore_in_head = 1
				if("groin")
					whore_in_groin = 1
				if("right arm")
					whore_in_r_arm = 1
				if("left leg")
					whore_in_l_leg = 1
				if("chest")
					whore_in_chest = 1

/mob/living/carbon/human/proc/replace_bone_in_location(var/location_epta)
	for(var/g = 1, g < bones.len, g++)
		var/datum/bone/B = bones[g]
		if(B.broken == 1)
			if(B.into_human_location == location_epta)
				B.broken = 0
				B.metal = 1
				bones[g] = B

/mob/living/carbon/human/proc/replace_all_bones()
	for(var/datum/bone/B in bones)
		B.metal = 1
		B.broken = 0