params ["_number"];

private _numberArray = [_number] call _fnc_extractNumberFromPrefix;

createdialog "_rscKeypad";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn _fnc_keypadProcessInput;
    waitUntil { scriptDone _processing };
    sleep sleep (0.1 + (random 0.2));
} forEach _numberArray;

closeDialog 0;