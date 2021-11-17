#include "..\..\..\config.hpp"

if (!isServer) exitWith {};

missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_PHONE", _CLASSNAMES_PHONE, true]; // yes, actually necessary bc its only included here otherwise
missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_GMN", _CLASSNAMES_GMN, true];
missionNamespace setVariable ["GRAD_TELEPHONE_ALLNUMBERS", [], true];
missionNamespace setVariable ["GRAD_TELEPHONE_ALLPHONES", [], true];
missionNamespace setVariable ["GRAD_TELEPHONE_CALLS_RUNNING", [], true];

GRAD_TELEPHONE_PHONENUMBERS_HASH = [] call CBA_fnc_hashCreate;

[] call grad_telephone_fnc_distributePhones;


[] remoteExec ["grad_telephone_fnc_addSelfAction", [0,-2] select isDedicated, true];


// special treatment for curator
[{


{
      if (_x getVariable ["GRAD_nvacommand_isCommander", false]) then {
            [_x, "1337", false, "none"] call grad_telephone_fnc_addPhone;
      };
    } forEach allPlayers;
}, [], 10] call CBA_fnc_waitAndExecute;
