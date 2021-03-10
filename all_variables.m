% mental_illness_threat = T(:, 11:12);
% 
% % T1 = T(:, 6);
% % age = rmmissing(T1);%REMOVES NAN
% % age_matrix = table2array(age)
% % mean(age_matrix);
% 
% % mental_illness_threat_m = table2array(mental_illness_threat);
% % mental_ill_string = cell2mat(mental_illness_threat);
% 
% col = [8 13];
% race_flee = T(:, col);
% 

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

body_cam == 'False'

table2cell
locate cell containiing what u want
extract cell, then from there array name == ''

removal from array:

arrayname(=='undetermined') = []

find function for indexing OR for loop
result = []

for i = 1:
        if arrayname(i) == str('something') (look up)
        
        result = [result, i];
        end

