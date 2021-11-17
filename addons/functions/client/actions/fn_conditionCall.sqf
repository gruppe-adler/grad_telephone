params ["_player", "_target"];

_player distance _target < 2 &&
{ [_target, "idle"] call _fnc_callGetStatus && 
(!(player getVariable ['_isCalling', false])) } &&
(_target getVariable ["_directConnect", "all"] == "all")