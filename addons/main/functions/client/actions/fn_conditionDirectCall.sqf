params ["_player", "_target"];

_player distance _target < 2 &&
{ [_target, "idle"] call grad_telephone_fnc_callGetStatus &&
(!(player getVariable ['grad_telephone_isCalling', false])) } &&
(_target getVariable ['grad_telephone_directConnect', "all"] != "all") &&
(_target getVariable ['grad_telephone_directConnect', "all"] != "none")
&&
(_player == driver _target)