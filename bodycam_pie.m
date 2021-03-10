% this portion was done by Sarah
X = [5.9 60.1 18.5 13.4 2.8 1.3]; % generic US population pie chart
% data from census
% census data was only hard coding
labels = {'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'};
pie(X, labels)
title('Population of the US')
% descriptive stats for bodycam 
bodycamcell = table2cell(body_cam);
tbl_bodycam = tabulate(bodycamcell);
counter = 0;
for ii = 1:length(bodycamcell) % xx = 1: length(numlist), numlist = list of bodycam variables
   string1 = bodycamcell(ii);
   if strcmp('False', string1)
       counter = counter + 1; % count number of false 
   else
       counter = counter + 1; % count number of true
   end
end
% pie chart showing statistical data for body cam
X = cell2mat(tbl_bodycam(:,2));
labels = {'No Body Cam', 'Body Cam'};
pie3(X,labels) % 3 D pie chart
title('Body cams on policemen')

