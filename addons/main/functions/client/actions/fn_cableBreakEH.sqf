params ["_cableHelper"];

_cableHelper addEventHandler ["RopeBreak", {
    params ["_object1", "_rope", "_object2"];

    private _phone = _object1 getVariable ["GRAD_telephone_phone", objNull];
    private _offset = _phone getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];
    private _phoneModel = _phone getVariable ["GRAD_telephone_phoneModel", objNull];

    detach _phoneModel;
    _phoneModel attachTo [_phone, _offset];

    if (!isNull _phoneModel) then {
        _object1 ropeDetach _phoneModel;
        [_phoneModel, [0,0,0], [0,0,-1]] ropeAttachTo _rope;
    };

    if (isPlayer _object2) then {
        [_object2, "radioAnims_Stop"] remoteExec ["playActionNow", _object2];
        [_object2, _phone] remoteExec ["grad_telephone_fnc_callEnd", _object2];
    };

    systemChat "rope break";
    diag_log format ["rope break cablehelper %1 - rope %2 - phonemodel %3 - owner %4 - phone %5", _object1, _rope, _phoneModel, _owner, _phone];
    
}];