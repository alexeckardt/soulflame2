/// @desc

inControl = true;
STATE = state.base;

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
airFrictionValue = 0.06;
airFrictionMultiplierLerp = 0;
groundBelow = noone;
timeSinceOnGround = 1; //-1 means on ground

//Mpve
walkSpeed = 1;
minRunSpeed = 2.6;
maxRunSpeed = minRunSpeed+1;

//Jump
jumpSpeed = -7.8;
coyoteeMaxTime = 5;
preLandJumpsTime = 7;
jumpTicks = -1;
cutVspd = false;

//Grav
myGrav = 0.35;
terminalVelocity = 10;
halfGravityThreshold = 0.8;
allowHalfGravity = true;

