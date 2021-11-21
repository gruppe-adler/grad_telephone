/*

    server manages ringing state

*/

params ["_receiverPhoneObject"];

if (!canSuspend) exitWith {
    [_receiverPhoneObject] call grad_telephone_fnc_callRinging;
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

waitUntil { !([_receiverPhoneObject, "ringing"] call grad_telephone_fnc_callGetStatus) };

deleteVehicle _dummy;
