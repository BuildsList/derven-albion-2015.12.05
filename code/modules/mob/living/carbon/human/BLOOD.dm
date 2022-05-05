/mob/living/carbon/human
	New()
		..()
		reagents.add_reagent("blood", 350)

	proc/check_blood()
		for(var/datum/reagent/A in reagents.reagent_list)
			var/datum/reagent/R = A
			if(R.id == "blood")
				if(R.volume < 100 && R.volume > 50)
					src << "/red Вы чувствуете головокружение"
				if(R.volume < 50)
					death()