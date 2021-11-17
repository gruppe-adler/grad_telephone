#include "rscDefines.hpp"

class _rscPhoneBook {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['_rscPhoneBook', _this select 0];";
    onUnload = "uiNamespace setVariable ['_rscPhoneBook', controlNull]; [] call _fnc_cleanPhoneBookMap;";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class phoneBookList: _RscListBox
            {
                idc = 1000;
                x = _PHONEBOOK_X;
                y = _PHONEBOOK_Y;
                w = (_100W/2) - (GRAD_COLUMN_W); // 0.7
                h = _PHONEBOOK_H;
                colorBackground[] = {0,0,0,0.85};
                canDrag=false;
                text = "";
                rowHeight = GRAD_ROW_H*2;
                onLBSelChanged = "_this call _fnc_onPhoneBookEntrySelect";
            };
        class phoneBookMap: _RscMapControl 
            {
                idc = 2000;
                x = _100W/2;
                y = _PHONEBOOK_Y;
                w = (_100W/2) - (GRAD_COLUMN_W); // 0.7
                h = _PHONEBOOK_H;
                onMouseButtonClick = "_this call _fnc_onPhoneBookMapClick";
            };
        class phoneBookButton: _RscButton
            {
                text = "Anrufen";
                idc = 3000;
                x = _PHONEBOOK_X;
                y = _PHONEBOOK_H + _PHONEBOOK_Y;
                w = _100W - (GRAD_COLUMN_W*2);
                h = GRAD_ROW_H*2;
            };
    };
};