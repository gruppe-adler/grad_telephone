params ["_unit", "_icon", "_stringID", "_displayName", "_color", "_functionToCall"];

private _conditionAction = {
  private _playerPhonebook = player getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []] + (missionNamespace getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []]);
  private _otherUnitPhonebook = _target getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []] + (missionNamespace getVariable ["GRAD_TELEPHONE_ALLNUMBERS", []]);
  private _sortedNamesPlayer = _playerPhonebook call BIS_fnc_sortAlphabetically; 
  private _sortedNamesUnit = _otherUnitPhonebook call BIS_fnc_sortAlphabetically;

  !(_sortedNamesPlayer isEqualTo _sortedNamesUnit)
};

if ( isClass(configFile >> "CfgPatches" >> "ace_interact_menu") ) then {

      
      private _action = [
          _stringID,
          ("<t color=" + _color + ">" + (_displayName) + "</t>"),
          _icon,
          { 
            params ["_target", "_player", "_params"];
            _params params ["_functionToCall", "_conditionAction"];
            [_player, _target] call _functionToCall; 
          },
          { 
            params ["_target", "_player", "_params"];
            _params params ["_functionToCall", "_conditionAction"]; 
            ([_player, _target] call _conditionAction)
          },
          {}, [_functionToCall, _conditionAction], nil, 4
      ] call ace_interact_menu_fnc_createAction;

    [_unit, 1, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

} else {
    
      // VANILLA ACTION
      private _actionID = _object addAction [
          ("<t color=" + _color + ">" + _displayName + "</t>"),
          { 
            params ["_target", "_caller", "_actionId", "_arguments"];
            _arguments params ["_functionToCall"];
            [_caller, _target] call _functionToCall;
          },
          [_functionToCall],99,true,true,"",
          ("[_this, _originalTarget] call " + str (_conditionAction))
      ];

      // systemChat str _actionID;
};