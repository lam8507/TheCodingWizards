T = readtable('fatal-police-shootings-data.csv');
race = T(:,8);
threat_level = T(:,12);
% removing undetermined from the threat level variable
threat_level_clean = table2cell(threat_level);
idx = strcmp(threat_level_clean,'undetermined');
threat_level_clean(idx) = [];
% converting to cell and string
threatlevelcell = table2cell(threat_level);
threatlevel_string = string(threatlevelcell);
% extract number of attack through a vector
threat_level_attack = [];
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
tbl_race = tabulate(racecell); % this can be done in addition to the vector previously
 
for ii = 1:length(race_string)
    if race_string(ii) ~= "B"
       race_string(ii) = "O";
    end
end
% extract the two variables for threat level through a for loop  
for jj = 1:length(threat_level_clean)
    if threat_level_string(jj) ~= "attack"
    threat_level_string(jj) = "other";
    end
end
  
% for loop extracting when Black people were threatening by "attack", etc
black_threat_attack = 0; % initializing variables
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
% raw data for threat from Black people vs threat from Other races
x = categorical({'Black','Other'});
attack_threat = vertcat(black_threat_attack, other_threat_attack);
other_threat = vertcat(black_other_threat,other_other_threat);
y = horzcat(attack_threat, other_threat);
bar(x,y)
legend('Attack', 'Other Threat')
title('Threat Level Raw Data Comparison')
% future studies should further investigate this data!
 
% general pie chart for threat level comparisons
x2 = cell2mat(tbl_threat_level(:,2))
labels = {'attack', 'other'};
pie3(x2,labels)
title('Threat Level General Comparison')
% Written by: Sarah
% Pair Programmed with Michelle and Laurel
% Time taken: 5 hours
