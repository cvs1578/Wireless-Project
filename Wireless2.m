%Generating node locations to help aid in the routing of a UAV
%Genuine Nodes represent refill stations
%Malicious Nodes represent areas to avoid
clc;
clear all;
close all;
no_nodes = input('Enter the number of nodes: ');
no_nodes_m = input('Enter the number of malicious nodes: ');
network_length = input('Enter the length of the network: ');
network_width = input('Enter the width of the network: ');

for i = 1:no_nodes
    x_loc(i) = network_length*rand;
    y_loc(i) = network_width*rand;
    %nodes_id(i) = i; 
    plot(x_loc(i),y_loc(i),'b^','linestyle','none')
    hold on
    xlabel('Network Length');
    ylabel('Network Height');
    grid on
    pause(.1);
end
for j = 1:no_nodes_m
    x_loc_m(j) = network_length*rand;
    y_loc_m(j) = network_width*rand;
    %nodes_id_m(j) = j; 
    plot(x_loc_m(j),y_loc_m(j),'ro','linestyle','none')
    hold on;
    xlabel('Network Length');
    ylabel('Network Height');
    grid on
    pause(.1);
end

source = rem(round((no_nodes+no_nodes_m)*rand),no_nodes);
if source == 0
    source = 15;
end
destination = rem(round((no_nodes+no_nodes_m)*rand),no_nodes);
if destination == 0
    destination = 16;
end
figure(1)
plot(x_loc(source),y_loc(source),'b^','linewidth',2);
text(x_loc(source),y_loc(source), 'SRC')

hold on
plot(x_loc(destination),y_loc(destination),'g^','linewidth',2);
text(x_loc(destination),y_loc(destination), 'Destination')

% Location of nodes
% Genuine
genuine = [x_loc; y_loc];
% Malicious
malicious = [x_loc_m; y_loc_m];

% Connecting source and destination
source_loc = [x_loc(source), y_loc(source)];
destination_loc = [x_loc(destination), y_loc(destination)];
p1 = [source_loc(1) destination_loc(1)];
p2 = [source_loc(2) destination_loc(2)];
x = [p1(1) p2(1)];
y = [p1(2) p2(2)];
plot([x(1) y(1)],[x(2) y(2)])

idx = [genuine(1,:); genuine(2,:)];
idx1 = [malicious(1,:); malicious(2,:)];

% distance from origin to destination

d_location = sqrt((destination_loc(1)-0)^2+(destination_loc(2)-0)^2);
d_source = sqrt((source_loc(1)-destination_loc(1))^2+(source_loc(2)-destination_loc(2))^2);
%distances = dijkstra(idx(1,:),[floor(d_source),floor(d_location)]);

