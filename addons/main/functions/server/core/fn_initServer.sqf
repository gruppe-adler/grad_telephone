if (!isServer) exitWith {};

#define GRAD_TELEPHONE_DEBUG_MODE true

#define GRAD_TELEPHONE_NUMBER_PREFIXES [0030]
#define GRAD_TELEPHONE_NUMBER_LENGTH [7,8]

#define GRAD_TELEPHONE_CLASSNAMES_PHONE ["land_gm_euro_misc_feh_62_e", "land_gm_euro_misc_telh_78_w"]
#define GRAD_TELEPHONE_CLASSNAMES_GMN ["land_gm_wall_gc_borderpost_03", "land_gm_wall_gc_borderpost_04"]


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
