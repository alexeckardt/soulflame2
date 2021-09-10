/// @desc

inControl = true;
STATE = state.base;
mask = sKeiraIdle;

runAcc = 0;
traction = 0.9;
onGround = true;

hSpeed = 0;
vSpeed = 0;

hMomentum = 0;
vMomentum = 0;

//Air Friction
onGround = true;
doAirFriction = true;
airFrictionValue = 0.08;
airFrictionMultiplierLerp = 0;
groundBelow = noone;
timeSinceOnGround = 1; //-1 means on ground

//Mpve
walkSpeed = 1;
minRunSpeed = 3.2;
maxRunSpeed = minRunSpeed+1;
controllerHorizontalMovementInput = 0

//Jump
jumped = false;
jumpCooldownTicks = 0;
jumpSpeed = -8.3;
coyoteeMaxTime = 8;
preLandJumpsTime = 7;
jumpTicks = -1;
cutVspd = false;
slideCornerRange = 8;


//Grav
myGrav = 0.35;
terminalVelocity = 10;
halfGravityThreshold = 0.8;
allowHalfGravity = true;

//Display
directionFacing = 1;
directionFacingSmooth = 1;
turnSpeed = 0.2;

//Display
squishX = 1;
squishY = 1;
squishOffset = 0.3;
sqiushElasticity = 0.2;
blend = c_white;
alpha = 1;

//Climbing
climbingGravMulti = 0.5;
climbingTermVel = 3;
wallInDirection = 0;
lastWallInDirection = 0;
lastWallMeeting = noone;
lastOnFloorAtY = y;
timeSinceClimbing = 2; //-1 is climbing
wallJumpAngle = 30;
wallJumpSpeed = 7.65;
wallClimbCoyoteeTime = 4;

canVerticalClimb = false;