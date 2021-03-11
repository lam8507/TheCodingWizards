% This is a "notes" file mostly filled with scratch notes
% Sarah was primarily in charge of visualizations 
% Laurel was primarily in charge of the GUI
% Michelle was in charge of statistical analyses
% The primary use of collaboration came from pair programming where we took turns pair programming with each other

% We learned to download and extract the data by completing a course module on accessing csv files
% We each spent 2 hours on preparing the data for our analysis
T = readtable('fatal-police-shootings-data.csv');
date = T(:, 3);
armed = T(:, 5);
age = T(:, 6);
gender = T(:, 7);
race = T(:, 8);
city = T(:, 9);
state = T(:, 10);
mental_illness = T(:, 11);
threat_level = T(:, 12);
flee = T(:, 13);
body_cam = T(:, 14);
longitude = T(:, 15);
latitude = T(:, 16);

% Writing and debugging the code: Laurel, Sarah, Michelle, 1 hour each
% Collaborated with Pair Programming

% Extra code:
% Calculating mean age
% % T1 = T(:, 6);
% % age = rmmissing(T1);%REMOVES NAN
% % age_matrix = table2array(age)
% % mean(age_matrix);
