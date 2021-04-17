%This creates random nodes and connects them. 

clc;
clear all;
close all;
%For purposes of experimentation, nodes are random and there are 100 nodes
no_nodes = 100;
network_length = 2556; %Approximate length x width of campus
network_width = 2556;
for i = 1:no_nodes
    x_loc(i) = network_length*rand;
    y_loc(i) = network_width*rand;
end

%Again, for experimental purposes source and destination are also random
source = rem(round((no_nodes)*rand),no_nodes);
if source == 0
    source = 15;
end
destination = rem(round((no_nodes)*rand),no_nodes);
if destination == 0
    destination = 16;
end

%Use distance formula to calculate distance each nodes have with all other
%nodes. Creates a 100x100 matrix
D = distance(x_loc, y_loc,500);

%Using distance, we now make three more matrices indicating which nodes can
%actually reach each other.
[W,s,t] = makeConnections(x_loc,y_loc,D);

%Now we graph and find the path and distance from source to destination.
G=graph(s,t,W);
p=plot(G, 'XData', x_loc, 'YData', y_loc); %, 'EdgeLabel', G.Edges.Weight
[path,dis] = shortestpath(G,source,destination)
highlight(p,path,'EdgeColor','g');