params ["_unit", "_icon", "_stringID", "_displayName", "_color", "_functionToCall"];

private _conditionAction = {
  params ["_player", "_target"];

  _player distance _target < 3
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

    [typeOf _unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;

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