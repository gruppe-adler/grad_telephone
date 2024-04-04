params ["_player", "_object"];

private _phonebookplayer = _player getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []];
private _worked = _phonebookplayer pushBackUnique [(_object getVariable ["GRAD_TELEPHONE_NUMBER_ASSIGNED", "not_assigned"]), [_object]];

_player setVariable ["GRAD_TELEPHONE_ALLNUMBERS", _phonebookplayer, true];

if (_worked == -1) then {
	("Already added to phonebook.") call CBA_fnc_notify;
} else {
	private _displayName = _object getVariable ['grad_telephone_displayName', "new entry"];
	(_displayName + " added to phonebook.") call CBA_fnc_notify;
};
