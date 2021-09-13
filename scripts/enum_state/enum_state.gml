//
//DESC:
//
//
//

enum state {
	base,
	climb,
	hurt,
	
	//Change With Weapons
	
	light_neutral,			//Quick Jabs and Round House Kicks
	light_horizontal,		//Heavy Attacks (heavy Swing, Heavy Kick)
	light_up,				//"Slap" Swing Upwards
	light_down,				//Leg Sweep (Spiderman)
	
	light_air_neutral,		//
	light_air_horizontal,	//Front House Kick
	light_air_up,			//Sky Upper Cut (To Hit Things Above)
	light_air_down,			//Kick Jump (If Hits enemy it will jump again)
	
	
	//Constant
	
	//Magic Moves, Require Mana and Skill Unlock
	special_neutral,		//
	special_horizontal,		// 
	special_up,				// Flaming Sky Uppercut
	special_down,			// Wild Fire
	
	special_air_neutral,	//
	special_air_horizontal,	// 
	special_air_up,			// Rocket Boost Upwards (A Second Double Jump Option)
	special_air_down,		// Ground Pound
	
	dash,
	
	blocking, // Hold, Blocks Incoming Attacks if correct type vs weapon
	
	height
}