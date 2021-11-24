// todo: prefilter for static objects
private _allPhones = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
    {
        _allPhones pushBackUnique _x;
    } forEach _phonesDetected;
} forEach GRAD_TELEPHONE_CLASSNAMES_PHONE;

private _allPhoneBooths = [];
{
    private _classname = _x;
    private _phonesDetected = ([worldSize/2, worldSize/2] nearObjects [_classname, worldsize/2]);
    {
        _allPhoneBooths pushBackUnique _x;
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
