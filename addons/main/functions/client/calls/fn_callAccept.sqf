/*

    callAccept is always executed by player2
    [cursorObject] call grad_telephone_fnc_callAccept;
*/

params ["_unit", "_object"];

private _storedData = [_object] call grad_telephone_fnc_callGetInfo;

_storedData params [
    ["_phone1", objNull],
    ["_phone2", objNull],
    ["_number1", "undefined"],
    ["_number2", "undefined"],
    ["_player1", objNull],
    ["_player2", objNull]
];

diag_log str _storedData;

_phone2 = _object;
_player2 = _unit;

[_phone1, _phone2, _player1, _player2] call grad_telephone_fnc_callSaveInfo;

// if _phone1 is null here than this must be a fake call
private _isFakeCall = isNull _phone1;
[_player2, _phone2] call grad_telephone_fnc_callSetOwner;


if (GRAD_TELEPHONE_DEBUG_MODE) then {
  systemChat format ["Debug: callAccept - %1 received call from %2", _number2, _number1];
};

if (!_isFakeCall) then {
  // activate tfar with own phone
  [_phone2, _number1 + _number2] call grad_telephone_fnc_callPluginActivate;
  [_phone1, "calling"] call grad_telephone_fnc_callSetStatus;
};

[_phone2, "calling"] call grad_telephone_fnc_callSetStatus;

// register call
[_player1, _player2] remoteExec ["grad_telephone_fnc_callRegister", 2];

["GRAD_telephone_callStarted", [_player1, _player2]] call CBA_fnc_globalEvent;