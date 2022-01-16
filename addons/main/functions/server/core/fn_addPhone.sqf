/*

	can be called out of 3DEN init of object:

	[this] call grad_telephone_fnc_addPhone;

	* Arguments:
	* Object which will get the phone functionality <object>
	* If the phone is a rotary phone <bool> <optional>
	* Force Number which will be assigned <string> <optional>
	* Force Number which – when set – is the only number automatically called (for one directional phone system) <string> <optional>
  *

*/


params [
  ["_object", objNull],
  ["_isRotary", false],
  ["_number", "none"],
  ["_displayName", "none"],
  ["_canOnlyCallNumber", "all"],
  ["_hasPublicPhoneBookEntry", false],
  ["_position", [0,0,0]],
  ["_isPhoneBooth", false]
];

if (!isServer) exitWith {};

if (isNull _object) exitWith { diag_log format ["addPhone error: no object"]; };

if (_position isEqualTo [0,0,0]) then {
   _position = position _object;
};

private _id = missionNamespace getVariable ['grad_telephone_phoneCount', 0];
_id = _id + 1;
missionNamespace setVariable ["grad_telephone_phoneCount", _id, true];

_object setVariable ["grad_telephone_isPhone", true, true]; // needs to be true for all phones used by grad-telephone
_object setVariable ["grad_telephone_phoneID", _id, true]; // unique ID of this phone, incremental number
_object setVariable ["grad_telephone_isRotary", _isRotary, true]; // toggles rotary dialing
_object setVariable ["grad_telephone_skipDialing", (_canOnlyCallNumber != "all"), true]; // can only call one number without dialing (e.g. Grenzmeldenetz)
_object setVariable ["grad_telephone_hasPublicPhoneBookEntry", _hasPublicPhoneBookEntry, true]; // toggles phone book entry
_object setVariable ["grad_telephone_phonePosition", _position, true]; // used in phone book map
_object setVariable ["grad_telephone_isPhonebooth", _isPhoneBooth, true]; // used for phone booth mechanics, used for icon on phone book map
_object setVariable ["grad_telephone_displayName", _displayName, true]; // used for name in phone book (WIP)


// zeus & direct call
if (_canOnlyCallNumber != "all") then {
    _object setVariable ["grad_telephone_directConnect", _canOnlyCallNumber, true];
};

[_object, _number] call grad_telephone_fnc_assignNumber;
[_object, "idle"] call grad_telephone_fnc_callSetStatus;


// zeus phone will receive extra action, not here
if (_canOnlyCallNumber != "none") then {
    [_object] remoteExec ["grad_telephone_fnc_addAction", [0,-2] select isDedicated, true];
};
