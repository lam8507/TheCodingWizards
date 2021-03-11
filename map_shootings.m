% portion completed by Laurel
latitude = T(:, 16);
longitude = T(:, 15);
lat = table2array(latitude);
long = table2array(longitude);
states = geoshape(shaperead('usastatehi', 'UseGeoCoords', true));
figure
ax = usamap('conus');
oceanColor = [.5 .7 .9];
setm(ax, 'FFaceColor', oceanColor)
geoshow(states)
hold off
geoscatter(lat, long, 'r')
