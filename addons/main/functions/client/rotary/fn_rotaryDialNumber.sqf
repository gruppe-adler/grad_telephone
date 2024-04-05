params ["_number"];

// detect abortion in spawned script
missionNamespace setVariable ["GRAD_telephone_dialingAborted", false];

private _numberArray = [_number] call grad_telephone_fnc_extractNumberFromPrefix;

createdialog "grad_telephone_rscRotary";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn grad_telephone_fnc_rotaryProcessInput;
    waitUntil { scriptDone _processing };
    sleep (random 0.5);
    if (!dialog) exitWith {
        missionNamespace setVariable ["GRAD_telephone_dialingAborted", true];
    };
} forEach _numberArray;

closeDialog 0;