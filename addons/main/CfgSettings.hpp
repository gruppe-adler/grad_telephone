class CfgSettings {
    class CBA {
        class Versioning {
            class grad_telephone {
                class dependencies {
                    // Hard exit if cba/ace is missing or is a wrong version
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};
                };
            };
        };
    };
};
