/// @desc


usingController = gamepad_is_connected(0);
gamepadDeadzone = 0.3;

horizontalStick = 0;
hStickTimeInSameInput = 0;

verticalStick = 0;
vStickTimeInSameInput = 0;


left = false;
right = false;

jump = false;
jumpHeld = false;

combatAttack = false;
combatAttackPressed = false;

heavyAttack = false;
heavyAttackPressed = false;

block = false;
blockPressed = false;