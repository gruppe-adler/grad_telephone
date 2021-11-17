/*

	can be called out of 3DEN init of object:

	[this] call _fnc_addPhone;

	* Arguments:
	* Object which will get the phone functionality <object>
	* If the phone is a rotary phone <bool> <optional>
	* Force Number which will be assigned <string> <optional>
	* Force Number which – when set – is the only number automatically called (for one directional phone system) <string> <optional>

*/


params [["_object", objNull], ["_number", "none"], ["_isRotary", false], ["_canOnlyCallNumber", "all"], ["_hasPublicPhoneBookEntry", false], ["_position", [0,0,0]]];

if (!isServer) exitWith {};

if (isNull _object) exitWith { diag_log format ["addPhone error: no object"]; };

if (_position isEqualTo [0,0,0]) then {
   _position = position _object;
};

private _id = missionNamespace getVariable ["_phoneCount", 0];
_id = _id + 1;
missionNamespace setVariable ["_phoneCount", _id, true];

_object setVariable ["_isPhone", true, true];
_object setVariable ["_phoneID", _id, true];
_object setVariable ["_isRotary", _isRotary, true];
_object setVariable ["_skipDialing", _canOnlyCallNumber != "all", true];
_object setVariable ["_hasPublicPhoneBookEntry", _hasPublicPhoneBookEntry, true];
_object setVariable ["_phonePosition", _position];

// zeus & direct call
if (_canOnlyCallNumber != "all") then {
    _object setVariable ["_directConnect", _canOnlyCallNumber, true];
};

[_object, _number] call _fnc_assignNumber;
[_object, "idle"] call _fnc_callSetStatus;


// zeus phone will receive extra action, not here
if (_canOnlyCallNumber != "none" || _hasPublicPhoneBookEntry) then {
    [_object] remoteExec ["_fnc_addAction", [0,-2] select isDedicated, true];
};
