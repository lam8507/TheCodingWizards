threatlevelcell = table2cell(threat_level);
threatlevel_string = string(threatlevelcell);
threat_level_attack = []
for ii = 1:length(threatlevel_string)
        if threatlevel_string(ii) == "attack" 
        
        threat_level_attack = [threat_level_attack , ii];
        end
end
