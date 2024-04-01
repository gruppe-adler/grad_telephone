params ["_receiverPhoneObject",  ["_sound", ""], ["_text", ""]];
 
 // go to calling, if receiver can receive
if ([_receiverPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) then {
		
		// let server handle receiver status
		[_receiverPhoneObject] remoteExec ["grad_telephone_fnc_callRinging", 2];
		[
			objNull, _receiverPhoneObject,
			objNull, player
		] call grad_telephone_fnc_callSaveInfo;

		[{
				params ["_receiverPhoneObject"];
				([_receiverPhoneObject, "calling"] call grad_telephone_fnc_callGetStatus)
		}, {

				params ["_receiverPhoneObject", "_sound", "_text"];

				[_receiverPhoneObject, _sound, _text] call grad_telephone_fnc_fakeCallAccept;
		}, [_receiverPhoneObject, _sound, _text]] call CBA_fnc_waitUntilAndExecute;

	} else {
	hint "telephone already in use";
};
