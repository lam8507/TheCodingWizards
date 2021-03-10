racecell = table2cell(race);
race_string = string(racecell);  
B_race = [];
for ii = 1:length(race_string)
        if race_string(ii) == "B"
        
        B_race= [B_race, ii];
        end
end
B_race;