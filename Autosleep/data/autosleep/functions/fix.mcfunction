#Tag_Fix Datei ruft sich rekursiv entsprechend oft auf um Tageszaehler zu korrigieren

execute if score #tag_fix as_zeit matches 1.. run time add 1d
execute if score #tag_fix as_zeit matches 1.. run scoreboard players remove #tag_fix as_zeit 1
execute if score #tag_fix as_zeit matches 1.. run function autosleep:fix


#Kontrolle
#say tagfix