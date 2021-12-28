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

_cablehelper setVariable ["GRAD_telephone_phone", _phoneObject, true];

if (GRAD_TELEPHONE_DEBUG_MODE) then {
    diag_log format ["ropebreak added: id %1", _handlerID];
};

[_cable, _cablehelper]
