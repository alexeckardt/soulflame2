/// @desc
delta = -1;
delta_scale = 60;

usingController = gamepad_is_connected(0);
gamepadDeadzone = 0.3;


left = false;
right = false;
horizontalStick = 0;

jump = false;
jumpHeld = false;

lightAttack = false;
lightAttackPressed = false;

heavyAttack = false;
heavyAttackPressed = false;

block = false;
blockPressed = false;