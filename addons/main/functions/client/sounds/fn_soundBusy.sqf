params ["_callerPhoneObject"];

[{
    params ["_args", "_handle"];
    _args params ["_callerPhoneObject"];

    if (!([_callerPhoneObject, "busy"] call grad_telephone_fnc_callGetStatus) ||
        !(player getVariable ['grad_telephone_isCalling', false])) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    [selectRandom ["_phoneBusy1", "_phoneBusy2", "_phoneBusy3"]] call BIS_fnc_playSound;
    systemChat "busybeep";

}, 0.5, [_callerPhoneObject]] call CBA_fnc_addPerFrameHandler;