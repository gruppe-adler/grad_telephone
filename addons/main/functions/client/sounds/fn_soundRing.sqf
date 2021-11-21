params ["_object"];

[{
    params ["_args", "_handle"];
    _args params ["_object"];

    if (isNull _object) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _object say3D [(selectRandom ["grad_telephone_sound_phoneRing1", "grad_telephone_sound_phoneRing2"]), 50];
    // systemChat "ring";
    diag_log format ["_object %1 is ringing", _object];

}, 3, [_object]] call CBA_fnc_addPerFrameHandler;
