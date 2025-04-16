/datum/discipline/chi_discipline
	/* CUSTOMIZABLE */
	///Name of this Discipline.
	var/name = "Discipline name"
	///Text description of this Discipline.
	var/desc = "Discipline description"
	///Icon for this Discipline as in disciplines.dmi
	var/icon_state
	///If this Discipline is unique to a certain Clan.
	var/clan_restricted = FALSE
	///The root type of the powers this Discipline uses.
	var/power_type = /datum/discipline_power
	///If this Discipline can be selected at all, or has special handling.
	var/selectable = TRUE

	/* BACKEND */
	///What rank, or how many dots the caster has in this Discipline.
	var/level = 1
	///What rank of this Discipline is currently being casted.
	var/level_casting = 1
	///The power that is currently in use.
	var/datum/discipline_power/current_power
	///All Discipline powers under this Discipline that the owner knows. Derived from all_powers.
	var/list/datum/discipline_power/known_powers = list()
	///The typepaths of possible powers for every rank in this Discipline.
	var/all_powers = list()
	///The mob that owns and is using this Discipline.
	var/mob/living/carbon/human/owner
	///If this Discipline has been assigned before and post_gain effects have already been applied.
	var/post_gain_applied
