// HIVE MIND UPLOAD/DOWNLOAD DNA
GLOBAL_LIST_EMPTY(hivemind_bank)

/datum/action/changeling/hivemind_upload
	name = "Hive Channel DNA"
	desc = "Allows us to channel DNA in the airwaves to allow other changelings to absorb it. Costs 10 chemicals."
	button_icon_state = "hivemind_channel"
	chemical_cost = 10
	dna_cost = -1

/datum/action/changeling/hivemind_upload/sting_action(mob/living/user)
	if (HAS_TRAIT(user, CHANGELING_HIVEMIND_MUTE))
		to_chat(user, "<span class='warning'>The poison in the air hinders our ability to interact with the hivemind.</span>")
		return
	..()
	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	var/list/names = list()
	for(var/datum/changelingprofile/prof in changeling.stored_profiles)
		if(!(prof in GLOB.hivemind_bank))
			names += prof.name

	if(names.len <= 0)
		to_chat(user, "<span class='warning'>The airwaves already have all of our DNA!</span>")
		return

	var/chosen_name = input("Select a DNA to channel: ", "Channel DNA", null) as null|anything in sort_list(names)
	if(!chosen_name)
		return

	var/datum/changelingprofile/chosen_dna = changeling.get_dna(chosen_name)
	if(!chosen_dna)
		return

	var/datum/changelingprofile/uploaded_dna = new chosen_dna.type
	chosen_dna.copy_profile(uploaded_dna)
	GLOB.hivemind_bank += uploaded_dna
	to_chat(user, "<span class='notice'>We channel the DNA of [chosen_name] to the air.</span>")
	return TRUE

/datum/action/changeling/hivemind_download
	name = "Hive Absorb DNA"
	desc = "Allows us to absorb DNA that has been channeled to the airwaves. Does not count towards absorb objectives. Costs 10 chemicals."
	button_icon_state = "hive_absorb"
	chemical_cost = 10
	dna_cost = -1

/datum/action/changeling/hivemind_download/can_sting(mob/living/carbon/user)
	if(!..())
		return
	if (HAS_TRAIT(user, CHANGELING_HIVEMIND_MUTE))
		to_chat(user, "<span class='warning'>The poison in the air hinders our ability to interact with the hivemind.</span>")
		return
	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	var/datum/changelingprofile/first_prof = changeling.stored_profiles[1]
	if(first_prof.name == user.real_name)//If our current DNA is the stalest, we gotta ditch it.
		to_chat(user, "<span class='warning'>We have reached our capacity to store genetic information! We must transform before absorbing more.</span>")
		return
	return 1

/datum/action/changeling/hivemind_download/sting_action(mob/user)
	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	var/list/names = list()
	for(var/datum/changelingprofile/prof in GLOB.hivemind_bank)
		if(!(prof in changeling.stored_profiles))
			names[prof.name] = prof

	if(names.len <= 0)
		to_chat(user, "<span class='warning'>There's no new DNA to absorb from the air!</span>")
		return

	var/S = input("Select a DNA absorb from the air: ", "Absorb DNA", null) as null|anything in sort_list(names)
	if(!S)
		return
	var/datum/changelingprofile/chosen_prof = names[S]
	if(!chosen_prof)
		return
	..()
	var/datum/changelingprofile/downloaded_prof = new chosen_prof.type
	chosen_prof.copy_profile(downloaded_prof)
	changeling.add_profile(downloaded_prof)
	to_chat(user, "<span class='notice'>We absorb the DNA of [S] from the air.</span>")
	return TRUE
