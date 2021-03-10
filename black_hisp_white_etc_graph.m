% graphs race overall comparison
% this part was done by Sarah
% pair programmed by Michelle
tbl_race = tabulate(racecell); % extracts specific number in each race in dataset
x = categorical({'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'});
y2 = [354; 3606; 1110; 804; 48; 78]; % pulling numbers from census data when plotting expected # killed with discussion with prof Serre
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

