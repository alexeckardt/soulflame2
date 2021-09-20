//
//DESC:
//
//
//
function essence_token_add(_alignment) {

	var list = Player.essenceTokens;
	
	var currentlyExpending = false;
	var tokenInfo = [_alignment, spr, 0, 0];
	
	ds_list_add(list, tokenInfo);

}