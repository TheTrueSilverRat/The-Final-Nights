/mob/living/carbon/human/register_init_signals()
	. = ..()
	RegisterSignal(src, list(SIGNAL_ADDTRAIT(TRAIT_SALUBRI_EYE), SIGNAL_REMOVETRAIT(TRAIT_SALUBRI_EYE)), PROC_REF(on_salubri_eye))

/mob/living/carbon/human/proc/on_salubri_eye()
	SIGNAL_HANDLER


	if(HAS_TRAIT(src, TRAIT_SALUBRI_EYE))
		var/obj/item/organ/eyes/salubri = src.getorgan(/obj/item/organ/eyes)

		if(salubri)
			salubri.Remove(TRUE, FALSE)
		update_body()
		REMOVE_TRAIT(src, TRAIT_SALUBRI_EYE_OPEN, SALUBRI_EYE_TRAIT)
	else
		var/obj/item/organ/eyes/salubri/salubri = new()
		salubri.Insert(TRUE, FALSE)
		update_body()


