/obj/machinery/power/port_gen/pacman/diesel
	name = "Diesel generator"
	icon= 'icons/obj/diesel.dmi'
	var/list/use_reagent = list()
	time_per_sheet = 260
	heating_power = 80000
	power_gen = 50000
	set_temperature = 40
	flags = OPENCONTAINER

/obj/machinery/power/port_gen/pacman/diesel/UseFuel()
/*	var/needed_sheets = 1 / (time_per_sheet * consumption / power_output)
	var/temp = min(needed_sheets, sheet_left)
	needed_sheets -= temp
	sheet_left -= temp
	sheets -= round(needed_sheets)
	needed_sheets -= round(needed_sheets)
	if (sheet_left <= 0 && sheets > 0)
		sheet_left = 1 - needed_sheets
		sheets--*/
	reagents.add_reagent()
	for(var/datum/reagent/G in reagents.reagent_list)
		var/id = reagents.get_master_reagent_id(G)
		for(var/g = 1, g < use_reagent.len, g ++)
			switch(id)
				if("ethanol")
					var/datum/reagent/my_reagent
					my_reagent = G
					if(my_reagent.volume != 0)
						reagents.remove_reagent("ethanol", 1, 0)
						G = my_reagent
				if("cornoil")
					var/datum/reagent/my_reagent
					my_reagent = G
					if(my_reagent.volume != 0)
						reagents.remove_reagent("cornoil", 1, 0)
						G = my_reagent
				if("fuel")
					var/datum/reagent/my_reagent
					my_reagent = G
					if(my_reagent.volume != 0)
						reagents.remove_reagent("fuel", 1, 0)
						G = my_reagent

	var/lower_limit = 56 + power_output * 10
	var/upper_limit = 76 + power_output * 10
	var/bias = 0
	if (power_output > 4)
		upper_limit = 400
		bias = power_output - consumption * (4 - consumption)
	if (heat < lower_limit)
		heat += 4 - consumption
	else
		heat += rand(-7 + bias, 7 + bias)
		if (heat < lower_limit)
			heat = lower_limit
		if (heat > upper_limit)
			heat = upper_limit

	if (heat > 300)
		overheat()
		qdel(src)
	return

/*
obj/machinery/power/port_gen/pacman/diesel/HasFuel()
	for(var/datum/reagent/G in reagents.reagent_list)
		var/id = reagents.get_master_reagent_id(G)
		for(var/g = 1, g < use_reagent.len, g ++)
			switch(id)
				if("ethanol")
					var/datum/reagent/my_reagent
					my_reagent = G
					if(my_reagent.volume != 0)
						reagents.remove_reagent("ethanol", 1, 0)
						G = my_reagent
						if(G.volume != 0)
							return 1
						else
							return 0


				else if("cornoil")
					var/datum/reagent/my_reagent
					my_reagent = G
					if(my_reagent.volume != 0)
						reagents.remove_reagent("cornoil", 1, 0)
						G = my_reagent
						if(G.volume != 0)
							return 1
						else
							return 0

				else if("fuel")
					var/datum/reagent/my_reagent
					my_reagent = G
					if(my_reagent.volume != 0)
						reagents.remove_reagent("fuel", 1, 0)
						G = my_reagent
						if(G.volume != 0)
							return 1
						else
							return 0
*/

/*
	if(sheets >= 1 / (time_per_sheet / power_output) - sheet_left)
		return 1
	return 0
*/