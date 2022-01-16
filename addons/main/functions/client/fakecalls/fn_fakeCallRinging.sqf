/*

    server manages ringing state

*/

params ["_receiverPhoneObject"];

if (!canSuspend) exitWith {
    [_receiverPhoneObject] spawn grad_telephone_fnc_callRinging;
};

[_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callSetStatus;

private _position = getPos _receiverPhoneObject;
private _boundingBox = boundingBoxReal vehicle player;
_boundingBox params ["_p1", "_p2"];
private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

// set sound to middle bounding box of phone object, best possible estimation of actual phone
_position set [2, _maxHeight/2];

private _dummy = createVehicle ["Sign_Sphere25cm_Geometry_F", [0,0,0], [], 0, "CAN_COLLIDE"];
hideObjectGlobal _dummy;
_dummy setPos _position;

// dont ring if needed
if (!(_receiverPhoneObject getVariable ["grad_telephone_dontRing", false])) then {
    // todo hide dummy visually
    [_dummy] remoteExec ["grad_telephone_fnc_soundRing", [0,-2] select isDedicated];
};

[{
    params ["_receiverPhoneObject"];

    private _possibleSounds = _receiverPhoneObject getVariable ["grad_telephone_fakeanswersound", []];
    private _soundSelected = "grad_telephone_sound_fakecallanswerdefault";
    if (count _possibleSounds > 0) then { _soundSelected = selectRandom _possibleSounds; };

    // if there is a sound prepared && still ringing, accept call after waiting time
    if ([_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callGetStatus) then {
        [_receiverPhoneObject, _soundSelected] call grad_telephone_fnc_fakeCallAccept;
    };
}, [_receiverPhoneObject], (random 10 max 1)] call CBA_fnc_waitAndExecute;

waitUntil { !([_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callGetStatus) };

deleteVehicle _dummy;