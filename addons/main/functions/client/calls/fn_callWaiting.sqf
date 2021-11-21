params ["_callerPhoneObject"];


[_callerPhoneObject] call grad_telephone_fnc_soundWaiting;

// its actually important phone object is the phone you are standing next to
[{
    params ["_callerPhoneObject"];
    // (_phoneObject distance player > 3) ||
    [player, _callerPhoneObject] call grad_telephone_fnc_conditionEnd
},
{
    params ["_callerPhoneObject"];
    if (!([player, _callerPhoneObject] call grad_telephone_fnc_conditionEnd)) then {
        [_callerPhoneObject, _callerPhoneObject getVariable ['grad_telephone_phoneStatus', "idle"]] call grad_telephone_fnc_callEnd;

        if (GRAD_TELEPHONE_DEBUG_MODE) then {
          hint (localize "STR_grad_telephone_tooFarAway");
        };
    };
}, [_callerPhoneObject]] call CBA_fnc_waitUntilAndExecute;
