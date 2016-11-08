//teleport.sqf
//To teleport player to marker tele

_tele = _this select 0;
_caller = _this select 1;

_caller setPos (getPos (tele));
_caller setDir 330;
hint "Willkommen in der Beförderungs-Arena";