params ["_number"];

private _numberArray = [_number] call grad_telephone_fnc_extractNumberFromPrefix;

createdialog "_rscKeypad";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn grad_telephone_fnc_keypadProcessInput;
    waitUntil { scriptDone _processing };
    sleep sleep (0.1 + (random 0.2));
} forEach _numberArray;

closeDialog 0;