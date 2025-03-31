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
        picture = "addons\MJs_Dump_Pouch\textures\MJ’s Dump Pouch.paa"; // Image path
        action = "https://someurl.com"; // Optional URL for your mod
        hideName = 0;
        hidePicture = 0;
        name = "MJ's Dump Pouch";
        description = "A realistic dump pouch mod.";
        author = "MJ";
        version = "1.0";

        class init {
            file = "addons\MJs_Dump_Pouch\scripts\init.sqf"; // Path to your init script
        };
    };
};

class CfgWeapons {
    class ItemCore;
    class InventoryItem_Base_F;

    class MJ_Dump_Pouch_Item: InventoryItem_Base_F {
        scope = 2; // Make it visible in the editor and usable
        displayName = "MJ's Dump Pouch"; // Name shown in inventory
        model = "\addons\MJs_Dump_Pouch\models\pouch_model.p3d"; // 3D model for the pouch
        picture = "\addons\MJs_Dump_Pouch\textures\MJ’s Dump Pouch.paa"; // Icon to show in inventory
        descriptionShort = "A dump pouch for storing small items."; // Description
        mass = 5; // How heavy it is (example)
        class ItemInfo {
            type = 1; // Type of inventory item
        };
    };
};

class CfgSounds {
    sounds[] = {};

    class shuffling_sound {
        name = "shuffling_sound";
        sound[] = {"\addons\MJs_Dump_Pouch\sounds\shuffling.ogg", db+10, 1}; // Path to the sound file
        titles[] = {};
    };
};
