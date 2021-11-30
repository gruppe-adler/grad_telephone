params ["_phoneObject", "_player"];

private _offset = _phoneObject getVariable ["GRAD_Telephone_phoneCablePlugOffset", [0,0,0]];

ropehelper = "GRAD_telephone_cableHelper" createVehicle [0,0,0];  
ropehelper setPos (_phoneObject modelToWorld _offset);
myrope = ropeCreate [
    ropehelper, 
    [0,0,0], 
    player, 
    "lefthand", 
    2, 
    ["", [0,0,-1]],  
    ["", [0,0,-1]], 
    "GRAD_telephone_ropeCable"
];

myrope addEventHandler ["RopeBreak", {
    params ["_object1", "_rope", "_object2"];

    systemChat "rope break";
}];