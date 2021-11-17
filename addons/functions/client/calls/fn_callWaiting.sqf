params ["_callerPhoneObject"];


[_callerPhoneObject] call _fnc_soundWaiting;

// its actually important phone object is the phone you are standing next to
[{
    params ["_callerPhoneObject"];
    // (_phoneObject distance player > 3) || 
    [player, _callerPhoneObject] call _fnc_conditionEnd
},
{
    params ["_callerPhoneObject"];
    if (!([player, _callerPhoneObject] call _fnc_conditionEnd)) then {
        [_callerPhoneObject, _callerPhoneObject getVariable ["_phoneStatus", "idle"]] call _fnc_callEnd;
        systemChat "ending call because too far away";
    };
}, [_callerPhoneObject]] call CBA_fnc_waitUntilAndExecute;