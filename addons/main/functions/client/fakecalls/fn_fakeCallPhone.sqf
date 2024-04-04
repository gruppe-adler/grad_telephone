/*

	executed on server

*/

params ["_receiverPhoneObject",  ["_sound", ""], ["_text", ""]];
 
 // go to calling, if receiver can receive
if ([_receiverPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) then {
		
		// let server handle receiver status
		[_receiverPhoneObject] call grad_telephone_fnc_callRinging;

		// end ringing after random delay, if still ringing
		[{
			params ["_receiverPhoneObject"];
			
			if ([_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callGetStatus) then {
				[_receiverPhoneObject, "idle"] call grad_telephone_fnc_callSetStatus;

				diag_log "fake call phone endet ringing after random delay";
			};

		}, [_receiverPhoneObject], ceil random 15 + 10] call CBA_fnc_waitAndExecute;

		// fake call starts or was aborted
		[{
				params ["_receiverPhoneObject"];
				!([_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callGetStatus)
		}, {

				params ["_receiverPhoneObject", "_sound", "_text"];

				if ([_receiverPhoneObject, "calling"] call grad_telephone_fnc_callGetStatus) then {
					[_receiverPhoneObject, _sound, _text] call grad_telephone_fnc_fakeCallStart;
					diag_log "fake call phone started";
				} else {
					// do nothing, just stop
					diag_log "fake call phone stopped";
				};
		}, [_receiverPhoneObject, _sound, _text]] call CBA_fnc_waitUntilAndExecute;

	} else {
	hint "telephone already in use";
};
