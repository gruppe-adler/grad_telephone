params ["_phone"];

if (typeName _phone == "STRING") exitWith {
    diag_log format ["GRAD TELEPHONE: callGetInfo - PANIC EXIT, _phone is string %1", _phone];
};

private _identifier = "grad_telephone_runningCall";

private _storedData = _phone getVariable [
    _identifier,
    [] 
];

if (count _storedData < 1) then {
    _storedData = [
        objNull, objNull, "no number", _phone getVariable ["grad_telephone_number_assigned", "test"], objNull, objNull
    ];
};

// _storedData params ["_phone1", "_phone2", "_number1", "_number2", "_player1", "_player2"];

diag_log format ["GRAD TELEPHONE: callStart - getInfo %1 %2", _identifier, _storedData];

_storedData
