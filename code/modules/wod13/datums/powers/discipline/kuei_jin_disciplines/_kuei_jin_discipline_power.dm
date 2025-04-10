//Need to make this a child object so KJs can do their own thing without messing up vampire stuff

/datum/discipline_power/kj_discipline_power
	/// Name of the Discipline power
	name = "Discipline power name"
	/// Description of the Discipline power
	desc = "Discipline power description"

	/* BASIC INFORMATION */
	/// What rank of the Discipline this Discipline power belongs to.
	level = 1
	/// Bitflags determining the requirements to cast this power
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE
	/// Setting this to 0 because Kuei Jin DO NOT use blood at all and should never be using it
	vitae_cost = 0
	///How many Yin Chi Points this discipline costs to use
	var/yin_cost = 0
	///How many Yang Chi Points this discipline costs to use
	var/yang_cost = 0
	///How many Demon Chi Points this discipline costs to use
	var/demon_cost = 0
	/// Bitflags determining what types of entities this power is allowed to target. NONE if self-targeting only.
	target_type = NONE
	/// How many tiles away this power can be used from.
	range = 0

	/* EXTRA BEHAVIOUR ON ACTIVATION AND DEACTIVATION */
	/// If this power will upset NPCs when used on them.
	aggravating = FALSE
	/// If this power is an aggressive action and logged as such.
	hostile = FALSE
	/// If use of this power creates a visible Masquerade breach.
	violates_masquerade = FALSE

	/* HOW AND WHEN IT'S ACTIVATED AND DEACTIVATED */
	/// If this Discipline doesn't automatically expire, but rather periodically drains blood.
	var/toggled = FALSE
	/// If this power can be turned on and off.
	cancelable = FALSE
	/// If this power can (theoretically, not in reality) have multiple of its effects active at once.
	multi_activate = FALSE
	/// Amount of time it takes until this Discipline deactivates itself. 0 if instantaneous.
	duration_length = 0
	/// Amount of time it takes until this Discipline can be used again after activation.
	cooldown_length = 0
	/// If this power uses its own duration/deactivation handling rather than the default handling
	duration_override = FALSE
	/// If this power uses its own cooldown handling rather than the default handling
	cooldown_override = FALSE

/**
 * Returns a boolean of if the caster can afford
 * this power's vitae cost.
 * Goes through a series of if statements to determine if you are able to afford the costs of the disciplines
 */
/datum/discipline_power/kj_discipline_power/proc/can_afford()
	. = ..()
	if(owner.yin_chi >= yin_cost)
		if(owner.yang_chi >= yang_cost)
			if(owner.demon_chi >= demon_cost)
				return TRUE
	else
		return FALSE
//	return (owner.bloodpool >= vitae_cost)


/datum/discipline_power/kj_discipline_power/proc/spend_resources()
	. = ..()
	if (can_afford())
		owner.yin_chi = owner.yin_chi - yin_cost
		owner.yang_chi = owner.yang_chi - yang_cost
		owner.demon_chi = owner.demon_chi - demon_cost
		owner.update_action_buttons()
		return TRUE
	else
		return FALSE
