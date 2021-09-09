/// @desc

STATE = state.base;

runAcc = 0;
traction = 0.2;
onGround = true;

hSpeed = 0;
vSpeed = 0;

hMomentum = 0;
vMomentum = 0;

myGrav = 0.3;
terminalVelocity = 10;
halfGravityThreshold = 0.5;

walkSpeed = 1;
minRunSpeed = 2;
maxRunSpeed = 3;

xpos = x;
ypos = y;

jumpSpeed = -6.8;
coyoteeMaxTime = 5;
preLandJumpsTime = 7;

jumpTicks = -1;
timeSinceOnGround = -1; //-1 means on ground