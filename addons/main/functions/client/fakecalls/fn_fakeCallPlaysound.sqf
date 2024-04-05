params ["_unit", "_phone1", "_phone2", "_sound"];

if (GRAD_TELEPHONE_DEBUG_MODE) then {
    systemChat str _sound;
};

private _soundObject = playSound [_sound, true, 0];
[_phone1, _sound] remoteExec ["grad_telephone_fnc_fakeCallPlaySoundLocal", allPlayers select { _x != player}];

diag_log format ["Debug: fakeCallPlaySound - playing fake sound locally"];

[{
    params ["_unit", "_phone1", "_phone2", "_soundObject"];
    isNull _soundObject || !([_unit, _phone2] call grad_telephone_fnc_conditionEnd)
}, {
    params ["_unit", "_phone1", "_phone2", "_soundObject"];

    // abort sound playback
    if (!isNull _soundObject) then {
        deleteVehicle _soundObject;
        diag_log format ["Debug: fakeCallPlaySound - aborted playback as soundobject null"];
    };

    // let server manage fake call end after some random delay
    [{
        params ["_unit", "_phone1", "_phone2", "_soundObject"];

        // if call is still running
        if ([_phone2, "calling"] call grad_telephone_fnc_callGetStatus) then {
            [_unit, _phone2] remoteExec ["grad_telephone_fnc_callEnd", 2];
        };
    }, [_unit, _phone1, _phone2, _soundObject], (random 5 max 1)] call CBA_fnc_waitAndExecute;
    
}, [_unit, _phone1, _phone2, _soundObject]] call CBA_fnc_waitUntilAndExecute;
