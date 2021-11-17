// storedData
private _storedData = player getVariable ["_hookingCache", []];

_storedData params [
    ["_phone1", objNull], 
    ["_phone2", objNull], 
    ["_number1", "undefined"], 
    ["_number2", "undefined"], 
    ["_player1", objNull], 
    ["_player2", objNull]
];



// tfar
[_phone1, _number1 + _number2] call _fnc_callPluginDeactivate;

// debug whats happening
systemChat "hanging up from hooking";

[] call _fnc_soundHookEnd;

player setVariable ['_hooking', false];
player setVariable ['_hookingCache', []];