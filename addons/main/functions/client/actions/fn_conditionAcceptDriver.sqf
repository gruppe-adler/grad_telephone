params ["_player", "_target"];

[_player] call ace_common_fnc_isAwake &&
[_target, "ringing"] call grad_telephone_fnc_callGetStatus &&
(!(_player getVariable ['grad_telephone_isCalling', false])) &&
(_player == driver _target)
