params ["_callerPhoneObject", "_receiverPhoneObject"];

// if no number is assigned
// if (count _callerNumber isEqualTo 0) exitWith { diag_log "error, no number"; };

if (GRAD_TELEPHONE_DEBUG_MODE) then {
  systemChat format ["hookStart - getInfo %1 %2", _callerPhoneObject, _receiverPhoneObject];
};

private _storedData = [
    _callerPhoneObject
] call grad_telephone_fnc_callGetInfo;

_storedData params [
    ["_phone1", objNull],
    ["_phone2", objNull],
    ["_number1", "undefined"],
    ["_number2", "undefined"],
    ["_player1", objNull],
    ["_player2", objNull]
];



// let server handle receiver status
if (!isNull _player1) then {
    [] remoteExec ["grad_telephone_fnc_soundHookRemote", _player1];
};
if (!isNull _player2) then {
    [] remoteExec ["grad_telephone_fnc_soundHookRemote", _player2];
};

[] call grad_telephone_fnc_soundHookStart;

if (GRAD_TELEPHONE_DEBUG_MODE) then {
  systemChat format ["hookStart - hooking into call from %1 to %2", _number1, _number2];
};
// activate tfar stuff
[_phone1, _number1 + _number2] call grad_telephone_fnc_callPluginActivate;

player setVariable ["grad_telephone_hooking", true];
player setVariable ["grad_telephone_hookingCache", _storedData];
