params ["_player", "_target"];

_player distance _target < 2 &&
{ [_target, "ringing"] call _fnc_callGetStatus &&
(!(player getVariable ['_isCalling', false])) }