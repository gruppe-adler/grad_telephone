params ["_phone"];

if ( isClass(configFile >> "CfgPatches" >> "Radio_Animations") ) then {

    private _phoneModel = _phone getVariable ["GRAD_telephone_phoneModel", objNull];    

    private _phoneModel_dattach = [-0.01,-0.04,0];
    private _phoneModel_dvector = [[0.334,0.788,-0.516],[0.917,-0.398,-0.014]];

    player playActionNow "radioAnims_Ear";

    // attach rope to player instead of phone
    private _rope = _phone getVariable ["GRAD_telephone_cable", objNull];
    [player, "lefthand", [0,0,-1]] ropeAttachTo _rope;

    _phoneModel attachto [player, [0,0,0], "lefthand", true];
    [_phoneModel, [[0,0.66,-0.33], [0,0.33,0.66]]] remoteExec ["setVectorDirAndUp", _phoneModel];

    // to prevent issues in MP EH must be added to player connected to rope
    private _cableHelper = _phone getVariable ["GRAD_telephone_cableHelper", objNull];
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
        diag_log format ["rope break cablehelper %1 - rope %2 - phonemodel %3 - owner %4 - phone %5", _object1, _rope, _phoneModel, _object2, _phone];
        
    }];

};


/*
private _phoneModel = createSimpleObject ["x\grad_telephone\addons\main\data\receiver_gdr_hook.p3d", [0,0,0]]; 
        
    private _phoneModel_dattach = [0.01,0.0,0];  
    player playActionNow "radioAnims_Ear"; 
 
    
    _phoneModel attachto [player, [0.01,0.01,0], "lefthand", true]; private _y = -80; private _p = 30; private _r = 230; 
_phoneModel setVectorDirAndUp [ 
 [sin _y * cos _p, cos _y * cos _p, sin _p], 
 [[sin _r, -sin _p, cos _r * cos _p], -_y] call BIS_fnc_rotateVector2D 
]; [{ deleteVehicle _this; }, _phoneModel, 3] call CBA_fnc_waitAndExecute;
*/