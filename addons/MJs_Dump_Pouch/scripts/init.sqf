// init.sqf for MJ's Dump Pouch

// Initialize pouch inventory and capacity (server-side)
if (isServer) then {
    // Placeholder for dump pouch contents
    _pouchInventory = []; // Pouch will hold items like "Used Bandage", "Syringe", etc.
    
    // Define pouch capacity (percentage or weight-based)
    _pouchCapacity = 100; // Max capacity (100% or defined weight/volume units)
    _currentPouchUsage = 0; // Track current pouch usage (percentage or weight)

    // Item capacities in the pouch (adjust values as needed)
    _itemCapacities = {
        "ACE_bandage" -> 2,    // Bandage takes up 2% of pouch capacity
        "ACE_syringe" -> 1,    // Syringe takes up 1% of pouch capacity
        "ACE_io_device" -> 5   // IO device takes up 5% of pouch capacity
    };

    // Handle adding an item to the pouch
    _addItemToPouch = {
        params ["_item"];

        // Check if item exists in the pouch and its capacity usage
        _capacityRequired = _itemCapacities select _item;
        
        if ((_currentPouchUsage + _capacityRequired) <= _pouchCapacity) then {
            _currentPouchUsage = _currentPouchUsage + _capacityRequired; // Add the item to pouch
            _pouchInventory pushBack _item; // Add item to the pouch
        } else {
            hint "Not enough space in the dump pouch!"; // Inform the player if pouch is full
        };
    };

    // Example: When healing someone, add used medical items to the pouch
    player addEventHandler ["Ace_Heal_Complete", {
        private["_unit", "_pouch"];
        _unit = _this select 0;
        _pouch = _unit getVariable ["MJ_DumpPouch", nil];
        
        if (!isNil "_pouch") then {
            // Example: Add used bandage to the pouch
            _pouch call _addItemToPouch "ACE_bandage";
        };
    }];

    // Function to check pouch capacity and play shuffling sound if pouch is 80% full
    checkPouchCapacity = {
        if (_currentPouchUsage >= 80) then {
            player playSound "shuffling_sound"; // Play shuffle sound when pouch is 80% full
        };
    };

    // Event handler to track player movement and check pouch capacity (when running/jumping)
    player addEventHandler ["AnimStateChanged", {
        params ["_unit", "_oldState", "_newState"];
        
        if (_newState in ["AmovPercMrun", "AmovPercJumps"]) then {
            [_unit] call checkPouchCapacity; // Check the pouch when moving fast
        };
    }];
};

// Ensure the pouch item is added to the player's inventory on mission start (local)
if (isClient) then {
    player addItem "MJ_Dump_Pouch_Item"; // Adds the pouch item to the player's inventory

    // Optional: Initialize pouch contents (for testing)
    player setVariable ["MJ_DumpPouch", _pouchInventory];
};
