// Pouch capacity and item tracking
_pouchCapacity = 100;  // Max capacity (percentage)
_currentPouchUsage = 50;  // Example current usage

// Play the open sound when the pouch is opened
player addAction ["Open Dump Pouch", {
    player playSound "addons\sounds\pouch\mj_pouch_open.ogg";  // Play the open sound
}];

// Play the close sound when the pouch is closed
player addAction ["Close Dump Pouch", {
    player playSound "addons\sounds\pouch\mj_pouch_close.ogg";  // Play the close sound
}];

// Check if the pouch is almost full and play shuffle sound
checkPouchCapacity = {
    if (_currentPouchUsage >= 80) then {
        player playSound "addons\sounds\encumbered_player_movement\mj_pouch_shuffle_1.ogg";  // Play the shuffle sound when almost full
    };
};

// Event handler for player movement (running or jumping)
player addEventHandler ["AnimStateChanged", {
    params ["_unit", "_oldState", "_newState"];
    
    // Trigger shuffle sound when player is running or jumping
    if (_newState in ["AmovPercMrun", "AmovPercJumps"]) then {
        [_unit] call checkPouchCapacity;
    };
}];
