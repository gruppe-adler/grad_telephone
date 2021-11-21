params ["_phone"];

private _identifier = "_runningCall";

private _storedData = _phone getVariable [
    _identifier,
    []
];

// _storedData params ["_phone1", "_phone2", "_number1", "_number2", "_player1", "_player2"];

diag_log format ["GRAD TELEPHONE: callStart - getInfo %1 %2", _identifier, _storedData];

_storedData
