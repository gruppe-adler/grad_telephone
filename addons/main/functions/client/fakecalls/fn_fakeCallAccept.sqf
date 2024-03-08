/*

    fakeCallAccept is executed by Gamemaster or other entities
    [cursorObject] call grad_telephone_fnc_fakeCallAccept;

    on phone that GETS called by player, think mailbox functionality
    also called by engine when phone gets called and receiver can receive "fake" audio clip, think GTA phone briefing
*/

params ["_object", ["_sound", ""]];

private _storedData = [_object] call grad_telephone_fnc_callGetInfo;

_storedData params [
    ["_phone1", objNull],
    ["_phone2", objNull],
    ["_number1", "undefined"],
    ["_number2", "undefined"],
    ["_player1", objNull],
    ["_player2", objNull]
];

_phone2 = _object;
_player2 = player;

[_phone1, _phone2, _player1, _player2] call grad_telephone_fnc_callSaveInfo;


[player, _phone2] call grad_telephone_fnc_callSetOwner;

if (GRAD_TELEPHONE_DEBUG_MODE) then {
  systemChat format ["Debug: fakeCallAccept - %1 received call from %2", _number2, _number1];
  systemChat format ["Debug: fakeCallAccept - sound %1", _sound];
};

[_phone2, "calling"] call grad_telephone_fnc_callSetStatus;
[_phone1, "calling"] call grad_telephone_fnc_callSetStatus;




// register call only when phone is picked up by player / 2nd GTA use case
if (_sound != "") then {
  [_player1, _player2] remoteExec ["grad_telephone_fnc_callRegister", 2]; // already done in accept?
};

// raises local event to e.g. add some more functionality, like displaying subtitles or whatever
["GRAD_telephone_fakeCallAccept", [_phone2]] call CBA_fnc_localEvent; 

// should be always true if zeus/game is second party
if (!isNull _player1) then {
  [_player1, _phone1, _phone2, _sound] remoteExec ["grad_telephone_fnc_fakeCallPlaysound", _player1];
} else {
  // enable SP testing with one person
  [player, _phone1, _phone2, _sound] remoteExec ["grad_telephone_fnc_fakeCallPlaysound", player];
};
