% Visualization of United States population

X = [5.9 60.1 18.5 13.4 2.8 1.3]; % Creating a generic US population pie chart
% Data extracted from Census
% Census data was only instance of hard coding in our project
labels = {'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'};

% Creating a pie chart
pie(X, labels)
title('Population of the US')

% Written by Sarah, 2 hours
% Debugging by Laurel, Michelle, 0.5 hour
% Collaborated with Pair Programming
