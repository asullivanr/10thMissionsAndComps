//------------------- Misc

enableSaving[false,false];
enableEnvironment false; // Enable/disable environmental effects: ambient life and/or ambient sound.


//Removes corpse after disconnect.
addMissionEventHandler ["HandleDisconnect", {
    deleteVehicle (_this select 0);
}];