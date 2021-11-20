class grad_telephone_rscPhoneBook {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_telephone_rscPhoneBook', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_telephone_rscPhoneBook', controlNull]; [] call grad_telephone_fnc_cleanPhoneBookMap;";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class phoneBookList: grad_telephone_RscListBox
            {
                idc = 1000;
                x = GRAD_TELEPHONE_PHONEBOOK_X;
                y = GRAD_TELEPHONE_PHONEBOOK_Y;
                w = (GRAD_TELEPHONE_100W/2) - (GRAD_COLUMN_W); // 0.7
                h = GRAD_TELEPHONE_PHONEBOOK_H;
                colorBackground[] = {0,0,0,0.85};
                canDrag=false;
                text = "";
                rowHeight = GRAD_ROW_H*2;
                onLBSelChanged = "_this call grad_telephone_fnc_onPhoneBookEntrySelect";
            };
        class phoneBookMap: grad_telephone_RscMapControl 
            {
                idc = 2000;
                x = GRAD_TELEPHONE_100W/2;
                y = GRAD_TELEPHONE_PHONEBOOK_Y;
                w = (GRAD_TELEPHONE_100W/2) - (GRAD_COLUMN_W); // 0.7
                h = GRAD_TELEPHONE_PHONEBOOK_H;
                onMouseButtonClick = "_this call grad_telephone_fnc_onPhoneBookMapClick";
            };
        class phoneBookButton: grad_telephone_RscButton
            {
                text = "Anrufen";
                idc = 3000;
                x = GRAD_TELEPHONE_PHONEBOOK_X;
                y = GRAD_TELEPHONE_PHONEBOOK_H + GRAD_TELEPHONE_PHONEBOOK_Y;
                w = GRAD_TELEPHONE_100W - (GRAD_COLUMN_W*2);
                h = GRAD_ROW_H*2;
            };
    };
};