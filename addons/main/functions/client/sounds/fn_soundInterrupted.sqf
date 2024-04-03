params ["_callerPhoneObject"];

private _pfhID = [{
    params ["_args", "_handle"];
    _args params ["_callerPhoneObject"];

    if ([_callerPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _source = selectRandom ["grad_telephone_sound_phoneBusy1", "grad_telephone_sound_phoneBusy2", "grad_telephone_sound_phoneBusy3"];
    private _sound = playSound _source;
    missionNamespace setVariable ["GRAD_telephone_phoneBusySound", _sound];

    if (GRAD_TELEPHONE_DEBUG_MODE) then {
      systemChat "ending beep";
    };

}, 0.5, [_callerPhoneObject]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_callerPhoneObject", "_pfhID"];
    
    ([_callerPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) ||
    !(player getVariable ['grad_telephone_isCalling', false])
    
},{
    params ["_callerPhoneObject", "_pfhID"];

    [_pfhID] call CBA_fnc_removePerFrameHandler;

    private _sound = missionNamespace getVariable ["GRAD_telephone_phoneBusySound", objNull];

    if (!isNull _sound) then {
        deleteVehicle _sound;
    };

}, [_callerPhoneObject, _pfhID]] call CBA_fnc_waitUntilAndExecute;
