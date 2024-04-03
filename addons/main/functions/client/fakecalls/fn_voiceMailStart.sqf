/*

	plays a sound on the client as if a real person is calling

*/

params ["_unit", "_phone1", "_sound"];

if (GRAD_TELEPHONE_DEBUG_MODE) then {
    systemChat str _sound;
};

private _soundObject = playSound [_sound, true, 0];

[_phone1, "calling"] call grad_telephone_fnc_callSetStatus;

[{
    params ["_unit", "_phone1", "_soundObject"];
    isNull _soundObject || ([_unit, _phone1] call grad_telephone_fnc_conditionEnd)
}, {
    params ["_unit", "_phone1", "_soundObject"];

    // abort sound playback
    if (!isNull _soundObject) then {
        deleteVehicle _soundObject;

		if (GRAD_TELEPHONE_DEBUG_MODE) then {
			systemChat format ["Debug: voiceMailStart - aborted sound on %1", _phone1];
		};
    };

    // let server manage fake call end after some random delay
	// sound should have ended already
    [{
        params ["_unit", "_phone1", "_soundObject"];

        // if call is still running
        if ([_phone1, "calling"] call grad_telephone_fnc_callGetStatus) then {
            [_unit, _phone1] remoteExec ["grad_telephone_fnc_callEnd", 2];			

			if (GRAD_TELEPHONE_DEBUG_MODE) then {
				systemChat format ["Debug: voiceMailStart - ended call after random delay"];
			};
        };

    }, [_unit, _phone1, _soundObject], (random 5 max 1)] call CBA_fnc_waitAndExecute;
	
    
}, [_unit, _phone1, _soundObject]] call CBA_fnc_waitUntilAndExecute;
