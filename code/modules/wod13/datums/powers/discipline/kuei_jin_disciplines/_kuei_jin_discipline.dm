//Currently this is set as a child object of the parent discipline as just in case I need to do extra stuff that should only be done to KJs

/datum/discipline/kj_discipline
	/* CUSTOMIZABLE */
	///Name of this Discipline.
	name = "Discipline name"
	///Text description of this Discipline.
	desc = "Discipline description"
	///Icon for this Discipline as in code/modules/wod13/UI/kuei_jin.dmi
	icon_state
	///Due to the nature of KJs, no concept of clan_restricted should exist. Although theoretically this could work for specific stuff like Prayer-eating and Tainted Shintais for Heretical Dharmas
	clan_restricted = FALSE
	///The root type of the powers this Discipline uses.
	power_type = /datum/discipline_power
	///If this Discipline can be selected at all, or has special handling.
	selectable = TRUE

	/* BACKEND */
	///What rank, or how many dots the caster has in this Discipline.
	level = 1
	///What rank of this Discipline is currently being casted.
	level_casting = 1
	///The power that is currently in use.
	/datum/discipline_power/current_power
	///All Discipline powers under this Discipline that the owner knows. Derived from all_powers.
	list/datum/discipline_power/known_powers = list()
	///The typepaths of possible powers for every rank in this Discipline.
	/all_powers = list()
	///The mob that owns and is using this Discipline.
	/mob/living/carbon/human/owner
	///If this Discipline has been assigned before and post_gain effects have already been applied.
	post_gain_applied
