/*

    server manages ringing state

*/

params ["_receiverPhoneObject"];

if (!canSuspend) exitWith {
    [_receiverPhoneObject] spawn grad_telephone_fnc_callRinging;
};

private _isFakePhone = _receiverPhoneObject getVariable ["grad_telephone_isFakePhone", false];
private _isVehicle = 
    _receiverPhoneObject isKindOf "Air" || 
    _receiverPhoneObject isKindOf "LandVehicle" || 
    _receiverPhoneObject isKindOf "Ship" || 
    _receiverPhoneObject isKindOf "Tank";

private _status = "ringing"; // enables accept action for clients
[_receiverPhoneObject, _status] call grad_telephone_fnc_callSetStatus;

private _position = getPos _receiverPhoneObject;
private _boundingBox = boundingBoxReal _receiverPhoneObject;
_boundingBox params ["_p1", "_p2"];
private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

// set sound to middle bounding box of phone object, best possible estimation of actual phone
_position set [2, _maxHeight/2];

private _dummy = createVehicle ["Sign_Sphere25cm_Geometry_F", [0,0,0], [], 0, "CAN_COLLIDE"];
hideObjectGlobal _dummy;
_dummy setPos _position;

// dont ring if needed
if (!(_receiverPhoneObject getVariable ["grad_telephone_dontRing", false]) || _isFakePhone) then {
    // todo hide dummy visually
    if (!_isVehicle) then {
        [_dummy] remoteExec ["grad_telephone_fnc_soundRing", [0,-2] select isDedicated];
    } else {
        [_dummy, _receiverPhoneObject] remoteExec ["grad_telephone_fnc_soundRingVehicle", [0,-2] select isDedicated];
    };
};


if (_isFakePhone) then {
    [{
        params ["_receiverPhoneObject"];

        private _possibleSounds = _receiverPhoneObject getVariable ["grad_telephone_fakeanswersound", []];

        private _soundSelected = "grad_telephone_sound_fakecallanswerdefault";

        if (typeNAme _possibleSounds == "ARRAY" && count _possibleSounds > 0) then { _soundSelected = selectRandom _possibleSounds; };
        if (typeNAme _possibleSounds == "STRING") then { _soundSelected = _possibleSounds; };

        // if there is a sound prepared && still ringing, accept call after waiting time
        if ([_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callGetStatus) then {
            [_receiverPhoneObject, _soundSelected] call grad_telephone_fnc_fakeCallAccept;
        };
    }, [_receiverPhoneObject], (random 10 max 1)] call CBA_fnc_waitAndExecute;
};

waitUntil { !([_receiverPhoneObject, _status] call grad_telephone_fnc_callGetStatus) };

deleteVehicle _dummy;
