params [["_phone1", objNull], ["_phone2", objNull], ["_player1", objNull], ["_player2", objNull]];

private _number1 = _phone1 getVariable ['grad_telephone_NUMBER_ASSIGNED', "no number"];
private _number2 = _phone2 getVariable ['grad_telephone_NUMBER_ASSIGNED', "no number"];

private _identifier = "_runningCall";

_phone1 setVariable [
    _identifier,
    [_phone1, _phone2, _number1, _number2, _player1, _player2],
    true
];

_phone2 setVariable [
    _identifier,
    [_phone1, _phone2, _number1, _number2, _player1, _player2],
    true
];

diag_log format ["callStart - saveInfo %1 %2", _identifier, [_phone1, _phone2, _number1, _number2, _player1, _player2]];
