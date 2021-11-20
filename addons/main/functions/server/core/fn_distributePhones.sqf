// todo: prefilter for static objects
private _allPhones = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
    {
        _allPhones pushBackUnique _x; 
    } forEach _phonesDetected;
} forEach GRAD_TELEPHONE_CLASSNAMES_PHONE;


{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD TELEPHONE: type detected is %1", _type];
    private _isRotary = if (_type == "land_gm_euro_misc_feh_62_e") then { true } else { false };

	[_x, _isRotary, "none", "all", true] call grad_telephone_fnc_addPhone;
} forEach _allPhones;
