/*

    fakeCallAccept is executed by Gamemaster or other entities
    [cursorObject] call grad_telephone_fnc_fakeCallAccept;
*/

params ["_object"];

private _storedData = [_object] call grad_telephone_fnc_callGetInfo;

_storedData params [
    ["_phone1", objNull],
    ["_phone2", objNull],
    ["_number1", "undefined"],
    ["_number2", "undefined"],
    ["_player1", objNull],
    ["_player2", objNull]
];

_phone2 = _object;
_player2 = player;

[_phone1, _phone2, _player1, _player2] call grad_telephone_fnc_callSaveInfo;


[player, _phone2] call grad_telephone_fnc_callSetOwner;

if (GRAD_TELEPHONE_DEBUG_MODE) then {
  systemChat format ["Debug: callAccept - %1 received call from %2", _number2, _number1];
};

[_phone2, "calling"] call grad_telephone_fnc_callSetStatus;
[_phone1, "calling"] call grad_telephone_fnc_callSetStatus;

// register call
[_phone1, _phone2] remoteExec ["grad_telephone_fnc_callRegister", 2];


[_player1, _phone1] remoteExec ["grad_telephone_fnc_fakeCallsPlaysound", _player1, "alarm", true];

[{
    params ["_phone2"];
    [_phone2] call grad_telephone_fnc_fakeCallEnd;
}, [_phone2], 5] call CBA_fnc_waitAndExecute;