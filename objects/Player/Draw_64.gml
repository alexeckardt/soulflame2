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
			var alignment = tokenInfo[0];
			var perent = tokenInfo[1];
	
			var spr = essence_token_get_sprite(alignment);
			var ind = (perent / 100) * (sprite_get_number(spr)-1);
	
			var c = c_white;
			draw_sprite_ext(spr, ind, tokenxx, tokenyy, 1, 1, 0, c, 1);
			
		} else {

			//Draw Empty Slot
			var c = c_white;
			draw_sprite_ext(sEssenceTokenSlot, 0, tokenxx, tokenyy, 1, 1, 0, c, 1);		
	
		}

	}


//Draw Health
	var hpY = healthDisplayY;
	var healthBoxWidth = (baseMaxHealth + 1) * (heartWidthOffset);

	//Background
	draw_sprite_ext(sHeartBackground, 0,	-1,					hpY, healthBoxWidth,	1, 0, heartBoxCol, heartBoxAlpha);
	draw_sprite_ext(sHeartBackgroundEdge, 0,-1+healthBoxWidth,	hpY, 1,					1, 0, heartBoxCol, heartBoxAlpha);
	
	//Draw Hearts
	for (var i = 0; i < baseMaxHealth; i++) {
		
		//Position
		var heartSprite = sHeartFull
		var heartxx = (i + 0.5)*heartWidthOffset;
		
		//Decide Sprite
		//Regular Health Display
		if (i < currentMaxHealth) {
			
			//Broken Hearts, This heart is over the amount of hp I have
			if (i >= hp) {
				heartSprite = sHeartBroken;
			}
				
		//Hearts Over the current max health	
		} else {
			
			//Corrupted Hearts
			switch (sign(corruptionPercent)) {
				case -1: heartSprite = sHeartCorruptedChaos;break;	
				case +1: heartSprite = sHeartCorruptedOrder;break;	
			}
		
		}
		
		//Draw
		draw_sprite(heartSprite, 0, heartxx, hpY);
		
	}
	
//Weapon Surface
	if (weaponWheelScale > weaponWheelScaleDispalyThreshold) {
	
		//Draw Surface
		surface_set_target(weaponWheelSurf);
			var center = weaponWheelSurfaceWidth div 2;
	
			//Clear
			draw_clear_alpha(0, 0.5);
			
			//Draw Ring
			var wheelBuffer = weaponSelectionBubbleSize;
			var wheelRadius = weaponWheelSize;
			draw_sprite(weaponWheelSpr, 0, wheelBuffer, wheelBuffer)
			
			//Draw Weapons in correct slots and positions
			if (weaponHighlighted != -1) {
					var sSize = 360 div weapon.height;
					var startAng = 90 + ((weaponHighlighted - 1) * sSize) + sSize/2;
					startAng %= 359;
					draw_pie(center-1, center-1, 1, weapon.height, c_gray, wheelRadius+10, 1, startAng);
				}
	
			//Draw Controller Stick Position
			var zoneRad = weaponWheelSize;
			var rad = weaponWheelLerpDisplayingLen;

			var stickX = zoneRad * lengthdir_x(rad, weaponWheelLerpDisplayingDir);
			var stickY = zoneRad * lengthdir_y(rad, weaponWheelLerpDisplayingDir);
			
			draw_circle(center+stickX, center+stickY, 10, false);
			
			surface_reset_target();
		
		
		//Draw Surface
		var wheelPosX = (guiW - weaponWheelSurfaceWidth*weaponWheelScale) div 2; //Match Player X in future
		var wheelPosY = (guiH - weaponWheelSurfaceWidth*weaponWheelScale) div 2; //
		
		//Surf
		draw_surface_ext(weaponWheelSurf, wheelPosX, wheelPosY, weaponWheelScale, weaponWheelScale, 0, c_white, 1)
	
	}