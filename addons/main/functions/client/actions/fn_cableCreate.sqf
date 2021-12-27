params ["_phoneObject", "_phoneModel"];

private _offset = _phoneObject getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];

private _cablehelper = "GRAD_telephone_cableHelper" createVehicle [0,0,0];  
_cablehelper setPos (_phoneObject modelToWorld _offset);


private _cable = ropeCreate [
    _cablehelper, 
    [0,0,0], 
    _phoneModel, 
    [0,0,0], 
    3, 
    ["", [0,0,-1]],  
    ["", [0,0,-1]], 
    "GRAD_telephone_ropeCable"
];

_cablehelper setVariable ["GRAD_telephone_phone", _phoneObject];

_cablehelper addEventHandler ["RopeBreak", {
    params ["_cablehelper", "_rope", "_object2"];

    systemChat format ["rope break %1 %2 %3", _cablehelper, _rope, _object2];

    private _phone = _cablehelper getVariable ["GRAD_telephone_phone", objNull];
    private _owner = [_phone] call grad_telephone_fnc_callGetOwner;

    [_owner, _phone] call grad_telephone_fnc_callEnd;
    
    if (GRAD_TELEPHONE_DEBUG_MODE) then {
        systemChat "rope break";
    };

    _owner playActionNow "radioAnims_Stop";
    detach _phoneModel;
}];

[_cable, _cablehelper]