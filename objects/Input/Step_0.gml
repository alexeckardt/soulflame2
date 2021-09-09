/// @desc

//Set Deadzone
gamepad_set_axis_deadzone(0, gamepadDeadzone);

//Left and Right
horizontalStick = gamepad_axis_value(0, gp_axislh);
left = gamepad_axis_value(0, gp_axislh) < 0;
right = gamepad_axis_value(0, gp_axislh) > 0;