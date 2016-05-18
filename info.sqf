sleep 2;
name player
hintC ["Kein Feuern in der Schutzzone", "Achte darauf, dass du deine Mitspieler nicht störst", "Viel Spaß"];


hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];