//
//DESC:
//
//
//
function essence_increment(_alignment, amount) {

	//Decide Variaible Name
	var essenceVarName = "";
	if (_alignment == essence.order) {
		essenceVarName = "orderEssence";
	} else {
		if (_alignment == essence.chaos) {
			essenceVarName = "chaosEssence";
		} else {
			essenceVarName = "balanceEssence";
		}
	}

	//
	//Get Ppayer Vars Lol
	var pId = Player.id;
	var currentValue = variable_instance_get(pId, essenceVarName);
	var essenceToTokenAmount = Player.essenceForToken;
	var essenceTokenMaxCount = Player.essenceTokensCanHold;
	
	/*
	//
	//Increment
	currentValue += amount;
	
	//
	//Add Tokens (While because if I gain a big ton of mana in one hit)
	while (currentValue >= essenceToTokenAmount) {
		
		//Wait Until List Not Full
		if (Player.essenceTokensHolding < essenceTokenMaxCount) {
			//Must be dynamic, otherwise doesn't update
			
			//Reduce Amount
			currentValue -= essenceTokenMaxCount;
			essence_token_add_percent(_alignment, )
			
		//Exit Loop
		} else {
			break;	
		}
	}
	
	
	//Update Real Variaible
	variable_instance_set(pId, essenceVarName, currentValue);*/
}