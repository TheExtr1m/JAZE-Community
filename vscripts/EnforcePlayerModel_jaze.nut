//==============================================================================\\
// Скрипт заменяет встроенный в карту, изменяет модель людей на изменённую (для оптимизации сервера)
//==============================================================================\\

function ModelBeforeZM() {
    pl <- null
    while ((pl = Entities.FindByClassname(pl, "player")) != null) {
        pl.SetModel("models/player/custom_player/legacy/gondorknight_jaze/gondorknight_jaze.mdl")
    }
}

function CheckForMotherZombieSpawn() {
    zombie <- null

    // Try to find the mother zombie
    while(zombie = Entities.FindByClassname(zombie, "player")){

        // If a terrorist with over 600hp is found (mother zombie), exit and stop checking
        if(zombie.GetTeam() == 2 && zombie.GetHealth() > 600){
            EntFire("MZMTimer", "Disable", "", 0.0, null)
            EntFire("MZMTimer", "Kill", "", 1.0, null)
            return
        }
    }

    // Set player models otherwise
    ModelBeforeZM()
}