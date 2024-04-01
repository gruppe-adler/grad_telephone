params ["_dummyObject", "_vehicle"];

private _pfhID = [{
    params ["_args", "_handle"];
    _args params ["_dummyObject", "_vehicle"];

    if (isNull _dummyObject) exitWith {};

    if (player in crew _vehicle) then {
	    // function runs local only anyway
        playSound (selectRandom ["grad_telephone_sound_phoneRing1", "grad_telephone_sound_phoneRing2"]);
    
        // systemChat "ring";
        diag_log format ["_vehicle %1 is ringing", _vehicle];
    };

}, 3, [_dummyObject, _vehicle]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_dummyObject", "_pfhID"];
    isNull _dummyObject  
},{
    params ["_dummyObject", "_pfhID"];

    [_pfhID] call CBA_fnc_removePerFrameHandler;
    deleteVehicle _dummyObject;

}, [_dummyObject, _pfhID]] call CBA_fnc_waitUntilAndExecute;
