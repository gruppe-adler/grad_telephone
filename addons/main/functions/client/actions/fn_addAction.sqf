/*
private _callAction = ["startCall", "Call someone", "", {
    [] call grad_telephone_fnc_callStart;
},
{true}] call ace_interact_menu_fnc_createAction;

["Land_PhoneBooth_02_F", 0, ["ACE_MainActions"], _callAction, true] call ace_interact_menu_fnc_addActionToClass;
["Land_PhoneBooth_02_malden_F", 0, ["ACE_MainActions"], _callAction, true] call ace_interact_menu_fnc_addActionToClass;
*/

params ["_object"];

if (isNull _object) exitWith { diag_log format [": cant add action to deleted object %1", _object]; };

private _isVehicle = _object isKindOf "LandVehicle";

if (_isVehicle) then {

        _object addAction [
            "<t color='#11FF11'>Anruf annehmen</t>",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                    [_target] call grad_telephone_fnc_callAccept;
            },
            [],99,true,true,"",
            "[_this, _target] call grad_telephone_fnc_conditionAccept && driver _target == _this"
        ];

        _object addAction [
            "<t color='#FF1111'>Anruf beenden</t>",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                diag_log ("end call: " + str [_target, _caller, _actionId, _arguments]);

                private _state = _target getVariable ['grad_telephone_phoneStatus', "idle"];
                [_target, _state] call grad_telephone_fnc_callEnd;
            },
            [],99,true,true,"",
            "[_this, _target] call grad_telephone_fnc_conditionEnd && driver _target == _this"
        ];

} else {

        // todo make ace interact instead of mousewheel menu
        _object addAction [
            "Nummer wählen",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                    [_target] call grad_telephone_fnc_createPhoneList;
            },
            [],99,true,true,"",
            "[_this, _target] call grad_telephone_fnc_conditionCall"
        ];

        // later implementation for grenzmeldenetz
        _object addAction [
            "Kommandozentrale anrufen",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                    private _targetNumber = _target getVariable ['grad_telephone_directConnect', "all"];
                    private _allPhones = missionNamespace getVariable ['grad_telephone_ALLPHONES', []];
                    private _targetPhone = objNull;
                    {
                        private _phoneNumber = _x getVariable ['grad_telephone_NUMBER_ASSIGNED', "all"];
                        if (_targetNumber == _phoneNumber) exitWith {
                            _targetPhone = _x;
                        };
                    } forEach _allPhones;

                    [_target, [_targetPhone]] call grad_telephone_fnc_callStart;
            },
            [],99,true,true,"",
            "[_this, _target] call grad_telephone_fnc_conditionDirectCall"
        ];


        _object addAction [
            "<t color='#11FF11'>Anruf annehmen</t>",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                    [_target] call grad_telephone_fnc_callAccept;
            },
            [],99,true,true,"",
            "[_this, _target] call grad_telephone_fnc_conditionAccept"
        ];

        _object addAction [
            "<t color='#FF1111'>Anruf beenden</t>",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                diag_log ("end call: " + str [_target, _caller, _actionId, _arguments]);

                private _state = _target getVariable ['grad_telephone_phoneStatus', "idle"];
                [_target, _state] call grad_telephone_fnc_callEnd;
            },
            [],99,true,true,"",
            "[_this, _target] call grad_telephone_fnc_conditionEnd"
        ];

        _object addAction [
            "Nummer des Apparats anzeigen",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];

                hint format ["%1", _target getVariable ['GRAD_TELEPHONE_NUMBER_ASSIGNED', 'no Number']];
            },
            [],1.5,true,true,"",
            "_this distance _target < 2 && !(_target getVariable ['grad_telephone_skipDialing', false])"
        ];

};
