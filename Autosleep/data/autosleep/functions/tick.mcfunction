# Tick-Datei

#führt alle 8 sekunden 5sek Datei aus
scoreboard players add #tick as_timer 1
execute if score #tick as_timer matches 160.. run function autosleep:sek
execute if score #tick as_timer matches 160.. run scoreboard players set #tick as_timer 0

#speichere Tageszeit in Objekt Tageszeit mit Ziel as_zeit
execute store result score #tageszeit as_zeit run time query daytime

#speichere Spieleranzahl in Objekt "#spieler" und Ziel "as_anz_spieler"
execute store result score #spieler as_anz_spieler run list

#übertrage die Schlafdauer jedes spielers in sein eigenes Ziel "as_dauer_schlaf"
execute as @a store result score @s as_dauer_schlaf run data get entity @s SleepTimer 1

#setzt anzahl schlafender spieler auf 0 und addiert anschließend für jeden Spieler mit einer Schlafdauer > 99 einen Wert auf Ziel "as_anz_schlaf" von Objekt "#spieler"
scoreboard players set #spieler as_anz_schlaf 0
execute as @a if score @s as_dauer_schlaf matches 100.. run scoreboard players add #spieler as_anz_schlaf 1

#vergibt jedem spieler der im bett liegt ein Tag "liegt" 
execute as @a[tag=!liegt] if score @s as_dauer_schlaf matches 1.. run tag @s add liegt
execute as @a[tag=liegt] if score @s as_dauer_schlaf matches 0 run tag @s remove liegt

#testet ob ergebnis ungerade zahl ist (+1) und legt notwenige Anzahl schlafender Spieler auf die Hälfte fest
scoreboard players operation #spieler as_notw_spieler = #spieler as_anz_spieler

scoreboard players operation #spieler as_modulo_test = #spieler as_notw_spieler
scoreboard players operation #spieler as_modulo_test %= #teiler as_notw_spieler
execute if score #spieler as_modulo_test matches 1 run scoreboard players add #spieler as_notw_spieler 1

scoreboard players operation #spieler as_notw_spieler /= #teiler as_notw_spieler

#wenn notwendige Anzahl und schlafende spieler übereinstimmen, setzte Tageszeit auf 0 und erhöhe Tag um 1
execute if score #spieler as_anz_schlaf = #spieler as_notw_spieler if score #tageszeit as_zeit matches 0 run time add 1d
execute if score #spieler as_anz_schlaf = #spieler as_notw_spieler run time set 0

#





