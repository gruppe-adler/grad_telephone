params ["_player", "_phone"];

private _phoneModel = _phone getVariable ["GRAD_telephone_phoneModel", objNull];
_player playActionNow "radioAnims_Stop";

if (!isNull _phoneModel) then {
    private _offset = _phone getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];
    _phoneModel attachTo [_phone, _offset];
};