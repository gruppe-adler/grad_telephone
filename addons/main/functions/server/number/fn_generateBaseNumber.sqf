params ["_lengthMin", "_lengthMax"];

// fall back to default if wrong formatting is used in cba settings
if (typeName _lengthMin != "SCALAR" || typeName _lengthMax != "SCALAR") then {
		diag_log "GRAD TELEPHONE ERROR: Please fix phone number length in CBA Settings to ARRAY [MIN,MAX]! Reverting to default.";
		_lengthMin = 7; _lengthMax = 8;
};

private _getRandomDigit = {
	params ["_index"];

	if (_index < 3) then {
		(ceil (random 8.999))
	} else {
		(floor (random 9.999))
	};
};


private _length = _lengthMin; // default

if (random 2 > 1) then { _length = _lengthMax; };

private _number = [];

for [{_i=0}, {_i<_length}, {_i=_i+1}] do
{
	private _nextNumber = [_i] call _getRandomDigit;
	_number pushBack _nextNumber;
};

_number
