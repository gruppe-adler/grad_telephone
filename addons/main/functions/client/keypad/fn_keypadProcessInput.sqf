params ["_selectedNumber"];

if (!dialog) exitWith {};

private _dialog = uiNamespace getVariable ['grad_telephone_rscKeypad',controlNull];
private _name = format ["x\grad_telephone\addons\main\data\keypad_%1.paa", _selectedNumber];

private _ctrl = _dialog displayCtrl 5000;
_ctrl ctrlSetText _name;
_ctrl ctrlShow true;

private _sound = (selectRandom ["grad_telephone_sound_keypad_1", "grad_telephone_sound_keypad_2", "grad_telephone_sound_keypad_3"]);
playSoundUI [_sound, 1];

sleep (0.1 + (random 0.4));

if (!dialog) exitWith {};
_ctrl ctrlShow false;

true
