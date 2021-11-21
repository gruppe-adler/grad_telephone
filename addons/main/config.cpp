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

#include "cfgEventHandlers.hpp"
#include "cfgFunctions.hpp"
#include "cfgSounds.hpp"
#include "rscDefines.hpp"
#include "rscKeypad.hpp"
#include "rscRotary.hpp"
#include "rscPhoneBook.hpp"
#include "cfgVehicles.hpp"
