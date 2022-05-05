

/mob/living/carbon/human
	var/list/datum/mutation/my_mutations = list()
	var/clownleg = 0
	var/crab = 0


/mob/living/carbon
	var/silence = 0

/datum/mutation
	var/name
	var/active
	var/on_human = 0

//mutations

	monkeyhead
		name = "monkeyhead"
		active = 0

	human_to_monkey
		name = "htm"
		active = 0

	clownstep
		name = "clownstep"
		active = 0

	clownface
		name = "clownface"
		active = 0

	noslip
		name = "noslip"
		active = 0

	human_to_spider
		name = "human_to_spider"
		active = 0

	invisible
		name = "invisible"
		active = 0

	temperature_ignore
		name = "temperature"
		active = 0

	thermal
		name = "thermal"
		active = 0

	human_on_fire
		name = "onfire"
		active = 0

	badear
		name = "badear"
		active = 0

	badeye
		name = "badeye"
		active = 0

	no_spacesuit
		name = "nospacesuit"
		active = 0

	photo
		name = "photo"
		active = 0

	mucus
		name = "mucus"
		active = 0

	slippy
		name = "slippy"
		active = 0

	crab_direction
		name = "crab_direction"
		active = 0

	claw
		name = "claw"
		active = 0

	OHFUCK
		name = "OHFUCK"
		active = 0

	see_ghosts
		name = "seeghosts"
		active = 0

	ash
		name = "ash"
		active = 0

	nowall
		name = "nowall"
		active = 0

	long_ears
		name = "long_ears"
		active = 0

	range
		name = "range"
		active = 0

	gibyourself
		name = "gibyourself"
		active = 0

	fire
		name = "fire"
		active = 0

	oh_my_brain
		name = "ohmybrain"
		active = 0

	enjoy_the_silence
		name = "silence"
		active = 0

	metal_bones
		name = "metal"
		active = 0

	human_to_robot
		name = "human_to_robot"
		active = 0

	golden
		name = "golden"
		active = 0

/mob/living/carbon/human/proc/ADD_MUT()

	var/monkeyhead = new /datum/mutation/monkeyhead
	var/human_to_monkey = new /datum/mutation/human_to_monkey
	var/clownstep = new /datum/mutation/clownstep
	var/clownface = new /datum/mutation/clownface
	var/noslip = new /datum/mutation/noslip
//	var/human_to_spider = new /datum/mutation/human_to_spider
	var/invisble = new /datum/mutation/invisible
//	var/temperature_ignore = new /datum/mutation/temperature_ignore
	var/thermal = new /datum/mutation/thermal
	var/human_on_fire = new /datum/mutation/human_on_fire
	var/badear = new /datum/mutation/badear
	var/badeye = new /datum/mutation/badeye
	//var/no_spacesuit = new /datum/mutation/no_spacesuit
	var/photo = new /datum/mutation/photo
	var/mucus = new /datum/mutation/mucus
	var/slippy = new /datum/mutation/slippy
	var/crab_direction = new /datum/mutation/crab_direction
	var/claw = new /datum/mutation/claw
	var/OHFUCK = new /datum/mutation/OHFUCK
	var/see_ghosts = new /datum/mutation/see_ghosts
	var/ash = new /datum/mutation/ash
	var/nowall = new /datum/mutation/nowall
	var/long_ears = new /datum/mutation/long_ears
	var/range = new /datum/mutation/range
	var/gibyourself = new /datum/mutation/gibyourself
	var/fire = new /datum/mutation/fire
	var/oh_my_brain = new /datum/mutation/oh_my_brain
	var/enjoy_the_silence = new /datum/mutation/enjoy_the_silence
	var/metal_bones = new /datum/mutation/metal_bones
	var/human_to_robot = new /datum/mutation/human_to_robot
	var/golden = new /datum/mutation/golden


	my_mutations += monkeyhead
	my_mutations += human_to_monkey
	my_mutations += clownstep
	my_mutations += clownface
	my_mutations += noslip
	//my_mutations += human_to_spider	// ЧТО-ТО ЛЕНЬ
	my_mutations += invisble
	//my_mutations += temperature_ignore  // ЧТО-ТО ЛЕНЬ
	my_mutations += thermal
	my_mutations += human_on_fire
	my_mutations += badear
	my_mutations += badeye
	//my_mutations += no_spacesuit	// ЧТО-ТО ЛЕНЬ
	my_mutations += photo
	my_mutations += mucus
	my_mutations += slippy
	my_mutations += crab_direction
	my_mutations += claw
	my_mutations += OHFUCK
	my_mutations += see_ghosts
	my_mutations += ash
	my_mutations += nowall
	my_mutations += long_ears
	my_mutations += range
	my_mutations += gibyourself
	my_mutations += fire
	my_mutations += oh_my_brain
	my_mutations += enjoy_the_silence
	my_mutations += metal_bones
	my_mutations += human_to_robot
	my_mutations += golden

/mob/living/carbon/human/proc/check_my_mutation()
	for(var/datum/mutation/MUT in my_mutations)
		if(MUT.active == 1 && MUT.on_human == 1)
			switch(MUT.name)
				if("monkeyhead")
					overlays += icon('icons/mob/head.dmi',"monkey")
					MUT.active = 0
					src << "\blue Бананы!"
				if("htm")
					monkeyize()
					MUT.active = 0
				if("clownstep")
					clownleg = 1
					src << "\blue Вот дерьмо!"
				if("clownface")
					overlays += icon('icons/mob/mask.dmi',"clown")
					MUT.active = 0
					src << "\blue Ha-ha-ha! HOOOONK!"
				if("noslip")
					src << "\blue Вы чувствуете себя более ловким"
					flags = NOSLIP
					MUT.active = 0
				if("invisible")
					layer = 2
					MUT.active = 0
					src << "\blue Куда пропали мои руки!"
				if("thermal")
					see_invisible = 2
					MUT.active = 0
					src << "\blue Похоже теперь я вижу больше!"
				if("onfire")
					var/turf/T = src.loc
					if(T.luminosity > 0)
						adjustFireLoss(2)
						src << "\blue Уберите этот сраный яркий свет!"
				if("crab_direction")
					crab = 1
					MUT.active = 0
					src << "\blue Bochkom! Bochkom!"
				if("ohmybrain")
					adjustBrainLoss(500)
					MUT.active = 0
					src << "\blue Вы чувствуете невиданный прилив мудрости!"
				if("silence")
					silence = 1
					MUT.active = 0
					src << "\blue Молчание - золото."
				if("human_to_robot")
					Robotize()
					MUT.active = 0
					src << "\blue Бип."
				if("golden")
					luminosity = 2
					MUT.active = 0
					src << "\blue Кажется мое тело испускает свет."
				if("gibyourself")
					MUT.active = 0
					gib()
				if("metal")
					replace_all_bones()
					MUT.active = 0
					src << "\blue Мои кости стали намного прочнее!."

/mob/living/carbon/human
	Move()
		..()
		if(clownleg == 1)
			var/chance = rand(0,100)
			if(chance < 4)
				slip(4, 2)
		if(crab == 1)
			if(dir == 1)
				dir = 4
			if(dir == 2)
				dir = 8
			if(dir == 8)
				dir = 2
			if(dir == 4)
				dir = 1

/mob/living/carbon/human/proc/activate_mutation(var/name_mut)
	for(var/datum/mutation/M in my_mutations)
		if(M.name == name_mut)
			if(M.active == 1)
				return
			else
				M.active = 1
				M.on_human = 1