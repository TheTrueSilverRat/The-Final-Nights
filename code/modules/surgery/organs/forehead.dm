/obj/item/organ/forehead
	name = BODY_ZONE_PRECISE_EYES
	illegal = TRUE
	cost = 100
	zone = BODY_ZONE_PRECISE_EYES
	slot = ORGAN_SLOT_FOREHEAD
	gender = PLURAL

/obj/item/organ/forehead/salubri
	icon_state = "salubri"


/obj/item/organ/forehead/salubri/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		color = H.eye_color
		H.dna.features["forehead"] = H.dna.species.mutant_bodyparts["forehead"] = "salubri"
		H.update_body()

/obj/item/organ/forehead/salubri/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		color = H.eye_color
		H.dna.features["forehead"] = "None"
		H.dna.species.mutant_bodyparts -= "forehead"
		H.update_body()
