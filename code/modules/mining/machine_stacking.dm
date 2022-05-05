/**********************Mineral stacking unit console**************************/

/obj/machinery/mineral/stacking_unit_console
	name = "stacking machine console"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = 0
	anchored = 1
	var/obj/machinery/mineral/stacking_machine/machine = null
	var/machinedir = SOUTHEAST

/obj/machinery/mineral/stacking_unit_console/New()
	..()
	spawn(7)
		src.machine = locate(/obj/machinery/mineral/stacking_machine, get_step(src, machinedir))
		if (machine)
			machine.CONSOLE = src
		else
			qdel(src)

/obj/machinery/mineral/stacking_unit_console/attack_hand(user as mob)

	var/obj/item/stack/sheet/s
	var/dat

	dat += text("<b>Stacking unit console</b><br><br>")

	for(var/O in machine.stack_list)
		s = machine.stack_list[O]
		if(s.amount > 0)
			dat += text("[capitalize(s.name)]: [s.amount] <A href='?src=\ref[src];release=[s.type]'>Release</A><br>")

	dat += text("<br>Stacking: [machine.stack_amt]<br><br>")

	user << browse("[dat]", "window=console_stacking_machine")

	return

/obj/machinery/mineral/stacking_unit_console/Topic(href, href_list)
	if(..())
		return
	usr.set_machine(src)
	src.add_fingerprint(usr)
	if(href_list["release"])
		if(!(text2path(href_list["release"]) in machine.stack_list)) return //someone tried to spawn materials by spoofing hrefs
		var/obj/item/stack/sheet/inp = machine.stack_list[text2path(href_list["release"])]
		var/obj/item/stack/sheet/out = new inp.type()
		out.amount = inp.amount
		inp.amount = 0
		machine.unload_mineral(out)

	src.updateUsrDialog()
	return


/**********************Mineral stacking unit**************************/


/obj/machinery/mineral/stacking_machine
	name = "stacking machine"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "stacker"
	density = 1
	anchored = 1.0
	var/obj/machinery/mineral/stacking_unit_console/CONSOLE
	var/stk_types = list()
	var/stk_amt   = list()
	var/stack_list[0] //Key: Type.  Value: Instance of type.
	var/stack_amt = 50; //ammount to stack before releassing
	input_dir = EAST
	output_dir = WEST

/obj/machinery/mineral/stacking_machine/proc/process_sheet(obj/item/stack/sheet/inp)
	if(!(inp.type in stack_list)) //It's the first of this sheet added
		var/obj/item/stack/sheet/s = new inp.type(src,0)
		s.amount = 0
		stack_list[inp.type] = s
	var/obj/item/stack/sheet/storage = stack_list[inp.type]
	storage.amount += inp.amount //Stack the sheets
	inp.loc = null //Let the old sheet garbage collect
	while(storage.amount > stack_amt) //Get rid of excessive stackage
		var/obj/item/stack/sheet/out = new inp.type()
		out.amount = stack_amt
		unload_mineral(out)
		storage.amount -= stack_amt

/obj/machinery/mineral/stacking_machine/process()
	var/turf/T = get_step(src, input_dir)
	if(T)
		for(var/obj/item/stack/sheet/S in T)
			process_sheet(S)
	if(istype(src, /obj/machinery/mineral/stacking_machine/trash))
		var/obj/machinery/mineral/stacking_machine/trash/TR = src
		var/obj/item/I
		TR.ess_sheet(I)

/obj/machinery/mineral/trash
	name = "stacking machine"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "stacker"
	density = 0
	anchored = 1.0
	input_dir = EAST
	output_dir = WEST

/obj/machinery/mineral/stacking_machine/trash/gold
	density = 0

/obj/machinery/mineral/stacking_machine/trash/glass
	density = 0

/obj/item
	var/iron = 0
	var/gold = 0
	var/glass = 0

/obj/machinery/mineral/stacking_machine/trash/proc/ess_sheet(obj/item/inp)
	if(inp.iron == 1)
		var/obj/item/stack/sheet/metal/M = new(loc)
		var/Y_lol = src.y + 1
		M.amount = rand(0,5)
		M.y = Y_lol
		del(inp)

/obj/machinery/mineral/stacking_machine/trash/gold/ess_sheet(obj/item/inp)
	if(inp.gold == 1)
		var/obj/item/stack/sheet/mineral/gold/G = new(loc)
		var/Y_lol = src.y + 1
		G.amount = rand(0,5)
		G.y = Y_lol
		del(inp)

/obj/machinery/mineral/stacking_machine/trash/glass/ess_sheet(obj/item/inp)
	if(inp.glass == 1)
		var/obj/item/stack/sheet/glass/GL = new(loc)
		var/Y_lol = src.y + 1
		GL.amount = rand(0,5)
		GL.y = Y_lol
		del(inp)

/obj/machinery/mineral/stacking_machine/trash/process()
	var/turf/T = get_step(src, input_dir)
	if(T)
		for(var/obj/item/S in T)
			ess_sheet(S)

/obj/machinery/mineral/stacking_machine/trash/sorting
	icon_state = "unloader"

/obj/machinery/mineral/stacking_machine/trash/sorting/ess_sheet(obj/item/inp)
	if(inp.iron == 1)
		var/X_lol = src.x - 1
		inp.x = X_lol
	else if(inp.gold == 1)
		var/X_lol = src.x - 1
		inp.x = X_lol
	else if(inp.glass == 1)
		var/X_lol = src.x - 1
		inp.x = X_lol
	else
		return

/obj/machinery/mineral/stacking_machine/trash/drill

/obj/machinery/mineral/stacking_machine/trash/drill/ess_sheet(obj/item/stack/sheet/metal/inp)
	var/obj/item/weapon/pickaxe/drill/M = new(loc)
	var/Y_lol = src.y - 1
	M.y = Y_lol
	del(inp)

/obj/machinery/mineral/stacking_machine/trash/drill/ess_sheet(obj/item/stack/sheet/metal/inp)
	var/obj/item/weapon/pickaxe/drill/M = new(loc)
	var/Y_lol = src.y - 1
	M.y = Y_lol
	del(inp)

/obj/machinery/mineral/stacking_machine/trash/gun/ess_sheet(obj/item/stack/sheet/metal/inp)
	var/obj/item/weapon/gun/projectile/revolver/mateba/M = new(loc)
	var/Y_lol = src.y - 1
	M.y = Y_lol
	del(inp)