% this portion was done by Sarah
X = [5.9 60.1 18.5 13.4 2.8 1.3]; % generic US population pie chart
% data from census
% census data was only hard coding
labels = {'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'};
pie(X, labels)
title('Population of the US')