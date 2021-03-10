% graphs race overall comparison
tbl_race = tabulate(racecell);
x = categorical({'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'});
y2 = [354; 3606; 1110; 804; 48; 78]; % pulling numbers from census data when plotting expected # killed
% calculated multiplying # in csv by percentage of race in US pop
% percentage of race in US pop was found not in github (why calc was by
% hand)
y1 = cell2mat(tbl_race(:,2));
y3 = horzcat(y1,y2);
% expected number killed calculated by hand bc part of data is from census
bar(x,y3)
xlabel('Race')
ylabel('Number of Fatalities')
legend('Actual # Killed', 'Expected # Killed')
title('Fatalities by Race')

