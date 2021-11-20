params ["_timeUp", "_timeDown", "_newAngle", "_number"];

private _dialog = uiNamespace getVariable ['grad_telephone_rscRotary',controlNull];

if (!dialog) exitWith {};


private _ctrl = _dialog displayCtrl 5000;
private _sound = "_rotary_" + (str _number) + "_up";

if (!dialog) exitWith {};

private _currentAngle = ctrlAngle _ctrl;
_currentAngle params ["_angle", "_centerX", "_centerY"];

_ctrl ctrlSetAngle [_newAngle, _centerX, _centerY, false];
_ctrl ctrlCommit _timeUp;

player say _sound;

sleep _timeUp;

_ctrl ctrlSetAngle [_newAngle, _centerX, _centerY, false];
_ctrl ctrlCommit _timeUp;

if (!dialog) exitWith {};

private _sound = "_rotary_" + (str _number) + "_down";

_ctrl ctrlSetAngle [_newAngle, _centerX, _centerY, true];
_ctrl ctrlSetAngle [0, _centerX, _centerY, false];
_ctrl ctrlCommit _timeDown;

player say _sound;

sleep _timeDown;

true
/*
[{
    params ["_args", "_handle"];
    _args params ["_ctrl"];

    private _currentAngle = ctrlAngle _ctrl;
    _currentAngle params ["_angle", "_centerX", "_centerY"];
    _ctrl ctrlSetAngle [_angle + 1, _centerX, _centerY, true];

}, 0, [_ctrl]] call CBA_fnc_addPerFrameHandler;
*/



// _ctrl ctrlSetAngle [angle, centerX, centerY, now];