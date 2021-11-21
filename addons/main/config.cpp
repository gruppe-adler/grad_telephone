#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "cba_common", "cba_settings" };
        authors[] = { "nomisum" };
        VERSION_CONFIG;
    };
};

#include "cfgEventhandlers.hpp"
#include "cfgFunctions.hpp"
#include "cfgSounds.hpp"
#include "rscDefines.hpp"
#include "rscKeypad.hpp"
#include "rscRotary.hpp"
#include "rscPhoneBook.hpp"
#include "cfgVehicles.hpp"
#include "cfgMarkers.hpp"