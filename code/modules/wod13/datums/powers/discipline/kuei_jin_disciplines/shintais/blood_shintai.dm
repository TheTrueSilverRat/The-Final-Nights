/datum/discipline/kj_discipline/blood_shintai
	name = "Blood Shintai"
	desc = "Master the flow of your blood to greater heights in imitation of water"
	icon_state = "blood"
	power_type = /datum/discipline_power/kj_discipline_power/blood_shintai
	discipline_type = "Shintai"
	yin_cost = 1


/datum/discipline_power/kj_discipline_power/blood_shintai
	name = "Blood Shintai power name"
	desc = "Blood Shintai power description"

	yin_cost = 1

	activate_sound = 'code/modules/wod13/sounds/bloodshintai_activate.ogg'

	check_flags = DISC_CHECK_CONSCIOUS
	multi_activate = TRUE


/datum/movespeed_modifier/blood_fat
	multiplicative_slowdown = 1

/datum/movespeed_modifier/necroing
	multiplicative_slowdown = 2

/datum/movespeed_modifier/wall_passing
	multiplicative_slowdown = 5

/datum/movespeed_modifier/blood_slim
	multiplicative_slowdown = -0.5

/obj/item/reagent_containers/spray/pepper/kuei_jin
	stream_mode = 1
	stream_range = 5
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/consumable/condensedcapsaicin = 50, /datum/reagent/blood = 20)

/mob/living/simple_animal/hostile/bloodcrawler/kuei_jin
	name = "blood splatter"
	desc = "Just a moving blood splatter on the floor..."
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	icon_living = "floor1"
	speed = 5
	maxHealth = 100
	health = 100
	melee_damage_lower = 1
	melee_damage_upper = 1
	a_intent = INTENT_HELP
	attack_verb_continuous = "splashes"
	attack_verb_simple = "splash"

/mob/living/simple_animal/hostile/bloodcrawler/kuei_jin/Initialize()
	. = ..()
	icon_state = "floor[rand(1, 7)]"
	icon_living = "floor[rand(1, 7)]"

/mob/living/simple_animal/hostile/bloodcrawler/kuei_jin/Crossed(atom/movable/O)
	. = ..()
	if(ishuman(O))
		var/mob/living/carbon/C = O
		to_chat(C, "<span class='notice'>You slipped[ O ? " on the [O.name]" : ""]!</span>")
		playsound(C.loc, 'sound/misc/slip.ogg', 50, TRUE)

		SEND_SIGNAL(C, COMSIG_ON_CARBON_SLIP)
		for(var/obj/item/I in C.held_items)
			C.accident(I)

		C.moving_diagonally = 0 //If this was part of diagonal move slipping will stop it.
		C.Knockdown(2 SECONDS)

/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler/kuei_jin
	shapeshift_type = /mob/living/simple_animal/hostile/bloodcrawler/kuei_jin

/obj/item/gun/magic/blood_shintai
	name = "blood spit"
	desc = "Spit blood on your targets."
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "leaper"
	item_flags = NEEDS_PERMIT | ABSTRACT | DROPDEL | NOBLUDGEON
	flags_1 = NONE
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = NONE
	ammo_type = /obj/item/ammo_casing/magic/blood_shintai
	fire_sound = 'sound/effects/splat.ogg'
	force = 0
	max_charges = 1
	fire_delay = 1
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	item_flags = DROPDEL

/obj/item/ammo_casing/magic/blood_shintai
	name = "blood spit"
	desc = "A spit."
	projectile_type = /obj/projectile/blood_wave
	caliber = CALIBER_TENTACLE
	firing_effect_type = null
	item_flags = DROPDEL

/obj/item/gun/magic/blood_shintai/process_fire()
	. = ..()
	if(charges == 0)
		qdel(src)

/obj/projectile/blood_wave
	name = "blood wave"
	icon_state = "leaper"
	speed = 0.8
	animate_movement = SLIDE_STEPS
	ricochets_max = 5
	ricochet_chance = 100
	ricochet_decay_chance =1
	ricochet_decay_damage = 1

	damage = 75
	damage_type = BRUTE
	armour_penetration = 50
	range = 50
	stun = 20
	eyeblur = 20
	dismemberment = 20

	impact_effect_type = /obj/effect/temp_visual/impact_effect

	hit_stunned_targets = TRUE


/datum/discipline_power/kj_discipline_power/blood_shintai/blood_shift
	name = "Blood shift"
	desc = "Shift your blood to either compress it and thus move faster or expand it and become more durable."

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/blood_shintai/blood_spit,
		/datum/discipline_power/kj_discipline_power/blood_shintai/blood_crawl,
		/datum/discipline_power/kj_discipline_power/blood_shintai/blood_wave,
		/datum/discipline_power/kj_discipline_power/blood_shintai/blood_katana
	)

/datum/discipline_power/kj_discipline_power/blood_shintai/blood_shift/activate()
	. = ..()
	var/result = alert(owner, "How do you manage your shape?",,"Shrink","Inflate")
	if(result == "Inflate")
		var/matrix/inflating_matrix = matrix()
		inflating_matrix.Scale(1.2, 1)
		animate(owner, transform = inflating_matrix, 1 SECONDS)
		owner.physiology.armor.melee += 20
		owner.physiology.armor.bullet += 20
		owner.add_movespeed_modifier(/datum/movespeed_modifier/blood_fat)
	else if(result == "Shrink")
		var/matrix/shrinking_matrix = matrix()
		shrinking_matrix.Scale(0.8, 1)
		animate(owner, transform = shrinking_matrix, 1 SECONDS)
		owner.add_movespeed_modifier(/datum/movespeed_modifier/blood_slim)

/datum/discipline_power/kj_discipline_power/blood_shintai/blood_shift/deactivate()
	.=..()
	var/matrix/deflate = matrix()
	deflate.scale(0.8,1)
	var/matrix/reinflate = matrix()
	reinflate.scale(1.2,1)

	if(owner.result = "Inflate")
		animate(owner, transform = deflate, 1 SECONDS)
		owner.physiology.armor.melee -= 20
		owner.physiology.armor.bullet -= 20
		owner.remove_movespeed_modifier(/datum/movespeed_modifier/blood_fat)
	else if(owner.result = "Shrink")
		animate(owner, transform = reinflate, 1 SECONDS)
		owner.remove_movespeed_modifier(/datum/movespeed_modifier/blood_slim)


/*
/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer
	name = "Chi Transfer"
	desc = "Transfer your Chi reserves between your Yin, Yang, and Demon."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	yin_cost = 0
	yang_cost = 0
	toggled = FALSE
	cooldown_length = 6 SECONDS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer/activate()

/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group
	name = "Group Chi Boost"
	desc = "Channel Chi within everyone else around you to push their bodies to greater heights."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 4 TURNS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost/activate()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in oviewers(5, owner))
		affected_mob.dna.species.punchdamagehigh += 5
		affected_mob.physiology.armor.melee += 15
		affected_mob.physiology.armor.bullet += 15
		affected_mob.dexterity += 2
		affected_mob.athletics += 2
		affected_mob.lockpicking += 2
		ADD_TRAIT(affected_mob, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)
		var/obj/effect/celerity/celerity_effect = new(get_turf(affected_mob))
		celerity_effect.appearance = affected_mob.appearance
		celerity_effect.dir = affected_mob.dir
		var/matrix/double_size = matrix(affected_mob.transform)
		double_size.Scale(2, 2)
		animate(celerity_effect, transform = double_size, alpha = 0, time = 1 SECONDS)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost/deactivate()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in oviewers(5, owner))
		var/obj/effect/celerity/celerity_effect = new(get_turf(affected_mob))
		qdel(celerity_effect)
		if(affected_mob)
			affected_mob.dna.species.punchdamagehigh -= 5
			affected_mob.physiology.armor.melee -= 15
			affected_mob.physiology.armor.bullet -= 15
			affected_mob.dexterity -= 2
			affected_mob.athletics -= 2
			affected_mob.lockpicking -= 2
			REMOVE_TRAIT(affected_mob, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)


/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun
	name = "Chi Stun"
	desc = "Aggravate the Chi of those around you, forcing them to collapse briefly in sheer pain."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	yin_cost = 1
	yang_cost = 1
	toggled = FALSE
	cooldown_length = 12 SECONDS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun/activate()
	. = ..()
	for(var/mob/living/affected_mob in oviewers(5, owner))
		affected_mob.AdjustKnockdown(4 SECONDS, TRUE)
		affected_mob.emote("scream")
		playsound(get_turf(affected_mob), 'code/modules/wod13/sounds/vicissitude.ogg', 75, FALSE)
		step_away(affected_mob, owner)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	name = "Ambient Chi Feed"
	desc = "Mastery of the Equilibrium arts has allowed you to feed on even the ambient chi of the area like the Mandarins."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	yin_cost = 0
	yang_cost = 0
	toggled = FALSE
	cooldown_length = 6 SECONDS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun/activate()


/datum/chi_discipline/blood_shintai
	name = "Blood Shintai"
	desc = "Manipulate the liquid flow inside."
	icon_state = "blood"
	ranged = FALSE
	delay = 10 SECONDS
	cost_yin = 1
	activate_sound = 'code/modules/wod13/sounds/bloodshintai_activate.ogg'
	var/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler/kuei_jin/bloodcrawler_shapeshift

/datum/movespeed_modifier/blood_fat
	multiplicative_slowdown = 1

/datum/movespeed_modifier/necroing
	multiplicative_slowdown = 2

/datum/movespeed_modifier/wall_passing
	multiplicative_slowdown = 5

/datum/movespeed_modifier/blood_slim
	multiplicative_slowdown = -0.5

/obj/item/reagent_containers/spray/pepper/kuei_jin
	stream_mode = 1
	stream_range = 5
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/consumable/condensedcapsaicin = 50, /datum/reagent/blood = 20)

/mob/living/simple_animal/hostile/bloodcrawler/kuei_jin
	name = "blood splatter"
	desc = "Just a moving blood splatter on the floor..."
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	icon_living = "floor1"
	speed = 5
	maxHealth = 100
	health = 100
	melee_damage_lower = 1
	melee_damage_upper = 1
	a_intent = INTENT_HELP
	attack_verb_continuous = "splashes"
	attack_verb_simple = "splash"

/mob/living/simple_animal/hostile/bloodcrawler/kuei_jin/Initialize()
	. = ..()
	icon_state = "floor[rand(1, 7)]"
	icon_living = "floor[rand(1, 7)]"

/mob/living/simple_animal/hostile/bloodcrawler/kuei_jin/Crossed(atom/movable/O)
	. = ..()
	if(ishuman(O))
		var/mob/living/carbon/C = O
		to_chat(C, "<span class='notice'>You slipped[ O ? " on the [O.name]" : ""]!</span>")
		playsound(C.loc, 'sound/misc/slip.ogg', 50, TRUE)

		SEND_SIGNAL(C, COMSIG_ON_CARBON_SLIP)
		for(var/obj/item/I in C.held_items)
			C.accident(I)

		C.moving_diagonally = 0 //If this was part of diagonal move slipping will stop it.
		C.Knockdown(2 SECONDS)

/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler/kuei_jin
	shapeshift_type = /mob/living/simple_animal/hostile/bloodcrawler/kuei_jin

/obj/item/gun/magic/blood_shintai
	name = "blood spit"
	desc = "Spit blood on your targets."
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "leaper"
	item_flags = NEEDS_PERMIT | ABSTRACT | DROPDEL | NOBLUDGEON
	flags_1 = NONE
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = NONE
	ammo_type = /obj/item/ammo_casing/magic/blood_shintai
	fire_sound = 'sound/effects/splat.ogg'
	force = 0
	max_charges = 1
	fire_delay = 1
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	item_flags = DROPDEL

/obj/item/ammo_casing/magic/blood_shintai
	name = "blood spit"
	desc = "A spit."
	projectile_type = /obj/projectile/blood_wave
	caliber = CALIBER_TENTACLE
	firing_effect_type = null
	item_flags = DROPDEL

/obj/item/gun/magic/blood_shintai/process_fire()
	. = ..()
	if(charges == 0)
		qdel(src)

/obj/projectile/blood_wave
	name = "blood wave"
	icon_state = "leaper"
	speed = 20
	animate_movement = SLIDE_STEPS
	ricochets_max = 5
	ricochet_chance = 100
	ricochet_decay_chance =1
	ricochet_decay_damage = 1

	damage = 75
	damage_type = BRUTE
	armour_penetration = 50
	range = 50
	stun = 20
	eyeblur = 20
	dismemberment = 20

	impact_effect_type = /obj/effect/temp_visual/impact_effect

	hit_stunned_targets = TRUE

/datum/chi_discipline/blood_shintai/activate(mob/living/target, mob/living/carbon/human/owner)
	..()
	switch(level_casting)
		if(1)
			var/result = alert(owner, "How do you manage your shape?",,"Shrink","Inflate")
			if(result == "Inflate")
				var/matrix/inflating_matrix = matrix()
				inflating_matrix.Scale(1.2, 1)
				var/matrix/initial = owner.transform
				animate(owner, transform = inflating_matrix, 1 SECONDS)
				owner.physiology.armor.melee += 20
				owner.physiology.armor.bullet += 20
				owner.add_movespeed_modifier(/datum/movespeed_modifier/blood_fat)
				spawn(delay+owner.discipline_time_plus)
					if(owner)
						animate(owner, transform = initial, 1 SECONDS)
						owner.physiology.armor.melee -= 20
						owner.physiology.armor.bullet -= 20
						owner.remove_movespeed_modifier(/datum/movespeed_modifier/blood_fat)
			else if(result == "Shrink")
				var/matrix/shrinking_matrix = matrix()
				shrinking_matrix.Scale(0.8, 1)
				var/matrix/initial = owner.transform
				animate(owner, transform = shrinking_matrix, 1 SECONDS)
				owner.add_movespeed_modifier(/datum/movespeed_modifier/blood_slim)
				spawn(delay+owner.discipline_time_plus)
					if(owner)
						animate(owner, transform = initial, 1 SECONDS)
						owner.remove_movespeed_modifier(/datum/movespeed_modifier/blood_slim)
		if(2)
			playsound(get_turf(owner), 'code/modules/wod13/sounds/spit.ogg', 50, FALSE)
			spawn(1 SECONDS)
				var/obj/item/reagent_containers/spray/pepper/kuei_jin/sprayer = new (get_turf(owner))
				//spits the weird pepper spray 3 tiles ahead of the owner
				var/turf/sprayed_at_turf = get_turf(owner)
				for (var/i in 1 to 3)
					sprayed_at_turf = get_step(sprayed_at_turf, owner.dir)
				sprayer.spray(sprayed_at_turf, owner)
				qdel(sprayer)
		if(3)
			if(!bloodcrawler_shapeshift)
				bloodcrawler_shapeshift = new (owner)
			bloodcrawler_shapeshift.Shapeshift(owner)
			var/mob/living/simple_animal/hostile/host = bloodcrawler_shapeshift.myshape
			host.my_creator = null
			spawn(delay+owner.discipline_time_plus)
				if(bloodcrawler_shapeshift)
					var/mob/living/simple_animal/hostile/bloodcrawler/current_form = bloodcrawler_shapeshift.myshape
					if(current_form.collected_blood > 1)
						owner.adjustBruteLoss(-5*round(current_form.collected_blood/2), TRUE)
						owner.adjustFireLoss(-5*round(current_form.collected_blood/2), TRUE)
					bloodcrawler_shapeshift.Restore(bloodcrawler_shapeshift.myshape)
					owner.Stun(1.5 SECONDS)
					owner.do_jitter_animation(3 SECONDS)
		if(4)
			owner.drop_all_held_items()
			owner.put_in_active_hand(new /obj/item/gun/magic/blood_shintai(owner))
		if(5)
			var/obj/item/melee/vampirearms/katana/blood/blood_katana = new (owner)
			owner.drop_all_held_items()
			owner.put_in_active_hand(blood_katana)
			spawn(delay+owner.discipline_time_plus)
				if(blood_katana)
					qdel(blood_katana)
*/
