class CfgPatches {
    class MJ_Dump_Pouch {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.96; // or whatever version you need
        requiredAddons[] = {};
    };
};

class CfgMods {
    class MJ_Dump_Pouch {
        dir = "@MJ's Dump Pouch";
        picture = "\@MJ's Dump Pouch\addons\textures\MJ’s Dump Pouch.paa"; // Image path
        action = "https://someurl.com"; // Optional URL for your mod
        hideName = 0;
        hidePicture = 0;
        name = "MJ's Dump Pouch";
        description = "A realistic dump pouch mod.";
        author = "MJ";
        version = "1.0";

        class init {
            file = "scripts\init.sqf"; // Path to your init script
        };
    };
};
