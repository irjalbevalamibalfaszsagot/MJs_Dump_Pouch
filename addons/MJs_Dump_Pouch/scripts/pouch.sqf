// Define max pouch capacity (as a percentage or specific weight/volume limit)
_pouchCapacity = 100; // Max capacity in percentage (0-100) or weight/volume units

// Items and their corresponding capacity usage (these are hypothetical values)
_itemCapacities = {
    "ACE_bandage" -> 2,    // Bandage takes up 2% of the pouch capacity
    "ACE_syringe" -> 1,    // Syringe takes up 1% of the pouch capacity
    "ACE_io_device" -> 5,  // IO device takes up 5% of the pouch capacity
};

// Track the pouch's current capacity usage
_currentPouchUsage = 0;  // Current usage in percentage (0 to 100)

// Function to add item to pouch
addItemToPouch = {
    params ["_itemToAdd"];
    
    // Get the item's capacity usage
    _capacityRequired = _itemCapacities select _itemToAdd;
    
    // Check if there's enough space in the pouch
    if ((_currentPouchUsage + _capacityRequired) <= _pouchCapacity) then {
        _currentPouchUsage = _currentPouchUsage + _capacityRequired; // Add item to pouch
        // Optionally, trigger visual updates or inventory changes here
    } else {
        hint "Not enough space in the dump pouch!";
    };
};

// Function to check pouch capacity and play sound if near full
checkPouchCapacity = {
    if (_currentPouchUsage >= 80) then {
        player playSound "shuffling_sound"; // Play the shuffling sound when near full
    };
};

// Event handler for player movement (running/jumping)
player addEventHandler ["AnimStateChanged", {
    params ["_unit", "_oldState", "_newState"];
    
    // Call the function to check pouch capacity on every move
    if (_newState in ["AmovPercMrun", "AmovPercJumps"]) then {
        [_unit] call checkPouchCapacity;
    };
}];
