% code was based off of Laurel and Michelle's coding for chitest
% Sarah made this code from her own Matlab script but when collaborating
% and using this code through github, we sometimes struggled to get the
% visualization to show both Not Flee and Flee, specifically in AppDesigner
% (even after asking for help)
T = readtable('fatal-police-shootings-data.csv');
race = T(:,8);
flee = T(:,13);
% proper conversions
racecell = table2cell(race);
fleecell = table2cell(flee);
race_string = string(racecell);
flee_string = string(fleecell);

for ii = 1:length(race_string)
   if race_string(ii) ~= "B";
      race_string(ii) = "O";
     end
end
black_flee = 0;
other_flee = 0;
black_not_flee = 0;
other_not_flee = 0;
    for k = 1:length(flee_string)
       if flee_string(k) == "fleeing" && race_string(k) == "B"
          black_flee = black_flee + 1;
          elseif flee_string(k) == "fleeing" && race_string(k) == "O"
             other_flee = other_flee + 1;
          elseif flee_string(k) == "Not fleeing" && race_string(k) == "B"
          black_not_flee = black_not_flee + 1;
    elseif flee_string(k) == "Not fleeing" && race_string(k) == "O"
             other_not_flee = other_not_flee + 1;
   end
 end
% bar chart for Black people fleeing vs Other people fleeing
x = categorical({'Black', 'Other'});
yes_flee = vertcat(black_flee, other_flee);
not_flee = vertcat(black_not_flee, other_not_flee);
y = horzcat(yes_flee, not_flee);
bar(x,y)
legend('Flee', 'Not Flee')
title('Flee vs Not Fleeing Comparison')
% this shows a lower gap btwn flee and not flee