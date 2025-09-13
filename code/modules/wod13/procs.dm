/mob/living/carbon/human/npc/proc/backinvisible(atom/A)
	switch(dir)
		if(NORTH)
			if(A.y >= y)
				return TRUE
		if(SOUTH)
			if(A.y <= y)
				return TRUE
		if(EAST)
			if(A.x >= x)
				return TRUE
		if(WEST)
			if(A.x <= x)
				return TRUE
	return FALSE

/mob/proc/can_respawn()
	if (client?.ckey)
		if (GLOB.respawn_timers[client.ckey])
			if ((GLOB.respawn_timers[client.ckey] + 10 MINUTES) > world.time)
				return FALSE
	return TRUE

/proc/get_vamp_skin_color(value = "albino")
	switch(value)
		if("caucasian1")
			return "vamp1"
		if("caucasian2")
			return "vamp2"
		if("caucasian3")
			return "vamp3"
		if("latino")
			return "vamp4"
		if("mediterranean")
			return "vamp5"
		if("asian1")
			return "vamp6"
		if("asian2")
			return "vamp7"
		if("arab")
			return "vamp8"
		if("indian")
			return "vamp9"
		if("african1")
			return "vamp10"
		if("african2")
			return "vamp11"
		else
			to_chat(world, span_boldannounce("[value]"))
			var/testio = RGBtoHSV(value)
			var/list/existing_color = rgb2num(testio, COLORSPACE_HSL)

			to_chat(world, span_boldannounce("HUE COLOR OF EXISTING_COLOR!!! [existing_color[1]]"))
			to_chat(world, span_boldannounce("SATURATION COLOR OF EXISTING_COLOR!!! [existing_color[2]]"))
			to_chat(world, span_boldannounce("VALUE COLOR OF EXISTING_COLOR!!! [existing_color[3]] \n\n"))

			var/hue = max(existing_color[1],100)

			var/sat = max(existing_color[2] - 40, 0)

			var/val = min(existing_color[3], 100)

			to_chat(world, span_boldwarning("HUE COLOR OF EXISTING_COLOR!!! [hue]"))
			to_chat(world, span_boldwarning("SATURATION COLOR OF EXISTING_COLOR!!! [sat]"))
			to_chat(world, span_boldwarning("VALUE COLOR OF EXISTING_COLOR!!! [val] \n\n"))

			var/list/conv_color = list(hue, sat, val)

			var/hsv_color = rgb(hue = conv_color[1], saturation = conv_color[2], value = conv_color[3])


			to_chat(world, span_boldnicegreen("DOUBLE CHECKING IF IT ACTUALLY BECOMES HSV!!! [hsv_color]"))
			to_chat(world, span_boldnicegreen("HUE COLOR OF CONV COLOR!!! [conv_color[1]]"))
			to_chat(world, span_boldnicegreen("SATURATION COLOR OF CONV COLOR!!! [conv_color[2]]"))
			to_chat(world, span_boldnicegreen("VALUE COLOR OF CONV COLOR!!! [conv_color[3]] \n\n"))

//			var/new_color = HSVtoRGB(hsv_color)

			to_chat(world, span_boldnotice("IS THERE A COLOR HERE??? PUT IT HERE: [hsv_color]"))

//			var/real_color = rgb(new_color[1], new_color[2], new_color[3])
			return hsv_color
/*
			var/list/existing_color = rgb2num(value, COLORSPACE_HSV)
			to_chat(world, span_boldannounce("HUE COLOR OF EXISTING_COLOR!!! [existing_color[1]]"))
			to_chat(world, span_boldannounce("SATURATION COLOR OF EXISTING_COLOR!!! [existing_color[2]]"))
			to_chat(world, span_boldannounce("VALUE COLOR OF EXISTING_COLOR!!! [existing_color[3]]"))

			var/new_color_hue = max(existing_color[1], 0)
			var/new_color_sat = max(existing_color[2] - 20, 0)
			var/new_color_value = min(existing_color[3] + 10, 100)

			to_chat(world, span_greenannounce("HUE COLOR OF NEW COLOR!!! [new_color_hue]"))
			to_chat(world, span_greenannounce("SATURATION COLOR OF NEW_COLOR!!! [new_color_sat]"))
			to_chat(world, span_greenannounce("VALUE COLOR OF NEW_COLOR!!! [new_color_value]"))
/*
			var/list/proper_color = HSVtoRGB(lightened_color[1], lightened_color[2], lightened_color[3])
			to_chat(world, span_greenannounce("HUE COLOR OF NEW COLOR!!! [proper_color[1]]"))
			to_chat(world, span_greenannounce("SATURATION COLOR OF NEW_COLOR!!! [proper_color[2]]"))
			to_chat(world, span_greenannounce("VALUE COLOR OF NEW_COLOR!!! [proper_color[3]]"))
			var/proper_proper_color = rgb(proper_color[1], proper_color[2], proper_color[3])
*/
			var/true_color = hsv(new_color_hue, new_color_sat, new_color_value, 255)
			var/proper_color = HSVtoRGB(true_color)
			to_chat(world, span_greenannounce("HUE COLOR OF NEW COLOR!!! [proper_color[1]]"))
			to_chat(world, span_greenannounce("SATURATION COLOR OF NEW_COLOR!!! [proper_color[2]]"))
			to_chat(world, span_greenannounce("VALUE COLOR OF NEW_COLOR!!! [proper_color[3]]"))
			to_chat(world, span_boldannounce("DOUBLE CHECKING TO SHOW I EXIST HERE!!! [proper_color]"))
			return proper_color
*/
