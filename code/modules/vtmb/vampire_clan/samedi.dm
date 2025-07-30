/datum/vampire_clan/cappadocian
	name = CLAN_SAMEDI
	desc = "A presumed-to-be-extinct Clan of necromancers, the Cappadocians studied death specifically in the physical world. The Giovanni were Embraced into their line to help further their studies into the underworld. They were rewarded with Diablerie and the destruction of their Clan and founder."
	curse = "Extremely rotten dead form. Akin to a walking zombie."
	clan_disciplines = list(
		/datum/discipline/obfuscate,
		/datum/discipline/fortitude,
		/datum/discipline/necromancy
	)

	whitelisted = FALSE

/datum/vampire_clan/cappadocian/on_gain(mob/living/carbon/human/H)
	. = ..()
	H.rot_body(4)

/datum/vampire_clan/cappadocian/on_join_round(mob/living/carbon/human/H)
	. = ..()

	// Samedi Automatically Get the stuff to help them disguise themselves
	var/obj/item/clothing/suit/hooded/robes/darkred/new_robe = new(H.loc)
	H.equip_to_appropriate_slot(new_robe, FALSE)

	var/obj/item/clothing/mask/vampire/venetian_mask/fancy/new_mask = new(H.loc)
	H.equip_to_appropriate_slot(new_mask, FALSE)
