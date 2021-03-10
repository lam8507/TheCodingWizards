% simple portion done by Sarah
T = readtable('fatal-police-shootings-data.csv');
mental_illness = T(:,11);
% pie chart for history of mental illness
mental_illness_cell = table2cell(mental_illness);
tbl_mental_illness = tabulate(mental_illness_cell);
X = cell2mat(tbl_mental_illness(:,2));
labels = {'No Mental Illness', 'Mental Illness'};
pie3(X,labels)
title('History of Mental Illness in Victims')

