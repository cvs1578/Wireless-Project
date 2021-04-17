%Make Connected Tree
%Inputs: X axis, y-axis, Distance between nodes
%outputs: W=weights, s = Source node, Y = Target node
function [W,s,t] = makeConnections(x,y,D)
%First, declare all matrices
    s = []; 
    t = [];
    W = [];
    OK = true; %This bool tells us if s and t have already met
    
    %Next, we'll go through each of the Distances to determine if the nodes
    %are able to be connected
    for i = 1:length(x)
        for j = 1:length(y)
            %They are not connected if D = 0 or inf
            if (D(i,j)~=inf) && (D(i,j)~=0) 
                
                %Next We determine if the nodes i and j have already been
                %connected
                for k = 1:length(s)
                    if (s(k)== j) && (t(k)== i) 
                        OK = false;
                    end
                end
                
                %We add i node to end of s, j node to end of t to signify
                %those nodes are connected. We also add the weight to
                %signify the distance between the nodes.
                if(OK == true)
                    s(end+1)=i;
                    t(end+1)=j;
                    W(end+1)=D(i,j);
                else
                    OK = true;
                end
            end
        end
    end
end