 params ["_receiverPhoneObject", "_sound"];
 
 // go to calling, if receiver can receive
if ([_receiverPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) then {
		
		// let server handle receiver status
		[_receiverPhoneObject] remoteExec ["grad_telephone_fnc_callRinging", 2];

		[{
				params ["_callerPhoneObject", "_receiverPhoneObject", "_callerNumber", "_receiverNumber"];
				([_receiverPhoneObject, "calling"] call grad_telephone_fnc_callGetStatus)
		}, {

				params ["_callerPhoneObject", "_receiverPhoneObject", "_callerNumber", "_receiverNumber"];
				
				if (GRAD_TELEPHONE_DEBUG_MODE) then {
					systemChat format ["callStart - waiting %1 from %2", _receiverNumber, _callerNumber];
				};
				
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

				[_callerPhoneObject, _sound] call grad_telephone_fnc_fakeCallAccept;
		}, [_callerPhoneObject, _receiverPhoneObject, _callerNumber, _receiverNumber]] call CBA_fnc_waitUntilAndExecute;

	} else {
	hint "telephone already in use";
};
