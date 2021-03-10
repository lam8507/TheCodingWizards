states = geoshape(shaperead('usastatehi', 'UseGeoCoords', true));
figure
ax = usamap('conus');
setm(ax, 'FFaceColor', oceanColor)
geoshow(states)
geoshow(lat, long)
