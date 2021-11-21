// storedData
private _storedData = player getVariable ['grad_telephone_hookingCache', []];

_storedData params [
    ["_phone1", objNull],
    ["_phone2", objNull],
    ["_number1", "undefined"],
    ["_number2", "undefined"],
    ["_player1", objNull],
    ["_player2", objNull]
];



// tfar
[_phone1, _number1 + _number2] call grad_telephone_fnc_callPluginDeactivate;

// debug whats happening
if (GRAD_TELEPHONE_DEBUG_MODE) then {
  systemChat "hanging up from hooking";
};

[] call grad_telephone_fnc_soundHookEnd;

player setVariable ['grad_telephone_hooking', false];
player setVariable ['grad_telephone_hookingCache', []];
