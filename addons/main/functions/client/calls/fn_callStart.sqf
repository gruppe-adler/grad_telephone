params ["_callerPhoneObject", ["_receiverPhoneObjects", []]];

private _receiverPhoneObject = _receiverPhoneObjects select 0;
// if no number is assigned
// if (count _callerNumber isEqualTo 0) exitWith { diag_log "error, no number"; };

private _callerNumber = _callerPhoneObject getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', "none"];
private _receiverNumber = _receiverPhoneObject getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', "none"];
private _isRotary = _callerPhoneObject getVariable ['grad_telephone_isRotary', false];


private ["_dialing"];

if (_callerPhoneObject getVariable ['grad_telephone_skipDialing', false]) then {
    _dialing = [] spawn {};
} else {
    if (_isRotary) then {
        _dialing = [_receiverNumber] spawn grad_telephone_fnc_rotaryDialNumber;
    } else {
        _dialing = [_receiverNumber] spawn grad_telephone_fnc_keypadDialNumber;
    };
};


player setVariable ['grad_telephone_isCalling', true];

{
    private _receiverPhoneObject = _x;

    [{
        params ["_dialing"];
        scriptDone _dialing
    }, {
        params ["_dialing", "_callerPhoneObject", "_receiverPhoneObject", "_callerNumber", "_receiverNumber"];

            [player, _callerPhoneObject] call grad_telephone_fnc_callSetOwner; // set self to owner of current phone

            // prevent calling yourself
            // [WORKS]
            if (_callerPhoneObject isEqualTo _receiverPhoneObject) exitWith {
                hint "cant call yourself, dumbass";

                [_callerPhoneObject, "busy"] call grad_telephone_fnc_callSetStatus;

                [_callerPhoneObject] call grad_telephone_fnc_soundBusy;

                if (GRAD_TELEPHONE_DEBUG_MODE) then {
                  systemChat "callStart - busy";
                };
            };

            if (GRAD_TELEPHONE_DEBUG_MODE) then {
              systemChat format ["callStart - saveInfo %1 %2", _callerPhoneObject, _receiverPhoneObject];
            };

            [
                _callerPhoneObject, _receiverPhoneObject,
                player, objNull
            ] call grad_telephone_fnc_callSaveInfo;


            // go to calling, if receiver can receive
            if ([_receiverPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) then {
                // self assign status
                [_callerPhoneObject, "waiting"] call grad_telephone_fnc_callSetStatus;

                // let server handle receiver status
                [_receiverPhoneObject] remoteExec ["grad_telephone_fnc_callRinging", 2];

                [_callerPhoneObject] call grad_telephone_fnc_callWaiting;

                [{
                        params ["_callerPhoneObject", "_receiverPhoneObject", "_callerNumber", "_receiverNumber"];
                        ([_receiverPhoneObject, "calling"] call grad_telephone_fnc_callGetStatus)
                }, {

                        params ["_callerPhoneObject", "_receiverPhoneObject", "_callerNumber", "_receiverNumber"];
                        systemChat format ["callStart - waiting %1 from %2", _receiverNumber, _callerNumber];
                        private _storedData = [_callerPhoneObject] call grad_telephone_fnc_callGetInfo;

                        _storedData params [
                            ["_phone1", objNull],
                            ["_phone2", _callerPhoneObject],
                            ["_number1", "undefined"],
                            ["_number2", "undefined"],
                            ["_player1", objNull],
                            ["_player2", player]
                        ];
                        if (GRAD_TELEPHONE_DEBUG_MODE) then {
                          systemChat format ["callStart - waiting %1 from %2", _number2, _number1];
                        };

                        // activate tfar stuff
                        [_callerPhoneObject, _callerNumber + _receiverNumber] call grad_telephone_fnc_callPluginActivate;
                }, [_callerPhoneObject, _receiverPhoneObject, _callerNumber, _receiverNumber]] call CBA_fnc_waitUntilAndExecute;

            } else {
                [_callerPhoneObject, "busy"] call grad_telephone_fnc_callSetStatus;
                // todo check if this fix helps busy beep when calling busy lines - should beep now
                [_callerPhoneObject] call grad_telephone_fnc_soundBusy;

                if (GRAD_TELEPHONE_DEBUG_MODE) then {
                  systemChat "callStart - busy";
                };
            };

    }, [_dialing, _callerPhoneObject, _receiverPhoneObject, _callerNumber, _receiverNumber]] call CBA_fnc_waitUntilAndExecute;


} forEach _receiverPhoneObjects;
