params ["_player", "_target"];

_player distance _target < 2 &&
{ [_target, "ringing"] call grad_telephone_fnc_callGetStatus &&
(!(player getVariable ['grad_telephone_isCalling', false])) }
