params [
    ["_unit", objNull, [objNull]],
    ["_object", objNull, [objNull]],
    ["_icon", "", [""]],
    ["_stringID", "noID", [""]],
    ["_displayName", "display Name", [""]],
    ["_color", "'#11FF11'", [""]],
    ["_functionToCall", {}, [{}]],
    ["_condition", {}, [{}]],
    ["_distance", 5, [5]]
];

/*
if (GRAD_TELEPHONE_DEBUG_MODE) then {
  diag_log format ["
    GRAD TELEPHONE: %1 %2 %3 %4 %5 %6 %7 %8 %9
  ", _unit, _object, _icon, _stringID, _displayName, _color, _functionToCall, _condition, _distance
  ];
};
*/

if ( isClass(configFile >> "CfgPatches" >> "ace_interact_menu") ) then {

      // ACE INTERACTION
      private _selfAction = _unit isEqualTo _object;

      private _getOffset = _object getVariable ["GRAD_Telephone_phoneCablePlugOffset", []];
      private _offset = [0,0,0];

      if (count _getOffset > 0) then {
          _offset = _getOffset;
          // systemChat ("offset " + (str _offset) + " detected");
      };

      private _action = [
          _stringID,
          ("<t color=" + _color + ">" + (_displayName) + "</t>"),
          _icon,
          { 
            params ["_target", "_player", "_params"];
            _params params ["_functionToCall", "_condition"];
            [_player, _target] call _functionToCall; 
          },
          { 
            params ["_target", "_player", "_params"];
            _params params ["_functionToCall", "_condition"]; 
            ([_player, _target] call _condition)
          },
          {}, [_functionToCall, _condition], {_offset}, _distance
      ] call ace_interact_menu_fnc_createAction;

      if (!_selfAction) then {

          private _gradTelephoneMainAction = ["GRAD_telephoneAction", "Main Action", "", {}, {true}] call ace_interact_menu_fnc_createAction;
          [_object, 0, [], _gradTelephoneMainAction] call ace_interact_menu_fnc_addActionToObject;

          [_object, 0, ["GRAD_telephoneAction"], _action] call ace_interact_menu_fnc_addActionToObject;
      } else {
          [_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
      };

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
          ("[_this, _originalTarget] call " + str (_condition))
      ];

      // systemChat str _actionID;
};


/*

// this works

private _functionToCall = grad_telephone_fnc_conditionCall; 
private _color = "'#FF00FF'"; 

cursorObject addAction [ 
          ("<t color=" + _color + ">" + "dfsfd" + "</t>"), 
          { params ["_target", "_caller", "_actionId", "_arguments"]; 
            _arguments params ["_functionToCall"]; 
            [_caller, _target] call _functionToCall; 
          }, 
          [_functionToCall],99,true,true,"", 
          ("_this call " + str (_condition)) 
      ];
*/