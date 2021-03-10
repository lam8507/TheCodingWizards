figure(1); 
f=worldmap([33 68],[-15 37]); 
geoshow('landareas.shp', 'FaceColor', [1 1 1],'DefaultEdgeColor', 'b') 
PointLatLon = [51 -2.3;54 -3.2;50 3.9;51 5.5;48 1.1];
mValue = [1 4 2 7 3]; 
plotm(PointLatLon(:,1),PointLatLon(:,2),'r.');

long = T(:, 15);
lat = T(:, 16);

[lat, long] = meshgrid(-14:0.5:14);
ltln = [lat(:) lon(:)]