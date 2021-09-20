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
		var tokenyy = tokenRowHeight * i + tokenListBufferY;
		var tokenxx = (i mod 2 == 1) ? lColumnX : rColumnX;
	
		//Check If Empty
		if (i < tokenCount) {
		
			//Draw Token
			var tokenInfo = essenceTokens[| i];
			var spr = tokenInfo[1];
			var ind = tokenInfo[2];
	
			var c = c_white;
			draw_sprite_ext(spr, ind, tokenxx, tokenyy, 1, 1, 0, c, 1);
			
		} else {

			//Draw Empty Slot
			var c = c_white;
			draw_sprite_ext(sEssenceTokenSlot, 0, tokenxx, tokenyy, 1, 1, 0, c, 1);		
	
		}

	}


//Draw Hearts