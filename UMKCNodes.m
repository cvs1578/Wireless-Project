%This creates random nodes and connects them. 

clc;
clear all;
close all;
%Node locations marked on png.
%Location discovered using location of the png 
network_length = 728; %Size of UMKC map in pixels
network_width = 803;
x_loc = [103 119 89 111 107 107 175 233 171 202 172 202 244 233 175 175 ...
    224 225 245 209 238 178 200 215 197 311 297 305 354 349 376 408 423 ... 
    431 460 484 466 478 486 460 424 486 488 454 425 408 481 481 433 433 ...
    371 346 619 610 613 545 567 603 576 577 552 618];
y_loc = [263 263 276 276 452 519 328 356 388 391 419 417 398 418 458 500 ...
    455 461 510 537 554 565 595 615 702 274 336 413 365 415 328 328 359 ...
    397 383 387 414 447 471 485 488 503 538 539 535 511 575 631 604 634 ...
    623 624 665 629 536 535 449 455 400 361 345 332];
no_nodes = length(x_loc);
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
%nodes. Creates a no_nodes x no_nodes matrix
D = distance(x_loc, y_loc,100); %100 = maximum distance UAV travel before reaching node

%Using distance, we now make three more matrices indicating which nodes can
%actually reach each other.
[W,s,t] = makeConnections(x_loc,y_loc,D);

%Now we graph and find the path and distance from source to destination.
G=graph(s,t,W);
p=plot(G, 'XData', x_loc, 'YData', y_loc, 'EdgeColor', 'k', 'NodeColor', 'k');
set(gca, 'YDir','reverse')
[path,dis] = shortestpath(G,source,destination)
highlight(p,path,'EdgeColor','b','NodeColor', 'b', 'LineWidth', 3);