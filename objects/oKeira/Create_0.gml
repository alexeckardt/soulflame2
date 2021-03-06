/// @desc

inControl = true;
STATE = state.base;
mask = sKeiraIdle;

//Setup
hitbox = hitbox_create_alt(oKeiraHitbox, x, y-24, 25, 38, false);


//Variaibles
runAcc = 0;
traction = 0.9;

hSpeed = 0;
vSpeed = 0;

controlHSpeed = 0;
controlVSpeed = 0;

knockbackHSpeed = 0;
knockbackVSpeed = 0;
kbFriction = 0.07;

hMomentum = 0;
vMomentum = 0;

weight = 1.2;

//Air Friction
onGround = true;
doAirFriction = true;
airFrictionValue = 0.05;
airFrictionMultiplierLerp = 0;
groundBelow = noone;
timeSinceOnGround = 1; //-1 means on ground

//Move
walkSpeed = 1;
minRunSpeed = 4.2;
controllerHorizontalMovementInput = 0;

//Jump
jumped = false;
jumpCooldownTicks = 0;
jumpSpeed = -8.3;
coyoteeMaxTime = 8;
preLandJumpsTime = 7;
jumpTicks = -1;
cutVspd = false;
slideCornerRange = 8;
forceJump = false;
combatInAirJumpCoefficient = 0.45;

//Grav
myGrav = 0.35;
terminalVelocity = 10;
halfGravityThreshold = 0.8;
allowHalfGravity = true;
forceHalfGravity = false;

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

//Attacking / Combat
displayReadyPosForTime = -1;
nextAttack = state.height;
wantToChangeAttackTicks = -1;
timeForPreAttacks = 15;
attackSpeed = 0.4;
createdDamage = false;
comboNumber = 0;
damageCreateXoffset = 10;
damageCreateYoffset = 0;
damageCreateWidth	= 28;
damageCreateHeight	= 15;
damageKnockbackMulti = 0;
damageKnockbackAddHSpeed = 0;
damageKnockbackAddHspeedRelative = false; //to directionFacing
damageKnockbackAddVSpeed = 0;
damageCreateBaseDamage = 0;
damageCreateDamageType = -1;
tiltTime = room_speed/2
adjustDirectionFacingPreDamage = true;
allowControlOverIndex = 0;
bouncingOffEnemy = false;
bounceJumpCoefficient = 0.9;

//Sliding
slideSpeed = minRunSpeed*1.8;
slideSpeedReduction = 0.06;
slideExitSpeedBase = 0.6;
slideExitSpeed = slideExitSpeedBase;
slideMaxSpeed = slideSpeed;
slidingInDirection = 0;
slideActivateSprite = sKeiraSlideActivate;
slideLoopSprite = sKeiraSlideLoop;
slideRecoverSprite = sKeiraSlideRecover;
allowCombatAirUp = true;

useFront = true;

//Taking Damage
invulnerableTicks = 0;
hurtTicks = 0;
hurtTime = room_speed*0.6;
hitboxTakingDamage = noone;


//Visuals
image_speed = 0;	//Always 0 as delta_time
index_speed = 0; //Must be used for use with delta_time

idleSprite = sKeiraIdle;
readySprite = sKeiraIdleReady;

attackSprite = sKeiraPunch0Front;
weaponSprite = -1;
displayWeapon = false;