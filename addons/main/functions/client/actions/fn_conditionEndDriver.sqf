params ["_player", "_target"];

([_player] call ace_common_fnc_isAwake) &&
(_player == driver _target) &&
(
    [_target, "calling"] call grad_telephone_fnc_callGetStatus || 
    [_target, "waiting"] call grad_telephone_fnc_callGetStatus || 
    [_target, "busy"] call grad_telephone_fnc_callGetStatus ||
    [_target, "ending"] call grad_telephone_fnc_callGetStatus
)