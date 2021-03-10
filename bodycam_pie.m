% Visualization for officers wearing and not wearing a body camera when shooting occurred

% Reading the table downloaded from GitHub
T = readtable('fatal-police-shootings-data.csv');

% Extracting the body_cam variable
body_cam = T(:,14);

% Peforming descriptive stats for bodycam 
bodycamcell = table2cell(body_cam);
tbl_bodycam = tabulate(bodycamcell);
% We use a counter and for loop and if statement to count for body camera 'False' and other
counter = 0; 
for ii = 1:length(bodycamcell) % xx = 1: length(numlist), numlist = list of bodycam variables
   string1 = bodycamcell(ii);
   if strcmp('False', string1) 
       counter = counter + 1; % Count number of false 
   else
       counter = counter + 1; % Count number of true
   end
end

% Creating a pie chart that uses statistical data for wearing a body camera or not
X = cell2mat(tbl_bodycam(:,2));
labels = {'No Body Cam', 'Body Cam'};
pie3(X,labels) % 3 D pie chart
title('Body cams on policemen')

% Written by: Sarah, 4 hours
% Debugged by: Michelle, 4 hours
% Collaborated with Pair Programming
