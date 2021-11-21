if (!isServer) exitWith {};

missionNamespace setVariable ["GRAD_TELEPHONE_DEBUG_MODE", true, true];
missionNamespace setVariable ["GRAD_TELEPHONE_NUMBER_PREFIXES",
  if (count GRAD_telephone_setting_areacodes > 0) then {
    [compile GRAD_telephone_setting_areacodes]
  } else {
      [030,040]
  },
true];
missionNamespace setVariable ["GRAD_TELEPHONE_NUMBER_LENGTH",
  if (count GRAD_telephone_setting_numberlength > 0) then {
    compile GRAD_telephone_setting_numberlength
  } else {
      [7,8]
  },
true];
missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_PHONE",
      [
            "Land_IPPhone_01_black_F",
            "Land_IPPhone_01_olive_F",
            "Land_IPPhone_01_sand_F",
            "Land_SatellitePhone_F",
            "CUP_phonebox",
            "Item_SatPhone",
            "SatPhone"
      ] +
      GRAD_telephone_setting_classnames_digits_phones +
      GRAD_telephone_setting_classnames_rotary_phones,
true];
missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_PHONEBOOTHS",
      [
            "land_gm_euro_misc_feh_62_e",
            "land_gm_euro_misc_telh_78_w"
            "Land_PhoneBooth_01_lxWS",
            "Land_PhoneBooth_02_malden_F",
            "Land_PhoneBooth_01_malden_F",
            "Land_PhoneBooth_02_F",
            "Land_PhoneBooth_01_F"
      ] +
      GRAD_telephone_setting_classnames_digits_phonebooths +
      GRAD_telephone_setting_classnames_rotary_phonebooths,
true];
missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_GMN", ["land_gm_wall_gc_borderpost_03", "land_gm_wall_gc_borderpost_04"], true];

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
            [_x, false, "1337", "none"] call grad_telephone_fnc_addPhone;
      };
    } forEach allPlayers;
}, [], 10] call CBA_fnc_waitAndExecute;
