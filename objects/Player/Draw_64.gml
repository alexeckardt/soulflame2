/// @desc

//Display
var guiW = Camera.game_width;
var guiH = Camera.game_height;
display_set_gui_size(guiW, guiH)

//Draw Corruption


//Draw Essence Tokens

	//Pos per UI scale
	var lColumnX = guiW - tokenEdgeBuffer;
	var rColumnX = lColumnX - tokenColumnSep;

	//Loop and Draw
	var tokenCount = ds_list_size(essenceTokens);
	for (var i = 0; i < essenceTokensCanHold; i++) {
	
		//Decide Positions
		var tokenyy = tokenRowHeight * i;
		var tokenxx = (i mod 2 == 0) ? lColumnX : rColumnX;
	
		//Check If Empty
		if (i > tokenCount) {
		
			//Draw Empty
			var c = c_white;
			draw_sprite_ext(sEssenceTokenSlot, 0, tokenxx, tokenyy, 1, 1, 0, c, 1)
		
		} else {
		
			//Draw Token
			tokenInfo = essenceTokens[| i];
	
		}

	}


//Draw Hearts