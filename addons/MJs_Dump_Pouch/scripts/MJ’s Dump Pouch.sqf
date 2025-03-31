//// MJ’s Dump Pouch ////

// Define the dump pouch item
class CfgWeapons {
    class ACE_ItemCore;
    class Dump_Pouch: ACE_ItemCore {
        displayName = "Dump Pouch";
        descriptionShort = "A dump pouch for collecting used medical items.";
        model = "\\A3\\weapons_f\\acc\\acc_pouch.p3d";
        picture = "@MJ’s Dump Pouch\\addons\\textures\\MJ’s Dump Pouch.paa"; // Updated path to custom inventory image
        scope = 2;
        class ItemInfo {
            mass = 5; // Adds weight but takes no inventory space
        };
    };
};

// Function to detect medical usage and store waste
player addEventHandler ["Fired", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
    
    if ((primaryWeapon _unit) isEqualTo "ACE_Bandage") then {
        if ("Dump_Pouch" in assignedItems _unit) then {
            hint "Medical waste stored in dump pouch!";
        } else {
            hint "Medical waste dropped on the ground!";
        };
    };
}];

// ACE Interaction to empty the dump pouch
if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
    [{
        private _unit = _this select 0;
        if ("Dump_Pouch" in assignedItems _unit) then {
            hint "You emptied your dump pouch.";
            // Clear stored items logic goes here
        } else {
            hint "You don't have a dump pouch!";
        };
    }, [], "Empty Dump Pouch", {true}, {true}] call ace_interact_menu_fnc_addActionToObject;
};
