#Tag Datei fuer korrekten Tageszaehler - wird durch Tick verzoegerung 2 mal ausgefuehrt
#if score test as_zeit matches 0 laesst alle befehle nur einmal ausfuehren

#uebernimmt den aktuellen Tageswert und erhoeht ihn um 1
execute if score #test as_zeit matches 0 run scoreboard players operation #tag_fix as_zeit = #tag as_zeit
execute if score #test as_zeit matches 0 run scoreboard players add #tag_fix as_zeit 1

#setzt tageszeit auf morgen zurueck
execute if score #test as_zeit matches 0 run time set 0

#fuehrt Funktion aus, um den Tageswert zu korrigieren
execute if score #test as_zeit matches 0 run function autosleep:fix

#Dient nur zu Testzwecken
#execute if score #test as_zeit matches 0 run say tagchen

#erhoeht den Counter, welcher den aktuellen Durchlauf testet, ob er bereits durchgefuehrt wurde und setzt ihn nach dem zweiten mal zurueck.
scoreboard players add #test as_zeit 1
execute if score #test as_zeit matches 2.. run scoreboard players set #test as_zeit 0