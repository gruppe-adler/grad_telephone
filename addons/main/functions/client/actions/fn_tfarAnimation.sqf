
if ( isClass(configFile >> "CfgPatches" >> "Radio_Animations") ) then {

        player playactionnow radioAnims_Hand;
        radioAnims_radioModel = createSimpleObject ["Jet_Radio",position player];
        radioAnims_radioModel attachto [player,radioAnims_dattach,"lefthand"];   
        [[radioAnims_radioModel,radioAnims_dvector],"setVectorDirAndUp",true,false] call BIS_fnc_MP;

        [{
                
        }, {
            if (!isNil "radioAnims_radioModel") then {deletevehicle radioAnims_radioModel;radioAnims_radioModel = nil};
            player playActionNow "radioAnims_Stop";    
        }, []]call CBA_fnc_waitUntilAndExecute;

};