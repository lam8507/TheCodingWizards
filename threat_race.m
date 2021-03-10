threatlevelcell = table2cell(threat_level);
threatlevel_string = string(threatlevelcell);
threat_level_attack = []
for ii = 1:length(threatlevel_string)
        if threatlevel_string(ii) == "attack" 
        
        threat_level_attack = [threat_level_attack , ii];
        end
end
% converts race from tbl to cell and from cell to string
racecell = table2cell(race);
race_string = string(racecell);
threat_level_string = string(threat_level_clean);
tbl_threat_level = tabulate(threat_level_clean); % tabulate shows specific numbers from dataset
tbl_race = tabulate(racecell);
 
for ii = 1:length(race_string)
    if race_string(ii) ~= "B"
       race_string(ii) = "O";
    end
end
    
for jj = 1:length(threat_level_clean)
    if threat_level_string(jj) ~= "attack"
    threat_level_string(jj) = "other";
    end
end
  

black_threat_attack = 0;
other_threat_attack = 0;
black_other_threat = 0;
other_other_threat = 0;
for k = 1:length(threat_level_clean)
    if threat_level_string(k) == "attack" && race_string(k) == "B"
        black_threat_attack = black_threat_attack + 1;
    elseif threat_level_string(k) == "attack" && race_string(k) == "O"
        other_threat_attack= other_threat_attack + 1;
    elseif threat_level_string(k) == "other" && race_string(k) == "B"
        black_other_threat = black_other_threat + 1;
    elseif threat_level_string(k) == "other" && race_string(k) == "O"
        other_other_threat = other_other_threat + 1;
    end
end
% raw data for Black perceived threat vs perceived threat from Other races
x = categorical({'Black','Other'});
attack_threat = vertcat(black_threat_attack, other_threat_attack);
other_threat = vertcat(black_other_threat,other_other_threat);
y = horzcat(attack_threat, other_threat);
bar(x,y)
legend('Attack', 'Other Threat')
title('Threat Level Raw Data Comparison')
 
% general pie chart for threat level comparisons
x2 = cell2mat(tbl_threat_level(:,2));
labels = {'attack', 'other'};
pie3(x2,labels)
title('Threat Level General Comparison')
