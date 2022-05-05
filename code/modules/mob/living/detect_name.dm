//#define LP(str) list2params(list(str))

/mob/living/
	var/list/datum/data_name/name_list = list()

/datum/data_name
	var
		name
		name_for

/mob/living/carbon/human/verb/name_for(var/mob/living/carbon/human/H, msg as text)
	var/datum/data_name/D = new()
	set src in oview()
	D.name = H.real_name
	D.name_for = msg
	if(istype(usr,/mob/living/carbon/human))
		H = usr
		H.name_list += D

