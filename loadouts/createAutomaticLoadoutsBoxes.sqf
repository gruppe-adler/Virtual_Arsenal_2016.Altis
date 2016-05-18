// just to be sure
if (!isServer) exitWith {};

_pos = _this select 0;

// flecktarn
_ger_flecktarn_loadouts = [
"Flecktarn Loadouts",
"flecktarn.paa",
[
["ger_fleck_default","Grundausrüstung ohne Waffe"],
["ger_fleck_medic","Sanitäter"],
["ger_fleck_marksman","Gruppenscharfschütze"],
["ger_fleck_lmg","LMG"],
["ger_fleck_grenadier","Grenadier"],
["ger_fleck_rifleman","Schütze"]
]
];

// tropentarn
_ger_tropentarn_loadouts = [
"Tropentarn Loadouts",
"tropentarn.paa",
[
["ger_tropen_default","Grundausrüstung ohne Waffe"],
["ger_tropen_medic","Sanitäter"],
["ger_tropen_marksman","Gruppenscharfschütze"],
["ger_tropen_lmg","LMG"],
["ger_tropen_grenadier","Grenadier"],
["ger_tropen_rifleman","Schütze"]
]
];

// US OCP
_us_ocp_loadouts = [
"OCP Loadouts",
"ocp.paa",
[
["us_ocp_default","Grundausrüstung ohne Waffe"],
["us_ocp_medic","Sanitäter"],
["us_ocp_marksman","Gruppenscharfschütze"],
["us_ocp_lmg","LMG"],
["us_ocp_grenadier","Grenadier"],
["us_ocp_rifleman","Schütze"]
]
];

// US UCP
_us_ucp_loadouts = [
"UCP Loadouts",
"ucp.paa",
[
["us_ucp_default","Grundausrüstung ohne Waffe"],
["us_ucp_medic","Sanitäter"],
["us_ucp_marksman","Gruppenscharfschütze"],
["us_ucp_lmg","LMG"],
["us_ucp_grenadier","Grenadier"],
["us_ucp_rifleman","Schütze"]
]
];



// array aller loadouts
_loadouts = [_ger_flecktarn_loadouts,_ger_tropentarn_loadouts,_us_ocp_loadouts,_us_ucp_loadouts];


/* 
 -- dont edit below here! --
*/
_clearContent = {
	_boxToClear = _this select 0;
	clearItemCargoGlobal _boxToClear;	
	clearBackpackCargoGlobal _boxToClear;	
	clearWeaponCargoGlobal _boxToClear;	
	clearMagazineCargoGlobal _boxToClear;	
};



_addAction = {
	_actionBox = _this select 0;
	_actionLoadout = _this select 1;

	_actionTitle = _actionLoadout select 0;
	_texture = _actionLoadout select 1;
	_loadoutArray = _actionLoadout select 2;

	diag_log format ["_texture is %1", _actionLoadout select 1];
	_actionBox setObjectTextureGlobal [0, ("loadouts\pics\" + _texture)];
	// diag_log format ["_actionTitle of 0 is %1",_actionTitle select 0];
	// diag_log format ["_loadoutArray of 0 is %1",(_loadoutArray select 0) select 1];

	// [[[_actionBox,"<t color=""#6caacc"">" + (_actionTitle select 0),"loadouts\automatic_loadouts\hintOnlyHeadline.sqf"],"loadouts\_client_attachBoxAction.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	[[[_actionBox,"<t color=""#6caacc"" size=""2"">" + _actionTitle],"loadouts\_client_attachBoxHint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	{
		_loadoutDescription = _x select 1;
		_path = _x select 0;
		// diag_log format ["descr is %1",_loadoutDescription];
		// diag_log format ["path is %1",_path];

		_pathToLoadout = "loadouts\automatic_loadouts\" + _path + ".sqf";
		[[[_actionBox,"<t color=""#93E352"">" + _loadoutDescription,_pathToLoadout],"loadouts\_client_attachBoxAction.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	} forEach _loadoutArray;
};

_createCrate = {
	_centerpos = _this select 0;
	_loadout = _this select 1;
	_distance = _this select 2;
	_direction = _this select 3;

	_calcPos = [_centerpos, _distance, _direction] call BIS_fnc_relPos;
	// _calcPos = [_centerpos, [5,15],random 360] call SHK_pos;

	_newbox = createVehicle ["Land_InfoStand_V1_F", _calcPos, [], 0, "NONE"];
	_newbox setDir (_direction - 90);

	// diag_log format ["_newbox created at %1", _calcPos];
	// diag_log format ["_content will be %1", _loadout];
	[_newbox] call _clearContent;
	[_newbox,_loadout] call _addAction;
};


_modifier = 3;
// create circle of boxes
{

	[_pos,_x,_modifier,120] call _createCrate;
	_modifier = _modifier + 3;

} forEach _loadouts;