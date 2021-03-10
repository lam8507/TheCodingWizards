% Using Census data to create a pie chart of the United States population racial profile
% Data accessed at: https://www.census.gov/quickfacts/fact/table/US/IPE120219

X = [5.9 60.1 18.5 13.4 2.8 1.3];

% Census data analysis was the only case of hard coding
labels = {'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'};
% Creating the pie chart
pie(X, labels)
title('Population of the US')

% Coding and debugging by Sarah, 1 hour
