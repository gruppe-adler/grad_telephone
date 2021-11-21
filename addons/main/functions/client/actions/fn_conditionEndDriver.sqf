params ["_player", "_target"];

_player distance _target < 2 &&
{ (
    [_target, "calling"] call grad_telephone_fnc_callGetStatus || 
    [_target, "waiting"] call grad_telephone_fnc_callGetStatus || 
    [_target, "busy"] call grad_telephone_fnc_callGetStatus ||
    [_target, "ending"] call grad_telephone_fnc_callGetStatus
) } &&
(_player == driver _target)