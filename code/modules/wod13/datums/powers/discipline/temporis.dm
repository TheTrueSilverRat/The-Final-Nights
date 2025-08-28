/datum/discipline/temporis
	name = "Temporis"
	desc = "Temporis is a Discipline unique to the True Brujah. Supposedly a refinement of Celerity, Temporis grants the Cainite the ability to manipulate the flow of time itself."
	icon_state = "temporis"
	clan_restricted = TRUE
	power_type = /datum/discipline_power/temporis

/datum/discipline_power/temporis
	name = "Temporis power name"
	desc = "Temporis power description"

	activate_sound = 'code/modules/wod13/sounds/temporis.ogg'

/datum/discipline_power/temporis/proc/celerity_explode(datum/source, datum/discipline_power/power, atom/target)
	SIGNAL_HANDLER

	if (!istype(power, /datum/discipline_power/celerity))
		return

	to_chat(owner, "<span class='userdanger'>You try to use Celerity, but your active Temporis causes your body to wrench itself apart!</span>")
	INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "scream")
	addtimer(CALLBACK(owner, TYPE_PROC_REF(/mob/living/carbon/human, gib)), 3 SECONDS)

	return POWER_CANCEL_ACTIVATION

//HOURGLASS OF THE MIND
/datum/discipline_power/temporis/hourglass_of_the_mind
	name = "Hourglass of the Mind"
	desc = "Gain a perfect sense of time. Know exactly when you are."

	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	vitae_cost = 0

/datum/discipline_power/temporis/hourglass_of_the_mind/activate()
	. = ..()
	to_chat(owner, "<b>[SScity_time.timeofnight]</b>")

//RECURRING CONTEMPLATION
/datum/discipline_power/temporis/recurring_contemplation
	name = "Recurring Contemplation"
	desc = "Trap your target into repeating the same set of actions."

	level = 2
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE
	target_type = TARGET_LIVING
	range = 7

	hostile = TRUE

	cooldown_length = 15 SECONDS

/datum/discipline_power/temporis/recurring_contemplation/activate(mob/living/target)
	. = ..()
	target.AddComponent(/datum/component/dejavu, rewinds = 4, interval = 2 SECONDS)

//LEADEN MOMENT
/datum/discipline_power/temporis/leaden_moment
	name = "Leaden Moment"
	desc = "Slow time around your opponent, reducing their speed."

	level = 3
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE
	target_type = TARGET_LIVING
	range = 7

	hostile = TRUE

	multi_activate = TRUE
	duration_length = 15 SECONDS
	cooldown_length = 15 SECONDS

/datum/discipline_power/temporis/leaden_moment/activate(mob/living/target)
	. = ..()
	to_chat(target, "<span class='userdanger'><b>Slow down.</b></span>")
	target.add_movespeed_modifier(/datum/movespeed_modifier/temporis)

/datum/discipline_power/temporis/leaden_moment/deactivate(mob/living/target)
	. = ..()
	target.remove_movespeed_modifier(/datum/movespeed_modifier/temporis)

/datum/movespeed_modifier/temporis
	multiplicative_slowdown = 7.5

//PATIENCE OF THE NORNS
/datum/discipline_power/temporis/cowalker
	name = "Cowalker"
	desc = "Be in multiple places at once, creating several false images."

	level = 4
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE | DISC_CHECK_DIRECT_SEE
	target_type = TARGET_TURF
	range = 14
	activate_sound = null
	violates_masquerade = TRUE

	cooldown_length = 2 SECONDS

/datum/discipline_power/temporis/cowalker/can_activate(turf/open/target)
	. = ..()

	var/turf/T = get_turf(target)
	for(var/mob/living/L in T)
		if(L.anchored || L.mob_size > MOB_SIZE_TINY && L.density)
			if(owner)
				to_chat(owner, span_warning("There's someone on that spot!!") )
			return FALSE
	if(T.is_blocked_turf())
		if(owner)
			to_chat(owner, span_warning("There's a wall on that spot!!") )
		return FALSE

	for(var/obj/structure/sus in T)
		if(sus.density)
			if(owner)
				to_chat(owner, span_warning("There's a structure blocking our path!!") )
			return FALSE


	return .

/datum/discipline_power/temporis/cowalker/activate(turf/open/target)
	. = ..()
	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(celerity_explode))
	temporis_visual(get_turf(owner))


	owner.forceMove(target)

	var/list/available_turfs = list()
	for(var/turf/open/O in oview(7, owner))
		if(O)
			available_turfs += O
	var/turf/other_visual = pick(available_turfs)
	temporis_visual(other_visual)


	temporis_visual(target)
	playsound(get_turf(owner), 'code/modules/wod13/sounds/temporis.ogg', 50, TRUE)

/datum/discipline_power/temporis/cowalker/proc/temporis_visual(turf/source)

	spawn()
		var/obj/effect/cowalker/temporis_visual = new(source)
		temporis_visual.name = owner.name
		temporis_visual.appearance = owner.appearance
		temporis_visual.dir = owner.dir
		animate(temporis_visual, pixel_x = rand(-32,32), pixel_y = rand(-32,32), alpha = 155, time = 2.5 SECONDS)

/obj/effect/temporis
	name = "Za Warudo"
	desc = "..."
	anchored = 1

/obj/effect/temporis/Initialize()
	. = ..()
	spawn(0.5 SECONDS)
		qdel(src)

/obj/effect/cowalker //Specifically used to allow for longer time lasting
	name = "Now You See Me"
	desc = "..."
	anchored = 1

/obj/effect/cowalker/Initialize()
	. = ..()
	spawn(2.5 SECONDS)
		qdel(src)

//CLOTHO'S GIFT
/datum/discipline_power/temporis/clothos_gift
	name = "Clotho's Gift"
	desc = "Accelerate yourself through time and magnify your speed."

	level = 5
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE
	vitae_cost = 3

	violates_masquerade = TRUE

	cancelable = TRUE
	duration_length = 10 SECONDS
	cooldown_length = 15 SECONDS

/datum/discipline_power/temporis/clothos_gift/activate()
	. = ..()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/temporis5)
	owner.next_move_modifier *= 0.25
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(temporis_visual))
	RegisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION, PROC_REF(celerity_explode))

/datum/discipline_power/temporis/clothos_gift/deactivate()
	. = ..()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/temporis5)
	owner.next_move_modifier /= 0.25
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(owner, COMSIG_POWER_PRE_ACTIVATION)

/datum/discipline_power/temporis/clothos_gift/proc/temporis_visual(datum/discipline_power/temporis/source, atom/newloc, dir)
	SIGNAL_HANDLER

	spawn()
		var/obj/effect/temporis/temporis_visual = new(owner.loc)
		temporis_visual.name = owner.name
		temporis_visual.appearance = owner.appearance
		temporis_visual.dir = owner.dir
		animate(temporis_visual, pixel_x = rand(-32,32), pixel_y = rand(-32,32), alpha = 155, time = 0.5 SECONDS)
		if(owner.CheckEyewitness(owner, owner, 7, FALSE))
			owner.AdjustMasquerade(-1)

/datum/movespeed_modifier/temporis5
	multiplicative_slowdown = -2.5
