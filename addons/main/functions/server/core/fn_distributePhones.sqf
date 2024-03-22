// todo: prefilter for static objects

/* todo */

/*
 private _possiblePhonesMap = nearestTerrainObjects [[worldSize/2, worldSize/2], ["Hide"], worldsize/2];
    {
        if ((getModelInfo _x select 0) in
             [
                "phonebooth_01_f.p3d",
                "phonebooth_02_f.p3d",
                "gm_euro_misc_feh_62_e.p3d",
                "gm_euro_misc_telh_78_w.p3d",
                "phonebooth_01_malden_f.p3d",
                "phonebooth_02_malden_f.p3d"
             ]
        ) then {
            _phonesDetected pushBack _x;
        };
    } forEach _possiblePhonesMap;
*/

private _allPhones = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
   
    {
        _allPhones pushBackUnique _x;

        switch (_classname) do {
            case "land_gm_euro_furniture_telephone_01" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.0473633,0.069458,0], true];  _x setVariable ['grad_telephone_isRotary', true, true]; };
            case "Land_SatellitePhone_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.0786133,0.0467529,-0.148544], true]; };
            case "Item_SatPhone" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [0.0830078,-0.0379333,-0.227635], true]; };
            case "Land_IPPhone_01_black_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.115723,0.0844727,-0.0364208], true]; };
            case "Land_IPPhone_01_olive_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.115723,0.0844727,-0.0364208], true]; };
            case "Land_IPPhone_01_sand_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.115723,0.0844727,-0.0364208], true]; };

            case "Land_PhoneBooth_01_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931], true]; };
            case "Land_PhoneBooth_02_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931], true]; };
            case "Land_PhoneBooth_02_malden_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931], true]; };
            case "Land_PhoneBooth_01_malden_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931], true]; };

            default {  /*...code...*/ };
        };

        private _phoneModel = createSimpleObject ["z\tfar\addons\external_intercom\data\TFAR_handset.p3d", [0,0,0]];
        private _offset = _x getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];
        _phoneModel attachTo [_x, _offset];

        private _cableArray = [_x, _phoneModel] call grad_telephone_fnc_cableCreate;
        _cableArray params ["_cable", "_cableHelper"];
        _x setVariable ["GRAD_telephone_cable", _cable, true];
        _x setVariable ["GRAD_telephone_cableHelper", _cableHelper, true];
        _x setVariable ["GRAD_telephone_phoneModel", _phoneModel, true];
        [_cableHelper] call grad_telephone_fnc_cableBreakEH;

    } forEach _phonesDetected;
} forEach GRAD_TELEPHONE_CLASSNAMES_PHONE;

private _allPhoneBooths = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
    {
        _allPhoneBooths pushBackUnique _x;

        switch (_classname) do {
            case "land_gm_euro_misc_feh_62_e" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.342285,0.395142,1.24925], true]; _x setVariable ['grad_telephone_isRotary', true, true]; };
            case "land_gm_euro_misc_telh_78_w" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.263672,0.437988,1.45601], true]; };
            default {  /*...code...*/ };
        };

        private _phoneModel = createSimpleObject ["z\tfar\addons\external_intercom\data\TFAR_handset.p3d", [0,0,0]];
        private _offset = _x getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];
        _phoneModel attachTo [_x, _offset];

        private _cableArray = [_x, _phoneModel] call grad_telephone_fnc_cableCreate;
        _cableArray params ["_cable", "_cableHelper"];
        _x setVariable ["GRAD_telephone_cable", _cable, true];
        _x setVariable ["GRAD_telephone_cableHelper", _cableHelper, true];
        _x setVariable ["GRAD_telephone_phoneModel", _phoneModel, true];
        [_cableHelper] call grad_telephone_fnc_cableBreakEH;

    } forEach _phonesDetected;

} forEach GRAD_TELEPHONE_CLASSNAMES_PHONEBOOTHS;

{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD TELEPHONE: type detected is %1", _type];

    private _isRotary = if (GRAD_telephone_setting_classnames_rotary_phones find _type > -1) then { true } else {
        if (["land_gm_euro_furniture_telephone_01"] find _type > -1) then {
            true
        } else {
            false
        };
    };

    private _number = _phone getVariable ["grad_telephone_number", "none"];
    private _displayName = _phone getVariable ["grad_telephone_displayName", ""];
    private _canOnlyCallNumber = _phone getVariable ["grad_telephone_canOnlyCallNumber", "all"];
    private _hasPublicPhoneBookEntry = _phone getVariable ["grad_telephone_hasPublicPhoneBookEntryr", true];
    private _canOnlyCallNumber = _phone getVariable ["grad_telephone_canOnlyCallNumber", "all"];
    private _phonePosition = _phone getVariable ["grad_telephone_phonePosition", getPos _phone];
    private _isFakePhone = _phone getVariable ["grad_telephone_isFakePhone", false];
    

	[_x, _isRotary, _number, _displayName, _canOnlyCallNumber, _hasPublicPhoneBookEntry, _phonePosition, false, _isFakePhone] call grad_telephone_fnc_addPhone;
} forEach _allPhones;


{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD TELEPHONE: type detected is %1", _type];
    _x setVariable ["GRAD_telephone_isBooth", true, true];

    private _isRotary = if (GRAD_telephone_setting_classnames_rotary_phonebooths find _type > -1) then { true } else {
        if (["land_gm_euro_misc_feh_62_e"] find _type > -1) then {
            true
        } else {
            false
        };
    };

    private _number = _phone getVariable ["grad_telephone_number", "none"];
    private _displayName = _phone getVariable ["grad_telephone_displayName", ""];
    private _canOnlyCallNumber = _phone getVariable ["grad_telephone_canOnlyCallNumber", "all"];
    private _hasPublicPhoneBookEntry = _phone getVariable ["grad_telephone_hasPublicPhoneBookEntryr", true];
    private _canOnlyCallNumber = _phone getVariable ["grad_telephone_canOnlyCallNumber", "all"];
    private _phonePosition = _phone getVariable ["grad_telephone_phonePosition", getPos _phone];
    private _isFakePhone = _phone getVariable ["grad_telephone_isFakePhone", false];

	[_x, _isRotary, _number, _displayName, _canOnlyCallNumber, _hasPublicPhoneBookEntry, _phonePosition, true, _isFakePhone] call grad_telephone_fnc_addPhone;
} forEach _allPhoneBooths;

diag_log "GRAD Telephone : initializing phones DONE.";
missionNamespace setVariable ["grad_telephone_init", true, true];