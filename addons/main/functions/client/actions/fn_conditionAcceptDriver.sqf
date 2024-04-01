params ["_player", "_target"];

[_target, "ringing"] call grad_telephone_fnc_callGetStatus &&
(!(player getVariable ['grad_telephone_isCalling', false])) &&
(_player == driver _target)