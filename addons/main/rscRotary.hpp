class grad_telephone_rscRotary {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_telephone_rscRotary', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_telephone_rscRotary', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class rotary_back: grad_telephone_RscPicture
            {
               idc = 4000;
               text = "x\grad_telephone\addons\main\data\rotary_back.paa";
               x = GRAD_TELEPHONE_100W/2 - 0.5;
               y = GRAD_TELEPHONE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_front: grad_telephone_RscPicture
            {
               idc = 5000;
               text = "x\grad_telephone\addons\main\data\rotary_front.paa";
               x = GRAD_TELEPHONE_100W/2 - 0.5;
               y = GRAD_TELEPHONE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_ping: grad_telephone_RscPicture
            {
               idc = -1;
               text = "x\grad_telephone\addons\main\data\rotary_ping.paa";
               x = GRAD_TELEPHONE_100W/2 - 0.5;
               y = GRAD_TELEPHONE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };
    };
};