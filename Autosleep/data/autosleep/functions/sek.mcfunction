#wird alle 5 sekunden ausgeführt

#erhöht score "anz_schlaf" von Objekt "#liegt" für alle mit tag "liegt" um 1 
scoreboard players set #liegt anz_schlaf 0
execute as @a[tag=liegt] run scoreboard players add #liegt anz_schlaf 1

#berechnet noch fehlende Anzahl an schlafender Spieler
scoreboard players operation #fehlen notw_spieler = #spieler notw_spieler 
scoreboard players operation #fehlen notw_spieler -= #liegt anz_schlaf


#Sendet nachricht an alle mit anzahl schlafender Spieler
execute if score #liegt anz_schlaf matches 1 run tellraw @a ["",{"text":"Es liegen","color":"yellow"},{"text":" (","color":"yellow","bold":true},{"score":{"name":"#liegt","objective":"anz_schlaf"},"color":"yellow","bold":true},{"text":"/","color":"yellow","bold":true},{"score":{"name":"#spieler","objective":"anz_spieler"},"color":"yellow","bold":true},{"text":") ","color":"yellow","bold":true},{"text":"Spieler im Bett. Es müssen sich noch ","color":"yellow","bold":false},{"score":{"name":"#fehlen","objective":"notw_spieler"},"color":"yellow","bold":true},{"text":" weitere(r) Spieler hinlegen.","color":"yellow","bold":false}]

