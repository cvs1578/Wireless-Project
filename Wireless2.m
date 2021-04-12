%Generating node locations to help aid in the routing of a UAV
%Genuine Nodes represent refill stations
%Malicious Nodes represent areas to avoid

no_nodes = input('Enter the number of nodes: ');
no_nodes_m = input('Enter the number of malicious nodes: ');
network_length = input('Enter the length of the network: ');
network_width = input('Enter the width of the network: ');

for i = 1:no_nodes
    x_loc(i) = network_length*rand;
    y_loc(i) = network_width*rand;
    nodes_id(i) = i; 
    plot(x_loc(i),y_loc(i),'b^','linestyle','none')
    hold on
    xlabel('Network Length');
    ylabel('Network Height');
    grid on
    pause(1.0);
end
for j = 1:no_nodes_m
    x_loc_m(j) = network_length*rand;
    y_loc_m(j) = network_width*rand;
    nodes_id_m(j) = j; 
    plot(x_loc_m(j),y_loc_m(j),'ro','linestyle','none')
    hold on;
    xlabel('Network Length');
    ylabel('Network Height');
    grid on
    pause(1.0);
end

%Arbitarilly choosing source and destination randomly.
source = rem(round((no_nodes+no_nodes_m)*rand*3),no_nodes);
if source == 0
    source = 5;
end
destination = rem(round((no_nodes+no_nodes_m)*rand),no_nodes);
if destination == 0
    destination = 6;
end

figure(1)
plot(x_loc(source),y_loc(source),'g^','linestyle','none')
text(x_loc(source),y_loc(source), 'SRC')
hold on
plot(x_loc(destination),y_loc(destination),'g^','linestyle','none')
text(x_loc(destination),y_loc(destination), 'Destination')










