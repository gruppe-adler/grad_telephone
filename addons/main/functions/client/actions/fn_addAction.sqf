/*

["_object", objNull],
["_icon", "iconPath.paa"],
["_stringID", "noID"],
["_displayName", ["display Name"]],
["_color", ["#11FF11"]],
["_functionToCall", "GRAD_telephone_fnc_nothing"]
["_condition", {true}],
["_distance", 5]

*/

params ["_object"];

if (isNull _object) exitWith { diag_log format ["GRAD TELEPHONE: cant add action to deleted object %1", _object]; };

private _unit = player;
private _isVehicle = _object isKindOf "LandVehicle";

if (_isVehicle) then {

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callAccept",
          localize "STR_grad_telephone_callAccept", "#11FF11",
          grad_telephone_fnc_callAccept,
          grad_telephone_fnc_conditionAcceptDriver
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callEnd",
          localize "STR_grad_telephone_callEnd", "#FF1111",
          grad_telephone_fnc_callEnd,
          grad_telephone_fnc_conditionEndDriver
        ] call GRAD_telephone_fnc_addActionGeneral;

} else {

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callDial",
          localize "STR_grad_telephone_callDial", "#FF1111",
          grad_telephone_fnc_createPhoneList,
          grad_telephone_fnc_conditionCall
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callCIC",
          localize "STR_grad_telephone_callCIC", "#FF1111",
          grad_telephone_fnc_createPhoneList,
          grad_telephone_fnc_conditionDirectCall
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callAccept",
          localize "STR_grad_telephone_callAccept", "#11FF11",
          grad_telephone_fnc_callAccept,
          grad_telephone_fnc_conditionAccept
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callEnd",
          localize "STR_grad_telephone_callEnd", "#FF1111",
          grad_telephone_fnc_callEnd,
          grad_telephone_fnc_conditionEnd
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _unit,
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_showNumber",
          localize "STR_grad_telephone_showNumber", "#FF1111",
          { params ["_unit", "_object"]; hint format ['%1', _object getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', 'no Number']]; },
          { params ["_unit", "_object"]; _unit distance _object < 2 && !(_object getVariable ['grad_telephone_skipDialing', false]) }
        ] call GRAD_telephone_fnc_addActionGeneral;

};
