/// @desc

usingController = gamepad_is_connected(0);

//Controller Controller (Preferred)
if (usingController) {
	//Set Deadzone
	gamepad_set_axis_deadzone(0, gamepadDeadzone);

	//Stick Input Values
	
		//Time In Horizontal
		hStickTimeInSameInput += delta;
		var hStickLast = horizontalStick;
		horizontalStick = gamepad_axis_value(0, gp_axislh);
		if (hStickLast != horizontalStick) hStickTimeInSameInput = 0;
	
		//Time In Vertical
		vStickTimeInSameInput += delta;
		var vStickLast = verticalStick;
		verticalStick = gamepad_axis_value(0, gp_axislh);
		if (vStickLast != verticalStick) vStickTimeInSameInput = 0;
	

	//Left and Right
	left = gamepad_axis_value(0, gp_axislh) < 0;
	right = gamepad_axis_value(0, gp_axislh) > 0;
	
	jump = gamepad_button_check_pressed(0, gp_face1);
	jumpHeld = gamepad_button_check(0, gp_face1);
	
	combatAttack = gamepad_button_check(0, gp_face3);
	combatAttackPressed = gamepad_button_check_pressed(0, gp_face3);
	
	heavyAttack = gamepad_button_check(0, gp_face2);
	heavyAttackPressed = gamepad_button_check_pressed(0, gp_face2);
	
	block = gamepad_button_check(0, gp_shoulderl);
	blockPressed = gamepad_button_check(0, gp_shoulderl);
}

//Keyboard Controller
if (!usingController) {
	left = keyboard_check(vk_left)
	right = keyboard_check(vk_right)
	horizontalStick = right - left;
	
	jump = keyboard_check_pressed(vk_space);
	jumpHeld = keyboard_check(vk_space);
}