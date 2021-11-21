/*

    initialize CBA settings

    _setting     - Unique setting name. Matches resulting variable name <STRING>
    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    _script      - Script to execute when setting is changed. (optional) <CODE>
    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>

*/

[
    "GRAD_telephone_setting_debugMode",
    "CHECKBOX",
    ["Debug Mode", "Debug Mode (Systemchat) enabled"],
    "",
    false, true, {
        GRAD_TELEPHONE_DEBUG_MODE = true; publicVariable "GRAD_TELEPHONE_DEBUG_MODE";
    }, true
] call CBA_fnc_addSetting;

[
    "GRAD_telephone_setting_classnames_rotary_phones",
    "EDITBOX",
    ["Rotary Phones","comma separated classnames without quotation marks."],
    "Objects that should become phones",
    false, true, {}, true
] call CBA_fnc_addSetting;

[
    "GRAD_telephone_setting_classnames_digits_phones",
    "EDITBOX",
    ["Digit Phones","comma separated classnames without quotation marks."],
    "Objects that should become phones",
    false, true, {}, true
] call CBA_fnc_addSetting;

[
    "GRAD_telephone_setting_classnames_rotary_phonebooths",
    "EDITBOX",
    ["Rotary Phonebooths","comma separated classnames without quotation marks."],
    "Objects that should become phones",
    false, true, {}, true
] call CBA_fnc_addSetting;

[
    "GRAD_telephone_setting_classnames_digits_phonebooths",
    "EDITBOX",
    ["Digit Phonebooths","comma separated classnames without quotation marks."],
    "Objects that should become phones",
    false, true, {}, true
] call CBA_fnc_addSetting;

[
    "GRAD_telephone_setting_areacodes",
    "EDITBOX",
    ["Area Codes","Phone number prefixes of any generated number. Comma separated numbers. Default: [030,040]."],
    "Phone Numbers",
    false, true, {}, true
] call CBA_fnc_addSetting;

[
    "GRAD_telephone_setting_numberlength",
    "EDITBOX",
    ["Phone Number Length","Array of phone number length [MIN,MAX]. Default: [7,8]."],
    "Phone Numbers",
    false, true, {}, true
] call CBA_fnc_addSetting;
