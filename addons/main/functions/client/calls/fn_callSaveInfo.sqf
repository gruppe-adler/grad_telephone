params [["_phone1", objNull], ["_phone2", objNull], ["_player1", objNull], ["_player2", objNull]];

private _number1 = _phone1 getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', "no number"];
private _number2 = _phone2 getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', "no number"];

private _identifier = "grad_telephone_runningCall";

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

diag_log format ["GRAD TELEPHONE: callStart - saveInfo %1 %2", _identifier, [_phone1, _phone2, _number1, _number2, _player1, _player2]];

/* 20:29:43 "GRAD TELEPHONE: callStart - saveInfo 
            grad_telephone_runningCall [
                C Alpha 1-1:1 (nomisum),
                1d22aa39600# 1820: phonebooth_02_malden_f.p3d,
                ""no number"",""401321592"",
                C Alpha 1-1:1 (nomisum),
                <NULL-object>]"
*/