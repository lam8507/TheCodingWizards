% Creating a geo scatter plot visualization

% Extracting needed variables for analysis
latitude = T(:, 16);
longitude = T(:, 15);

% Converting to array format
lat = table2array(latitude);
long = table2array(longitude);

% Creating map of United States
states = geoshape(shaperead('usastatehi', 'UseGeoCoords', true));
figure
ax = usamap('conus');
oceanColor = [.5 .7 .9]; % Setting ocean color to gray
setm(ax, 'FFaceColor', oceanColor)
geoshow(states)
hold off % Keeping original map of United States and allow for overlay of geoscatter
geoscatter(lat, long, 'r') % Setting shooting data color to red (to represent deaths) and plotting the visualization

% Writing and debugging by Laurel, 3 hours
