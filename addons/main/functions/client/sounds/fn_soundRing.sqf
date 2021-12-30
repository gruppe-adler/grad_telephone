params ["_dummyObject"];

private _pfhID = [{
    params ["_args", "_handle"];
    _args params ["_dummyObject"];

    if (isNull _dummyObject) exitWith {};

    _dummyObject say3D [(selectRandom ["grad_telephone_sound_phoneRing1", "grad_telephone_sound_phoneRing2"]), 50];

    // systemChat "ring";
    diag_log format ["_dummyObject %1 is ringing", _dummyObject];

}, 3, [_dummyObject]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_dummyObject", "_pfhID"];
    isNull _dummyObject  
},{
    params ["_dummyObject", "_pfhID"];

    [_pfhID] call CBA_fnc_removePerFrameHandler;
    deleteVehicle _dummyObject;

}, [_dummyObject, _pfhID]] call CBA_fnc_waitUntilAndExecute;
