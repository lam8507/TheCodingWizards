T = readtable('fatal-police-shootings-data.csv');

race = T(:, 8);

% coding practice when doing statistical analyses
% this would just be a stat test extracting the number of Black people
racecell = table2cell(race);
race_string = string(racecell);  
B_race = [];
for ii = 1:length(race_string)
        if race_string(ii) == "B"
        
        B_race= [B_race, ii];
        end
end
B_race;