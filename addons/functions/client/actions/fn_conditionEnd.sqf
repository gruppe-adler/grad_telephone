params ["_player", "_target"];

_player distance _target < 2 &&
{ (
    [_target, "calling"] call _fnc_callGetStatus || 
    [_target, "waiting"] call _fnc_callGetStatus || 
    [_target, "busy"] call _fnc_callGetStatus ||
    [_target, "ending"] call _fnc_callGetStatus
) }