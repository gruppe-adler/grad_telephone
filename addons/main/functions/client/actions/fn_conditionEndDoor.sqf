params ["_player", "_phone"];

private _result = false;
private _isBooth = _phone getVariable ["GRAD_telephone_isBooth", false];

if (!_isBooth) exitWith { true };

private _animationPhase = _phone animationPhase "door_01";
private _boundingBox = boundingBoxReal _phone;
_boundingBox params [
    "_arrayMin",
    "_arrayMax"
];
_arrayMin params ["_xMin", "_yMin", "_zMin"];
_arrayMax params ["_xMax", "_yMax", "_zMax"];

private _centerpos = getPos _phone;
_maxWidth = abs ((_xMax) - (_xMin));
_maxLength = abs ((_yMax) - (_yMin));
_maxHeight = abs ((_zMax) - (_zMin));

private _posInFrontOfPhone = _phone getRelPos [-1,0];

if (_animationPhase == 0 && (_player inArea [_centerpos, _maxLength/2, _maxWidth/2, getDir _phone, true, _maxHeight])) then {
    _return = true;

    if (GRAD_TELEPHONE_DEBUG_MODE) then {
        systemChat "inside booth";
    };
};

if (_animationPhase == 1 && (_player inArea [_posInFrontOfPhone, _maxLength, _maxWidth/2, getDir _phone, true, _maxHeight])) then {
    _return = true;

    if (GRAD_TELEPHONE_DEBUG_MODE) then {
        systemChat "outside booth in front";
    };
};

systemChat "cut off";

_return