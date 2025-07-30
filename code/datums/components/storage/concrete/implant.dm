/datum/component/storage/concrete/implant
	grid = TRUE
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = 1000
	max_items = 1000
	screen_max_columns = 5
	screen_max_rows = 5
	drop_all_on_destroy = TRUE
	drop_all_on_deconstruct = TRUE
	silent = TRUE

/datum/component/storage/concrete/implant/Initialize()
	. = ..()
	set_holdable(null, list(/obj/item/disk/nuclear))

/datum/component/storage/concrete/implant/InheritComponent(datum/component/storage/concrete/implant/I, original)
	if(!istype(I))
		return ..()
	max_combined_w_class += I.max_combined_w_class
	max_items += I.max_items
