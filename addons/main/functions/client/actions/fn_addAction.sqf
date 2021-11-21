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

if (isNull _object) exitWith { diag_log format [": cant add action to deleted object %1", _object]; };

private _isVehicle = _object isKindOf "LandVehicle";

if (_isVehicle) then {

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callAccept",
          "Accept Call", "#11FF11",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_callAccept",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_conditionAccept && driver" + str _object + " == " + str _unit
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callEnd",
          "End Call", "#FF1111",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_callEnd",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_conditionEnd && driver" + str _object + " == " + str _unit
        ] call GRAD_telephone_fnc_addActionGeneral;

} else {

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callDial",
          "Dial Number", "#FF1111",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_createPhoneList",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_conditionCall"
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callCIC",
          "Call Combat Information Center", "#FF1111",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_createPhoneList",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_conditionDirectCall"
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callAccept",
          "Accept Call", "#11FF11",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_callAccept",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_conditionAccept"
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_callEnd",
          "End Call", "#FF1111",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_callEnd",
          "[" + str _unit + "," + str _object + "] call grad_telephone_fnc_conditionEnd"
        ] call GRAD_telephone_fnc_addActionGeneral;

        [
          _object,
          "x\grad_telephone\addons\main\data\ico_phone.paa",
          "grad_telephone_action_showNumber",
          "Show Number of this Phone", "#FF1111",
          "hint format ['%1', " + str _object + " getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', 'no Number']]",
          (str _unit) + "distance " + str _object + " < 2 && !(" + str _object + " getVariable ['grad_telephone_skipDialing', false])"
        ] call GRAD_telephone_fnc_addActionGeneral;

};
