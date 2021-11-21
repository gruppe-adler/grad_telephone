 params ["_control", "_selectedIndex"];

private _currentEntry = _control getVariable [str _selectedIndex, []];
private _position = (_currentEntry select 0) getVariable ['grad_telephone_phonePosition', [0,0,0]];

diag_log format ["selection _currentEntry %1", _currentEntry];
diag_log format ["_position _currentEntry %1", _position];

// systemChat format ["%1 - %2", _objReceiver, _selectedIndex];

"mrk_PhoneSelect" setMarkerPosLocal _position;

private _dialog = uiNamespace getVariable ['grad_telephone_rscPhoneBook',controlNull];
private _map = _dialog displayCtrl 2000;
_map ctrlMapAnimAdd [0.1, 0.05, _position];
ctrlMapAnimCommit _map;

if (count _objReceiverArray > 1) then {
    hint (localize STR_grad_telephone_multipleRecipients);
};
