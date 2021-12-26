// todo: prefilter for static objects
private _allPhones = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
    {
        _allPhones pushBackUnique _x;

        switch (_classname) do { 
            case "land_gm_euro_furniture_telephone_01" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.0473633,0.069458,0]]; }; 
            case "Land_SatellitePhone_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.0786133,0.0467529,-0.148544]]; }; 
            case "Item_SatPhone" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [0.0830078,-0.0379333,-0.227635]]; }; 
            case "Land_IPPhone_01_black_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.115723,0.0844727,-0.0364208]]; }; 
            case "Land_IPPhone_01_olive_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.115723,0.0844727,-0.0364208]]; }; 
            case "Land_IPPhone_01_sand_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.115723,0.0844727,-0.0364208]]; }; 

            default {  /*...code...*/ }; 
        };
    } forEach _phonesDetected;    
} forEach GRAD_TELEPHONE_CLASSNAMES_PHONE;

private _allPhoneBooths = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
    {
        _allPhoneBooths pushBackUnique _x;

        switch (_classname) do { 
            case "land_gm_euro_misc_feh_62_e" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.342285,0.395142,1.24925]]; }; 
            case "land_gm_euro_misc_telh_78_w" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.263672,0.437988,1.45601]]; }; 

            case "Land_PhoneBooth_01_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931]]; }; 
            case "Land_PhoneBooth_02_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931]]; }; 
            case "Land_PhoneBooth_02_malden_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931]]; }; 
            case "Land_PhoneBooth_01_malden_F" : { _x setVariable ["GRAD_Telephone_phoneCablePlugOffset", [-0.159668,0.092041,0.409931]]; }; 

            default {  /*...code...*/ }; 
        };
    } forEach _phonesDetected;

} forEach GRAD_TELEPHONE_CLASSNAMES_PHONEBOOTHS;

{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD TELEPHONE: type detected is %1", _type];
    private _isRotary = if (GRAD_telephone_setting_classnames_rotary_phones find _type > -1) then { true } else { false };

	[_x, _isRotary, "none", "all", true, [0,0,0], false] call grad_telephone_fnc_addPhone;
} forEach _allPhones;


{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD TELEPHONE: type detected is %1", _type];
    private _isRotary = if (GRAD_telephone_setting_classnames_rotary_phonebooths find _type > -1) then { true } else { false };

	[_x, _isRotary, "none", "all", true, [0,0,0], true] call grad_telephone_fnc_addPhone;
} forEach _allPhoneBooths;
