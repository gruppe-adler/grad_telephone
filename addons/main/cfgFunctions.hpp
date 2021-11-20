class cfgFunctions {

    class grad_telephone {

        class client_actions {
            file = "x\grad_telephone\addons\functions\client\actions";

            class addAction;
            class addSelfAction;
            class cleanPhoneBookMap;
            class conditionAccept;
            class conditionCall;
            class conditionDirectCall;
            class conditionEnd;
            class createPhoneList;
            class curatorTogglePhone;
            class onPhoneBookEntrySelect;
            class onPhoneBookMapClick;
        };

         class client_keypad {
            file = "x\grad_telephone\addons\functions\client\keypad";

            class keypadDialNumber;
            class keypadProcessInput;
        };

        class client_rotary {
            file = "x\grad_telephone\addons\functions\client\rotary";

            class rotaryDialNumber;
            class rotaryProcessInput;
            class rotarySetAngle;
        };

        class client_calls {
            file = "x\grad_telephone\addons\functions\client\calls";

            class callAccept;
            class callDeleteInfo;
            class callEnd;
            class callGetInfo;
            class callGetOwner;
            class callGetStatus;
            class callPluginActivate;
            class callPluginDeactivate;
            class callSaveInfo;
            class callSetOwner;
            class callSetStatus;
            class callStart;
            class callWaiting;

        };

        class client_hooking {
            file = "x\grad_telephone\addons\functions\client\hooking";

            class hookEnd;
            class hookStart;
            class hookShowCalls;
        };


        class client_sounds {
            file = "x\grad_telephone\addons\functions\client\sounds";

            class soundBusy;
            class soundHookEnd;
            class soundHookRemote;
            class soundHookStart;
            class soundInterrupted;
            class soundRing;
            class soundWaiting;

        };

        class client_far {
            file = "x\grad_telephone\addons\functions\client\tfar";

          class setTFARfakeRadio;
        };




        class server_calls {
           file = "x\grad_telephone\addons\functions\server\calls";

           class callRegister;
           class callRinging;
           class callUnregister;
        };

        class server_core {
           file = "x\grad_telephone\addons\functions\server\core";

           class addPhone;
           class distributePhones;
           class initServer { preInit = 1; };
        };

        class server_number {
           file = "x\grad_telephone\addons\functions\server\number";

           class assignNumber;
           class extractNumberFromPrefix;
           class generateBaseNumber;
           class generatePhoneNumber;
        };

    };

};
