params ["_phone"];

if ( isClass(configFile >> "CfgPatches" >> "Radio_Animations") ) then {

    private _phoneModel = _phone getVariable ["GRAD_telephone_phoneModel", objNull];    

    private _phoneModel_dattach = [-0.01,-0.04,0];
    private _phoneModel_dvector = [[0.334,0.788,-0.516],[0.917,-0.398,-0.014]];

    player playActionNow "radioAnims_Ear";

    // attach rope to player instead of phone
    private _rope = _phone getVariable ["GRAD_telephone_cable", objNull];
    [player, "lefthand", [0,0,-1]] ropeAttachTo _rope;

    _phoneModel attachto [player, _phoneModel_dattach, "lefthand", true];
    // [_phoneModel, _phoneModel_dvector] remoteExec ["setVectorDirAndUp", 0, _phoneModel];

};
