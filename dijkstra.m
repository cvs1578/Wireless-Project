function distances = dijkstra(map, startingpoint)

N = length(map);
distances(1:N) = Inf;

visited(1:N) = 0;

distances(startingpoint) = 0;

while sum(visited) < N
    candidates(1:N) = Inf;
    for index = 1:N
        if visited(index) == 0
            candidates(index) = distances(index);
        end
    end
[currentDistance, currentPoint] = min(candidates);

for index = 1:N
    newDistance = currentDistance + map(currentPoint,index);
    if newDistance < distances(index)
        distances(index) = newDistance;
    end
   visited(currentPoint) = 1;     
end
end

