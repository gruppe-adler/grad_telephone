/*

	executed on server
	called by zeus

*/

params ["_receiverPhoneObject",  ["_sound", ""], ["_text", ""]];
 
 // go to calling, if receiver can receive
if ([_receiverPhoneObject, "idle"] call grad_telephone_fnc_callGetStatus) then {
		
		// let server handle receiver status, needs to be scheduled
		[_receiverPhoneObject] spawn grad_telephone_fnc_callRinging;

		// delay a bit as ringing needs a short time to be set due to spawn
		[{
			params ["_receiverPhoneObject", "_sound", "_text"];

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
			}, [_receiverPhoneObject, _sound, _text], 15 + random 5, {

				// end ringing after random delay, if still ringing after 15 + 5 s
				params ["_receiverPhoneObject"];
				[_receiverPhoneObject, "idle"] call grad_telephone_fnc_callSetStatus;
				// [objNull, _receiverPhoneObject] remoteExec ["grad_telephone_fnc_callEnd", 2];
				diag_log "fake call phone endet ringing after random delay";

			}] call CBA_fnc_waitUntilAndExecute;

		}, [_receiverPhoneObject, _sound, _text], 0.5] call CBA_fnc_waitAndExecute;

	} else {
	diag_log "telephone already in use";
};
