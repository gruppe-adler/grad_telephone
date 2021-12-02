params ["_unit", "_phone", "_sound", ["_leftEar", true]];

private _ear = [[03.0657959,0,0], [-03.0657959,0,0]] select _leftEar;

private _helper = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
_helper attachTo [_unit, _ear, "head", true]; 

_helper say3D _sound;

[{
    params ["_unit", "_phone"];
    [_unit, _phone] call grad_telephone_fnc_conditionEnd   
}, {
    params ["_unit", "_phone", "_helper"];

    deleteVehicle _helper;
}, [_unit, _phone, _helper]] call CBA_fnc_waitUntilAndExecute;
