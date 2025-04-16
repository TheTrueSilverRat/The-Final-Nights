/datum/discipline_power/chi_discipline_power
	/// Name of the Discipline power
	var/name = "Discipline power name"
	/// Description of the Discipline power
	var/desc = "Discipline power description"

	/* BASIC INFORMATION */
	/// What rank of the Discipline this Discipline power belongs to.
	var/level = 1
	/// Bitflags determining the requirements to cast this power
	var/check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE
	/// How many blood points this power costs to activate
	var/vitae_cost = 1
	/// Bitflags determining what types of entities this power is allowed to target. NONE if self-targeting only.
	var/target_type = NONE
	/// How many tiles away this power can be used from.
	var/range = 0

	/* EXTRA BEHAVIOUR ON ACTIVATION AND DEACTIVATION */
	/// Sound file that plays to the user when this power is activated.
	var/activate_sound
	/// Sound file that plays to the user when this power is deactivated.
	var/deactivate_sound
	/// Sound file that plays to all nearby players when this power is activated.
	var/effect_sound
	/// If this power will upset NPCs when used on them.
	var/aggravating = FALSE
	/// If this power is an aggressive action and logged as such.
	var/hostile = FALSE
	/// If use of this power creates a visible Masquerade breach.
	var/violates_masquerade = FALSE

	/* HOW AND WHEN IT'S ACTIVATED AND DEACTIVATED */
	/// If this Discipline doesn't automatically expire, but rather periodically drains blood.
	var/toggled = FALSE
	/// If this power can be turned on and off.
	var/cancelable = FALSE
	/// If this power can (theoretically, not in reality) have multiple of its effects active at once.
	var/multi_activate = FALSE
	/// Amount of time it takes until this Discipline deactivates itself. 0 if instantaneous.
	var/duration_length = 0
	/// Amount of time it takes until this Discipline can be used again after activation.
	var/cooldown_length = 0
	/// If this power uses its own duration/deactivation handling rather than the default handling
	var/duration_override = FALSE
	/// If this power uses its own cooldown handling rather than the default handling
	var/cooldown_override = FALSE
	/// List of Discipline power types that cannot be activated alongside this power and share a cooldown with it.
	var/list/grouped_powers
