#include "..\..\..\config.hpp"

if (!isServer) exitWith {};

missionNamespace setVariable ["_CLASSNAMES_PHONE", _CLASSNAMES_PHONE, true]; // yes, actually necessary bc its only included here otherwise
missionNamespace setVariable ["_CLASSNAMES_GMN", _CLASSNAMES_GMN, true];
missionNamespace setVariable ["_ALLNUMBERS", [], true];
missionNamespace setVariable ["_ALLPHONES", [], true];
missionNamespace setVariable ["_CALLS_RUNNING", [], true];

_PHONENUMBERS_HASH = [] call CBA_fnc_hashCreate;

[] call grad_telephone_fnc_distributePhones;


[] remoteExec ["_fnc_addSelfAction", [0,-2] select isDedicated, true];


// special treatment for curator
[{


{
      if (_x getVariable ["GRAD_nvacommand_isCommander", false]) then {
            [_x, "1337", false, "none"] call grad_telephone_fnc_addPhone;
      };
    } forEach allPlayers;
}, [], 10] call CBA_fnc_waitAndExecute;
