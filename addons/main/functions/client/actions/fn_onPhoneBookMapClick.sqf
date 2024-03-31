params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _position = _control ctrlMapScreenToWorld [_xPos, _yPos];

private _nearestPhone = objNull;
private _nearestPhoneIndex = 0;
private _allNumbers = (player getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []]) + (missionNamespace getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []]);
{
    private _phoneObjects = _x select 1;
    private _numberIndex = _forEachIndex;

    {
        private _phoneObject = _x;
        private _positionPhoneObject = position _x;

        if (isNull _nearestPhone) then {
            _nearestPhone = _phoneObject;
        };

        if (_positionPhoneObject distance2D _position < (position _nearestPhone) distance2D _position) then {
            _nearestPhone = _phoneObject;
            _nearestPhoneIndex = _numberIndex;
        };
    } forEach _phoneObjects;
} forEach _allNumbers;

private _dialog = uiNamespace getVariable ['grad_telephone_rscPhoneBook',controlNull];

if (isNull _dialog) exitWith { hint (localize "STR_grad_telephone_error"); };

private _phoneList = _dialog displayCtrl 1000;
_phoneList lbSetCurSel _nearestPhoneIndex;
