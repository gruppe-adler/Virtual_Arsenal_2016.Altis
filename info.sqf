

introdone = false;
titleCut ["", "BLACK FADED", 999];
sleep 1;
name player
hintC ["Kein Feuern in der Schutzzone", "Achte darauf, dass du deine Mitspieler nicht störst", "Viel Spaß"];


hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
		introdone = true;
	};
}];


waituntil {introdone};
// Intro Gruppe Adler

[] Spawn {

titleText ["","PLAIN"];
titleFadeOut 1;
sleep 2;

titleCut ["", "BLACK IN", 1];

waitUntil {introdone};
	["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>Welcome to Virtual Arsenal</t>",0,0,1,1] spawn BIS_fnc_dynamicText;
};
