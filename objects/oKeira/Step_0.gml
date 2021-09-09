/// @desc


//Collide and Move
xpos += hSpeed;
ypos += vSpeed;
x = floor(xpos);
y = floor(ypos);

//Change Movement
var hInput = Input.right - Input.left;
runAcc = lerp(runAcc, hInput, traction);
hSpeed = runAcc*minRunSpeed + hMomentum; 

//
