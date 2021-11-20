// todo: prefilter for static objects
private _allPhones = [];
{
    private _phoneBooths = ([worldSize/2, worldSize/2] nearObjects [_x, worldsize/2]);

    private _phoneBoothsInArea = _phoneBooths inAreaArray trg_phoneZone;
    {
       _allPhones pushBackUnique _x;
    } forEach _phoneBoothsInArea;
} forEach GRAD_TELEPHONE_CLASSNAMES_PHONE;


{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD-LANDLINE: type detected is %1", _type];
    private _isRotary = if (_type == "land_gm_euro_misc_feh_62_e") then { true } else { false };

	[_x, "none", _isRotary, "all", true] call grad_telephone_fnc_addPhone;
} forEach _allPhones;
