/// @desc
paralaxSprites = ds_list_create();

var layerArray = layer_get_all();

//Loop, Find All Paralax Sprites
var s = array_length(layerArray);
for (var i = 0; i < s; i++) {
	
	//Get Name
	var layerId = layerArray[i];
	var layername = layer_get_name(layerId);
	var mutliplier = (string_last_pos("Z", "Z") == 1) ? -1 : 1; //if string ends with "Z", it is a negative mutliplier
	
	//If Name has ParalaxLayer in it
	if (string_pos("Paralax", layername)) {
		
		//Get The Multiplier Integer From The Name; turn it into multiplier
		var paralaxMultiplier = real(string_digits(layername)) / 100 * mutliplier;
		
		//Get All Elements On The Layer
		var layerElements = layer_get_all_elements(layerId);
		var elementCount = array_length(layerElements);
		for (var j = 0; j < elementCount; j++) {
		
			//Add
			var elementID = layerElements[j];
			ds_list_add(paralaxSprites, [elementID, paralaxMultiplier, layer_sprite_get_x(elementID), layer_sprite_get_y(elementID)]);
	
		}
	}
}

paralaxSpriteCount = ds_list_size(paralaxSprites);
