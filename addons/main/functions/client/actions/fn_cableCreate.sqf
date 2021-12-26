params ["_phoneObject", "_player"];

private _offset = _phoneObject getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];

private _cablehelper = "GRAD_telephone_cableHelper" createVehicle [0,0,0];  
_cablehelper setPos (_phoneObject modelToWorld _offset);
_cablehelper setVariable ["GRAD_telephone_phone", _phoneObject];

private _cable = ropeCreate [
    _cablehelper, 
    [0,0,0], 
    player, 
    "lefthand", 
    3, 
    ["", [0,0,-1]],  
    ["", [0,0,-1]], 
    "GRAD_telephone_ropeCable"
];

_cable addEventHandler ["RopeBreak", {
    params ["_cablehelper", "_rope", "_object2"];

    private _phone = _cablehelper getVariable ["GRAD_telephone_phone", objNull];
    [player, _phone] call grad_telephone_fnc_callEnd;
    systemChat "rope break";
    if (!isNull _cablehelper) then {
        deleteVehicle _cablehelper;
    };
}];

[_cable, _cablehelper]