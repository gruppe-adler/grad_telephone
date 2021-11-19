#include "script_component.hpp"

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

#define GRAD_TELEPHONE_DEBUG_MODE true

#define GRAD_TELEPHONE_NUMBER_PREFIXES [0030]
#define GRAD_TELEPHONE_NUMBER_LENGTH [7,8]

#define GRAD_TELEPHONE_CLASSNAMES_PHONE ["land_gm_euro_misc_feh_62_e", "land_gm_euro_misc_telh_78_w"]
#define GRAD_TELEPHONE_CLASSNAMES_GMN ["land_gm_wall_gc_borderpost_03", "land_gm_wall_gc_borderpost_04"]


#include "cfgFunctions.hpp"
#include "cfgSounds.hpp"
