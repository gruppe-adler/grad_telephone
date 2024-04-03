params ["_player", "_target"];

(!([_player] call ace_common_fnc_isAwake)) ||
((_player distance _target) > 3) ||
(
    !([_target, "calling"] call grad_telephone_fnc_callGetStatus)
)