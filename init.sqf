[] execVM "info.sqf";
[] execVM "grenadeStop.sqf";
[] execvm "protectzone.sqf";
setviewdistance 4000;


// needed for automatic mousewheel loadouts
if (isServer) then {
	call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
	0 = [getpos loadout_fahne] execVM "loadouts\createAutomaticLoadoutsBoxes.sqf";
};




AR3PLAY_ENABLE_REPLAY = false;
// Intro Gruppe Adler   

titleCut ["", "BLACK FADED", 999]; 
[] Spawn {

titleText ["","PLAIN"]; 
titleFadeOut 1;
sleep 2;

titleCut ["", "BLACK IN", 1];

waitUntil {time > 3};
	["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>Welcome to Virtual Arsenal</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
};
