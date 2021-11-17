params ["_object"];

[{
    params ["_args", "_handle"];
    _args params ["_object"];

    if ([_object, "idle"] call _fnc_callGetStatus) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    [selectRandom ["_phoneBusy1", "_phoneBusy2", "_phoneBusy3"]] call BIS_fnc_playSound;
    systemChat "ending beep";

}, 0.5, [_object]] call CBA_fnc_addPerFrameHandler;