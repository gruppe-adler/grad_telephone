params ["_player", "_object"];

// storedData
private _storedData = [_object] call grad_telephone_fnc_callGetInfo;
private _state = _object getVariable ['grad_telephone_phoneStatus', "idle"];

_storedData params [
    ["_phone1", objNull],
    ["_phone2", objNull],
    ["_number1", "undefined"],
    ["_number2", "undefined"],
    ["_player1", objNull],
    ["_player2", objNull]
];

private _isCaller = _player isEqualTo _player1;


// execute state stuff
switch (_state) do {
	case "waiting": {
		// set self to idle state
		[_object, "idle"] call grad_telephone_fnc_callSetStatus;

		// if there is no other owner, take command of other phone as well
		if (_isCaller && isNull _player2) then {
			[_phone2, "idle"] call grad_telephone_fnc_callSetStatus;
		};

		// play sound
		if (_isCaller) then {
			[_phone1, "grad_telephone_sound_phoneHangUp"] remoteExec ["say3D", [0,-2] select isDedicated];
		} else {
			[_phone2, "grad_telephone_sound_phoneHangUp"] remoteExec ["say3D", [0,-2] select isDedicated];
		};

		// tfar
		// todo: careful to set if busy state
		[_object, _number1 + _number2] call grad_telephone_fnc_callPluginDeactivate;

		// delete partner reference
		[_phone1, _phone2] call grad_telephone_fnc_callDeleteInfo;

		// debug whats happening
    if (GRAD_TELEPHONE_DEBUG_MODE) then {
      systemChat "hanging up from waiting";
    };
		
	};


	case "busy": {
		// set self to idle state
		[_object, "idle"] call grad_telephone_fnc_callSetStatus;

		[_object, "grad_telephone_sound_phoneHangUp"] remoteExec ["say3D", [0,-2] select isDedicated];

		// debug whats happening
    if (GRAD_TELEPHONE_DEBUG_MODE) then {
		    systemChat "hanging up from busy";
    };
	};


	case "calling" : {
		// set self to idle state
		[_object, "idle"] call grad_telephone_fnc_callSetStatus;

		// if there is no other owner, take command of other phone as well
		if (isNull _player1) then {
			[_phone1, "idle"] call grad_telephone_fnc_callSetStatus;
			// delete partner reference
			[_phone1, _phone2] call grad_telephone_fnc_callDeleteInfo;
		};
		if (isNull _player2) then {
			[_phone2, "idle"] call grad_telephone_fnc_callSetStatus;
			// delete partner reference
			[_phone1, _phone2] call grad_telephone_fnc_callDeleteInfo;
		};

		// todo: what the hell did i do here? args does not match. probably never called?!
		// but grad_telephone_fnc_soundInterrupted was called, so .. HOW
		// if other side was called and other still exists
		if (!isNull _player2 && _isCaller) then {
			[_phone2, "remoteEnd"] call grad_telephone_fnc_callSetStatus; // set other side to end itself with beeps
			[_player2, _phone2] remoteExec ["grad_telephone_fnc_callEnd", _player2];
		};
		// if this side was called and other still exists
		if (!isNull _player1 && !_isCaller) then {
			[_phone1, "remoteEnd"] call grad_telephone_fnc_callSetStatus; // set other side to end itself with beeps
			[_player1, _phone1] remoteExec ["grad_telephone_fnc_callEnd", _player1];
		};

		// play sound
		[_object, "grad_telephone_sound_phoneHangUp"] remoteExec ["say3D", [0,-2] select isDedicated];

		// tell server there is no transmission left
		[_number1, _number2] remoteExec ["grad_telephone_fnc_callUnregister", 2];

		// tfar
		[_object, _number1 + _number2] call grad_telephone_fnc_callPluginDeactivate;

		// debug whats happening
    if (GRAD_TELEPHONE_DEBUG_MODE) then {
		    systemChat "hanging up from calling";
    };
	};


	case "remoteEnd" : {
		// set self to ending state
		[_object, "ending"] call grad_telephone_fnc_callSetStatus;

		// initiate beep beep..
		[_object] call grad_telephone_fnc_soundInterrupted;

		// tfar
		[_object, _number1 + _number2] call grad_telephone_fnc_callPluginDeactivate;

		// delete partner reference
		[_phone1, _phone2] call grad_telephone_fnc_callDeleteInfo;

		// debug whats happening
    if (GRAD_TELEPHONE_DEBUG_MODE) then {
		    systemChat "other side hung up";
    };

	};


	case "ending": {
		// set self to idle state
		[_object, "idle"] call grad_telephone_fnc_callSetStatus;

		// play sound
		[_object, "grad_telephone_sound_phoneHangUp"] remoteExec ["say3D", [0,-2] select isDedicated];

		// debug whats happening
    if (GRAD_TELEPHONE_DEBUG_MODE) then {
		    systemChat "hanging up from ending";
    };

	};

	default { diag_log "GRAD TELEPHONE: error code 1337"; };
};

// always end, no matter what happened
if (!isNull _player) then {
	_player setVariable ['grad_telephone_isCalling', false];
	[_player, _object] call grad_telephone_fnc_callEndAnimation;
};
