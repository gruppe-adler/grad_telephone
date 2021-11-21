params [
    ["_unit", objNull],
    ["_object", objNull],
    ["_icon", ""],
    ["_stringID", "noID"],
    ["_displayName", "display Name"],
    ["_color", "#11FF11"],
    ["_functionToCall", "GRAD_telephone_fnc_nothing"],
    ["_condition", "true"],
    ["_distance", 5]
];

if (GRAD_TELEPHONE_DEBUG_MODE) then {
  diag_log format ["
    GRAD TELEPHONE: %1 %2 %3 %4 %5 %6 %7 %8 %9
  ", _unit, _object, _icon, _stringID, _displayName, _color, _functionToCall, _condition, _distance];
};


if ( isClass(configFile >> "CfgPatches" >> "ace_interact_menu") ) then {

      // ACE INTERACTION
      private _selfAction = (_unit isEqualTo _object);

      private _action = [
          _stringID,
          ("<t color='" + _color + "'>" + (_displayName) + "</t>"),
          _icon,
          compile _functionToCall,
          compile _condition,
          nil, nil, nil, _distance
      ] call ace_interact_menu_fnc_createAction;

      if (!_selfAction) then {
          [typeOf _object, 0, ["ACE_MainActions"], _action, false] call ace_interact_menu_fnc_addActionToClass;
      } else {
          [_object, 1, ["ACE_SelfActions"], _action, false] call ace_interact_menu_fnc_addActionToObject;
      };

} else {

      // VANILLA ACTION
      _object addAction [
          ("<t color='" + _color + "'>" + (_displayName) + "</t>"),
          compile _functionToCall,
          [],99,true,true,"",
          _condition
      ];
};
