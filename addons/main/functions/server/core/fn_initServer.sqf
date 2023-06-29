if (!isServer) exitWith {};



private _debugMode = missionNamespace getVariable ["GRAD_TELEPHONE_DEBUG_MODE", false];
missionNamespace setVariable ["GRAD_TELEPHONE_DEBUG_MODE", _debugMode, true];

private _areaCodes = "GRAD_telephone_setting_areacodes" call CBA_settings_fnc_get;
private _prefixes = if (count _areaCodes > 0) then {
    [compile _areaCodes]
  } else {
      [030,040]
  };
missionNamespace setVariable ["GRAD_TELEPHONE_NUMBER_PREFIXES", _prefixes, true];

private _numberLengthSetting = "GRAD_telephone_setting_numberlength" call CBA_settings_fnc_get;
private _numberLength = if (count _numberLengthSetting > 0) then {
    compile _numberLengthSetting
  } else {
      [7,8]
  };
missionNamespace setVariable ["GRAD_TELEPHONE_NUMBER_LENGTH", _numberLength, true];

private _classnamePhones =
[("GRAD_telephone_setting_classnames_digits_phones" call CBA_settings_fnc_get) +
("GRAD_telephone_setting_classnames_rotary_phones" call CBA_settings_fnc_get)];
missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_PHONE",
      ([
            "Land_IPPhone_01_black_F",
            "Land_IPPhone_01_olive_F",
            "Land_IPPhone_01_sand_F",
            "Land_SatellitePhone_F",
            "CUP_phonebox",
            "Item_SatPhone",
            "SatPhone",
            "land_gm_euro_furniture_telephone_01",
            "Land_PhoneBooth_02_malden_F",
            "Land_PhoneBooth_01_malden_F",
            "Land_PhoneBooth_02_F",
            "Land_PhoneBooth_01_F",
            "Land_PhoneBooth_01_lxWS"
      ] +
      _classnamePhones),
true];

private _classnamePhoneBooths =
[("GRAD_telephone_setting_classnames_digits_phonebooths" call CBA_settings_fnc_get) +
("GRAD_telephone_setting_classnames_rotary_phonebooths" call CBA_settings_fnc_get)];
missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_PHONEBOOTHS",
      ([
            "land_gm_euro_misc_feh_62_e",
            "land_gm_euro_misc_telh_78_w"
      ] +
      _classnamePhoneBooths),
true];


missionNamespace setVariable ["GRAD_TELEPHONE_CLASSNAMES_GMN", ["land_gm_wall_gc_borderpost_03", "land_gm_wall_gc_borderpost_04"], true];

// GRAD_TELEPHONE_PHONENUMBERS_HASH = [] call CBA_fnc_hashCreate; // not used?
[{
      [] call grad_telephone_fnc_distributePhones;
}, [], 5] call CBA_fnc_waitAndExecute;

[] remoteExec ["grad_telephone_fnc_addSelfAction", [0,-2] select isDedicated, true];


// special treatment for curator
/*
[{
  {
      if (!isNull getAssignedCuratorLogic _x) then {
            [_x, false, "1337", "Zeus", "none"] call grad_telephone_fnc_addPhone;
      };
    } forEach allPlayers;
}, [], 10] call CBA_fnc_waitAndExecute;
*/

diag_log "GRAD Telephone : initializing phones..";


