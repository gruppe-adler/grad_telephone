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
#include "\dialogs\rscDefines.hpp"
#include "\dialogs\rscKeypad.hpp"
#include "\dialogs\rscRotary.hpp"
#include "\dialogs\rscPhonebook.hpp"