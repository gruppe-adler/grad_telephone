params ["_phoneObject", "_frequency", "_encryptionKey", "_status"];

//  private _lr_settings = [0, TFAR_default_radioVolume, [], 0, nil, -1, 0, nil, false, true];
/*
ARRAY: Settings [
            0: NUMBER - Active channel,
            1: NUMBER - Volume,
            2: ARRAY - Frequencies for channels,
            3: NUMBER - Stereo setting,
            4: STRING - Encryption code,
            5: NUMBER - Additional active channel,
            6: NUMBER - Additional active channel stereo mode,
            7: NIL
            8: NUMBER - Speaker mode,
            9: BOOLEAN - On
        ]
*/
// 
// 
// 
// private _lr_settings = [0, TFAR_default_radioVolume, [], 0, nil, -1, 0, nil, false, true];
// channel, volume, frequencies, STEREO, encryption, additional active channel, additional active stereo, empty, speaker mode, turned on
private _settingsID = "radio_settings";

TFAR_OverrideActiveLRRadio = if (_status) then {
    private _frequencies = [];

    // hardcode 9 channels with frequency. probably only necessary for channel 0
    for "_i" from 0 to 9 step 1 do {
            _frequencies set [_i, _frequency];
    };

    // generate radio settings for fake radio
    private _settings = [0, TFAR_default_radioVolume, _frequencies, 2, _encryptionKey, -1, 2, nil, false, true];
    
    _phoneObject setVariable [_settingsID, _settings, true];
    
        // log all the shit
    systemChat format ["grad-landline-debug: TFAR_OverrideActiveLRRadio: %1, settings are %2", _phoneObject, _settings];
    diag_log format ["grad-landline-debug: TFAR_OverrideActiveLRRadio: %1, settings are %2", _phoneObject, _settings];


    [_phoneObject, _settingsID] 

} else {

    missionNameSpace setVariable ["TF_lr_active_radio", nil];
    // remove radio settings from fake radio
    _phoneObject setVariable [_settingsID, nil, true];

    diag_log format ["grad-landline-debug: TFAR_OverrideActiveLRRadio set to nil"];

    nil

};

if (!(isNil "TFAR_OverrideActiveLRRadio")) then {
     // fill tf_lr_active_radio, reasons unknown (seems to be necessary for called guy)
    if (isNil "TF_lr_active_radio") then {
        missionNameSpace setVariable ["TF_lr_active_radio", TFAR_OverrideActiveLRRadio];
        diag_log format ["setting TF_lr_active_radio manually, as not defined before.."];
    };
    TFAR_OverrideActiveLRRadio call TFAR_fnc_setActiveLrRadio;
};