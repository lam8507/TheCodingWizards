% These visualizations compare the number of fatalities observed in the data with the expected number from racial group proportions

tbl_race = tabulate(racecell); % Extracts specific number in each race in dataset
x = categorical({'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'});
y2 = [354; 3606; 1110; 804; 48; 78]; % Pulls numbers from Census data when plotting expected # killed, inspired by discussion with Prof Serre!
% Data can be accessed at https://www.census.gov/quickfacts/fact/table/US/IPE120219
% We calculated these percentages by multiplying the # in csv file by the percentage of race in United States population
% Percentage of race in US pop was found not in github (so calculation was performed by us)

% Creating the visualizations
y1 = cell2mat(tbl_race(:,2));
y3 = horzcat(y1,y2);
% Expected number killed calculated from Census data by hand

bar(x,y3)
xlabel('Race')
ylabel('Number of Fatalities')
legend('Actual # Killed', 'Expected # Killed')
title('Fatalities by Race')

% Written by Sarah and Michelle: 3 hours
% Debugged by Sarah and Michelle: 3 hours
% Collaborated through Pair Programming
