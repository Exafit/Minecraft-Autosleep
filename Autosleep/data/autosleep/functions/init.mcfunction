# Init-Datei

#say start

scoreboard objectives add as_anz_spieler dummy
scoreboard objectives add as_dauer_schlaf dummy
scoreboard objectives add as_anz_schlaf dummy
scoreboard objectives add as_notw_spieler dummy
scoreboard objectives add as_modulo_test dummy
scoreboard objectives add as_zeit dummy
scoreboard objectives add as_timer dummy

scoreboard players reset * as_anz_spieler
scoreboard players reset * as_dauer_schlaf
scoreboard players reset * as_anz_schlaf
scoreboard players reset * as_notw_spieler
scoreboard players reset * as_modulo_test
scoreboard players reset * as_zeit
scoreboard players reset * as_timer

scoreboard players set #teiler as_notw_spieler 2


