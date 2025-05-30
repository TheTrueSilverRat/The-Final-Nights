
//objects in /obj/effect should never be things that are attackable, use obj/structure instead.
//Effects are mostly temporary visual effects like sparks, smoke, as well as decals, etc...
/obj/effect
	icon = 'icons/effects/effects.dmi'
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	move_resist = INFINITY
	obj_flags = NONE
	vis_flags = VIS_INHERIT_PLANE

/obj/effect/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	return

/obj/effect/fire_act(exposed_temperature, exposed_volume)
	return

/obj/effect/acid_act()
	return FALSE

/obj/effect/blob_act(obj/structure/blob/B)
	return

/obj/effect/attack_hulk(mob/living/carbon/human/user)
	return FALSE

/obj/effect/ex_act(severity, target)
	return

/obj/effect/singularity_act()
	qdel(src)

/obj/effect/abstract/has_gravity(turf/T)
	return FALSE
