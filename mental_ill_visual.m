T = readtable('fatal-police-shootings-data.csv'); % extracting
mental_illness = T(:,11); % extracting from column 11 in csv
% mental illness is presented in the csv as "True" or "False"

% simple portion done by Sarah
T = readtable('fatal-police-shootings-data.csv');
mental_illness = T(:,11);
race = T(:, 8);

% pie chart for history of mental illness
mental_illness_cell = table2cell(mental_illness); % converting to cell
tbl_mental_illness = tabulate(mental_illness_cell); % shows specific number of true/false
X = cell2mat(tbl_mental_illness(:,2)); % converting to matrix so it's not hard coding
labels = {'No Mental Illness', 'Mental Illness'};
pie3(X,labels)
title('History of Mental Illness in Victims')
% Estimated time: 1 hour
% Written by Sarah (pair programmed with Michelle)
