params ["_unit", "_phone1", "_phone2", "_sound"];

if (GRAD_TELEPHONE_DEBUG_MODE) then {
    systemChat str _sound;
};

private _soundID = playSoundUI [_sound, 0.5];
[_phone1, _sound] remoteExec ["grad_telephone_fnc_fakeCallPlaySoundLocal", allPlayers select { _x != player}];

diag_log format ["Debug: fakeCallPlaySound - playing fake sound locally"];

[{
    params ["_unit", "_phone1", "_phone2", "_soundID"];
    soundParams _soundID isEqualTo [] || !([_unit, _phone2] call grad_telephone_fnc_conditionEnd)
}, {
    params ["_unit", "_phone1", "_phone2", "_soundID"];

    // abort sound playback if sound is still playing
    if (soundParams _soundID isNotEqualTo []) then {
        stopSound _soundID;
        diag_log format ["Debug: fakeCallPlaySound - aborted playback as soundobject null"];
    };

    // let server manage fake call end after some random delay
    [{
        params ["_unit", "_phone1", "_phone2", "_soundID"];

        // if call is still running
        if ([_phone2, "calling"] call grad_telephone_fnc_callGetStatus) then {
            [_unit, _phone2] remoteExec ["grad_telephone_fnc_callEnd", 2];
        };
    }, [_unit, _phone1, _phone2, _soundID], (random 5 max 1)] call CBA_fnc_waitAndExecute;
    
}, [_unit, _phone1, _phone2, _soundID]] call CBA_fnc_waitUntilAndExecute;
