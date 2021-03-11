% Running a practice example before we implemented our statistical test

% Reading data
T = readtable('fatal-police-shootings-data.csv');

% Extracting race variable
race = T(:, 8);

% Practice extracting the number of Black people
racecell = table2cell(race);
race_string = string(racecell);  
B_race = [];
for ii = 1:length(race_string)
        if race_string(ii) == "B"
        
        B_race= [B_race, ii];
        end
end
B_race;

% Writing and debugging by Laurel and Sarah, 1 hour
