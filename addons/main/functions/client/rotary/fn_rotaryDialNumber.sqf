params ["_number"];

private _numberArray = [_number] call grad_telephone_fnc_extractNumberFromPrefix;

createdialog "grad_telephone_rscRotary";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn grad_telephone_fnc_rotaryProcessInput;
    waitUntil { scriptDone _processing };
    sleep 1;
} forEach _numberArray;

closeDialog 0;