#wird alle 8 sekunden ausgefuehrt

#erhoeht score "as_anz_schlaf" von Objekt "#liegt" fuer alle mit tag "liegt" um 1 
scoreboard players set #liegt as_anz_schlaf 0
execute as @a[tag=liegt] run scoreboard players add #liegt as_anz_schlaf 1

#berechnet noch fehlende Anzahl an schlafender Spieler
scoreboard players operation #fehlen as_notw_spieler = #spieler as_notw_spieler 
scoreboard players operation #fehlen as_notw_spieler -= #liegt as_anz_schlaf


#Sendet nachricht an alle mit anzahl schlafender Spieler
execute if score #liegt as_anz_schlaf matches 1.. run tellraw @a ["",{"text":"Es liegen","color":"yellow"},{"text":" (","color":"yellow","bold":true},{"score":{"name":"#liegt","objective":"as_anz_schlaf"},"color":"yellow","bold":true},{"text":"/","color":"yellow","bold":true},{"score":{"name":"#spieler","objective":"as_anz_spieler"},"color":"yellow","bold":true},{"text":") ","color":"yellow","bold":true},{"text":"Spieler im Bett. Es fehlen noch ","color":"yellow","bold":false},{"score":{"name":"#fehlen","objective":"as_notw_spieler"},"color":"yellow","bold":true},{"text":" weitere(r) Spieler.","color":"yellow","bold":false}]

