/datum/round_event_control/blob
	name = "Blob"
	typepath = /datum/round_event/blob
	max_occurrences = 1
	weight = 5

/datum/round_event/blob
	announceWhen	= 12
	endWhen			= 120

	var/obj/effect/blob/core/Blob
	var/overmind


/datum/round_event/blob/announce()
	priority_announce("Confirmed outbreak of level 5 biohazard aboard [station_name()]. All personnel must contain the outbreak.", "Biohazard Alert", 'sound/AI/outbreak5.ogg')


/datum/round_event/blob/start()
	var/turf/T = pick(blobstart)
	if(!T)
		return kill()
	if(overmind)
		Blob = new /obj/effect/blob/core(T, 200)
	else
		Blob = new /obj/effect/blob/node/minicore(T, 200)
	for(var/i = 1; i < rand(3, 6), i++)
		Blob.process()


/datum/round_event/blob/tick()
	if(!Blob)
		kill()
		return
	if(IsMultiple(activeFor, 3))
		Blob.process()

/datum/round_event_control/blob/overmind
	name = "Overmind Blob"
	typepath = /datum/round_event/blob/overmind
	weight = 5
	earliest_start = 48000 // 1 hour 20 minutes

/datum/round_event/blob/overmind
	overmind = 1
