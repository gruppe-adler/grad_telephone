#include "script_macros.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "cba_a3" };
        authors[] = { "nomisum" };
        VERSION_CONFIG;
    };
};

#include "cfgFunctions.hpp"
#include "cfgSounds.hpp"
