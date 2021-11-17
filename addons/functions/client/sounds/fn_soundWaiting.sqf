params ["_callerPhoneObject"];

[{
    params ["_args", "_handle"];
    _args params ["_callerPhoneObject"];

    if (!([_callerPhoneObject, "waiting"] call _fnc_callGetStatus) ||
        !(player getVariable ['_isCalling', false])) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    [selectRandom ["_phoneBeep1", "_phoneBeep2"]] call BIS_fnc_playSound;
    systemChat "beep";

}, 3, [_callerPhoneObject]] call CBA_fnc_addPerFrameHandler;