#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "cba_common" };
        authors[] = { "nomisum" };
        VERSION_CONFIG;
    };
};

#include "cfgFunctions.hpp"
#include "cfgSounds.hpp"
#include "x\grad_telephone\addons\main\dialogs\rscDefines.hpp"
#include "x\grad_telephone\addons\main\dialogs\rscKeypad.hpp"
#include "x\grad_telephone\addons\main\dialogs\rscRotary.hpp"
#include "x\grad_telephone\addons\main\dialogs\rscPhonebook.hpp"