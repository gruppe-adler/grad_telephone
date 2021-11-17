params ["_number"];

private _numberArray = [_number] call _fnc_extractNumberFromPrefix;

createdialog "_rscRotary";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn _fnc_rotaryProcessInput;
    waitUntil { scriptDone _processing };
    sleep 1;
} forEach _numberArray;

closeDialog 0;