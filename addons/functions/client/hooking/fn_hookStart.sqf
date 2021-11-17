params ["_callerPhoneObject", "_receiverPhoneObject"];

// if no number is assigned
// if (count _callerNumber isEqualTo 0) exitWith { diag_log "error, no number"; };

systemChat format ["hookStart - getInfo %1 %2", _callerPhoneObject, _receiverPhoneObject];

private _storedData = [
    _callerPhoneObject
] call _fnc_callGetInfo;

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
    [] remoteExec ["_fnc_soundHookRemote", _player1];
};
if (!isNull _player2) then {
    [] remoteExec ["_fnc_soundHookRemote", _player2];
};

[] call _fnc_soundHookStart;

systemChat format ["hookStart - hooking into call from %1 to %2", _number1, _number2];

// activate tfar stuff
[_phone1, _number1 + _number2] call _fnc_callPluginActivate;

player setVariable ["_hooking", true];
player setVariable ["_hookingCache", _storedData];