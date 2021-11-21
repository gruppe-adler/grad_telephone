params ["_object"];

[{
    params ["_args", "_handle"];
    _args params ["_object"];

    if ([_object, "idle"] call grad_telephone_fnc_callGetStatus) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    [selectRandom ["grad_telephone_sound_phoneBusy1", "grad_telephone_sound_phoneBusy2", "grad_telephone_sound_phoneBusy3"]] call BIS_fnc_playSound;

    if (GRAD_TELEPHONE_DEBUG_MODE) then {
      systemChat "ending beep";
    };

}, 0.5, [_object]] call CBA_fnc_addPerFrameHandler;
