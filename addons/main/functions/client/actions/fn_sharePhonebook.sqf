params ["_player", "_target"];

private _playerPhonebook = _player getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []];
private _unitPhonebook = _target getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []];

{
	_unitPhonebook pushBackUnique _x;
} forEach _playerPhonebook;

_target setVariable ["GRAD_TELEPHONE_ALLNUMBERS", _unitPhonebook, true];


("Phonebook shared with " + _target getVariable ["ACE_Name", name _target]) call CBA_fnc_notify;

[_player getVariable ["ACE_Name", name _player] + " shared his phonebook with you."] remoteExec ["CBA_fnc_notify", _target];