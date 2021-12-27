params ["_phone"];

if ( isClass(configFile >> "CfgPatches" >> "Radio_Animations") ) then {

    private _phoneModel = createSimpleObject ["Jet_Radio", position player];

    private _phoneModel_dattach = [-0.01,-0.04,0];
    private _phoneModel_dvector = [[0.334,0.788,-0.516],[0.917,-0.398,-0.014]];

    player playActionNow "radioAnims_Ear";

    _phoneModel attachto [player, _phoneModel_dattach, "lefthand", true];
    // [_phoneModel, _phoneModel_dvector] remoteExec ["setVectorDirAndUp", 0, _phoneModel];

    private _cableArray = [_phone, _phoneModel] call grad_telephone_fnc_cableCreate;
    _cableArray params ["_cable", "_cableHelper"];
    _phone setVariable ["GRAD_telephone_cable", _cable, true];
    _phone setVariable ["GRAD_telephone_cableHelper", _cableHelper, true];
    _phone setVariable ["GRAD_telephone_phoneModel", _phoneModel, true];

    [{
        params ["_cable"];
        isNull _cable
    }, {

        params ["_cable", "_phoneModel"];

        player playActionNow "radioAnims_Stop";
        detach _phoneModel;
          
    }, [_cable, _phoneModel]] call CBA_fnc_waitUntilAndExecute;
};
