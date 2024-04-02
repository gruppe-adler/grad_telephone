params ["_player", "_target"];

[_player] call ace_common_fnc_isAwake &&
_player distance _target < 2 &&
{ [_target, "idle"] call grad_telephone_fnc_callGetStatus &&
(!(player getVariable ['grad_telephone_isCalling', false])) } &&
(_target getVariable ['grad_telephone_directConnect', 'all'] != 'all') &&
(_target getVariable ['grad_telephone_directConnect', 'all'] != 'none')
