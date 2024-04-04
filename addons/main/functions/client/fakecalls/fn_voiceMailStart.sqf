/*

	plays a sound on the client as if a real person is calling

*/

params ["_unit", "_phone1", "_phone2", "_sound"];

if (GRAD_TELEPHONE_DEBUG_MODE) then {
    systemChat str _sound;
    diag_log format ["Debug: voiceMailStart - starting playback on %1, called by %2", _phone2, _phone1];
};

private _soundObject = playSound [_sound, true, 0];

[_phone1, "calling"] call grad_telephone_fnc_callSetStatus;
[_phone2, "calling"] call grad_telephone_fnc_callSetStatus;

[{
    params ["_unit", "_phone1", "_phone2", "_soundObject"];
    isNull _soundObject || ([_unit, _phone1] call grad_telephone_fnc_conditionEndVoiceMail)
}, {
    params ["_unit", "_phone1", "_phone2", "_soundObject"];

    // abort sound playback
    if (!isNull _soundObject) then {
        deleteVehicle _soundObject;

		if (GRAD_TELEPHONE_DEBUG_MODE) then {
			systemChat format ["Debug: voiceMailStart - aborted sound on %1", _phone2];
            diag_log format ["Debug: voiceMailStart - aborted sound on %1", _phone2];
		};
    };

    // let server manage fake call end after some random delay
	// sound should have ended already
    [{
        params ["_unit", "_phone1", "_phone2", "_soundObject"];

        // if own call still running
        /*
        if ([_phone1, "calling"]) call grad_telephone_fnc_callGetStatus) then {
            [_player, _phone1] call grad_telephone_fnc_callEnd;
        };
        */

        // if call is still running
        if ([_phone1, "calling"] call grad_telephone_fnc_callGetStatus) then {
            [_phone1, "remoteEnd"] call grad_telephone_fnc_callSetStatus;
            [_unit, _phone1] remoteExec ["grad_telephone_fnc_callEnd", 2];			

			if (GRAD_TELEPHONE_DEBUG_MODE) then {
				systemChat format ["Debug: voiceMailStart - ended call after random delay"];
                diag_log format ["Debug: voiceMailStart - ended call after random delay"];
			};
        };

        if ([_phone2, "calling"] call grad_telephone_fnc_callGetStatus) then {
            [_phone2, "remoteEnd"] call grad_telephone_fnc_callSetStatus;
            [_unit, _phone2] remoteExec ["grad_telephone_fnc_callEnd", 2];			

			if (GRAD_TELEPHONE_DEBUG_MODE) then {
				systemChat format ["Debug: voiceMailStart - ended call after random delay"];
                diag_log format ["Debug: voiceMailStart - ended call after random delay"];
			};
        };

    }, [_unit, _phone1, _phone2, _soundObject], (random 5 max 1)] call CBA_fnc_waitAndExecute;
	
    
}, [_unit, _phone1, _phone2, _soundObject]] call CBA_fnc_waitUntilAndExecute;
