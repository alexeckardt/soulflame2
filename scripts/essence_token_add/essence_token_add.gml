//
//DESC:
//
//Adds a Token. Ignores any Checks.
//
function essence_token_add(_alignment) {

	var list = Player.essenceTokens;
	
	var ind = 0;
	var tokenInfo = [_alignment, essence_token_get_sprite(_alignment), ind];
	
	ds_list_add(list, tokenInfo);
	
	Player.essenceTokensHolding++;

}