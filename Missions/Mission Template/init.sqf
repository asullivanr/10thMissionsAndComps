//sleep 1; //wait for mission start (so we can hopefully not have an arma related bug because someone was a little fast)

//waitUntil {!isNull(player)}; // makes sure a player instance was created.

// Allows increasing the tfar multiplier. useful for larger maps.
//player setVariable ["tf_receivingDistanceMultiplicator", 1]; 

[] spawn {
    // No fatigue/stamina
    while {true} do {
        player enableStamina false;
        player forceWalk false;
        uiSleep 6;
    };
};
[] spawn {
    // removes the ability for a player to get a negative rating that might prevent them from getting into a vehicle.
    // checks for an update every 10 seconds.
    while{true} do {
        waitUntil {
            sleep 10;
            !isNUll(player) && rating player < 0
        };
            player addRating (-(rating player));
    };
};
"respawn_west" setMarkerPosLocal [markerPos "respawn_West" select 0, markerPos "respawn_West" select 1, 1];
_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};

[] spawn _EndSplashScreen;