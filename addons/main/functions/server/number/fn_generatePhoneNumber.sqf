/*
	server
*/

// generates unique number for object

/*
*
* author: nomisum
* generates random phone number but not one from the given array
*
*/
params ["_phoneList"];


private _result = [];

// check if generated number already exists
while {true} do {

	private _phonePrefixCurrent = ((selectRandom GRAD_TELEPHONE_NUMBER_PREFIXES) splitString ""); // quick and easy conversion from string to array, accepts characters if need be
	private _phoneBaseNumber = [GRAD_TELEPHONE_NUMBER_LENGTH select 0, GRAD_TELEPHONE_NUMBER_LENGTH select 1] call grad_telephone_fnc_generateBaseNumber;

	_result = _phonePrefixCurrent + _phoneBaseNumber;

	if (_phoneList find _result == -1) exitWith {};

  systemChat format ["exiting with %1 ", _result];
};

private _endResult = "";

if (GRAD_TELEPHONE_DEBUG_MODE) then { diag_log format ["GRAD TELEPHONE: generatePhoneNumber: %1", _result]; };

{
  _endResult = _endResult + str _x;
} forEach _result;

// systemChat format ["endresult is %1 ", _endResult];

_endResult
