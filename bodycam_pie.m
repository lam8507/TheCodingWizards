X = [5.9 60.1 18.5 13.4 2.8 1.3]; % generic US population pie chart
% data from census
labels = {'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'};
pie(X, labels)
title('Population of the US')
X2 = [5313 774];
labels = {'No Body Cam', 'Body Cam'};
pie3(X2,labels) % 3-D pie chart
title('Body Cams on Policemen')
