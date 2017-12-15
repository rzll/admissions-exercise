distance = 10;
steps = 7;
maxDistance = distance + 2 * steps;

f = zeros(steps + 1, maxDistance);
f(1, distance) = 1;
p = 0;

for s = 2:steps + 1
    p = f(s - 1, 2) * 0.25 + p;
    for d = 1:maxDistance
       f(s, d) = f(s - 1, d) * 0.5;
       if d - 2 >= 1
           f(s, d) = f(s, d) + f(s - 1, d - 2) * 0.25;
       end
       if d + 2 <= maxDistance
           f(s, d) = f(s, d) + f(s - 1, d + 2) * 0.25;
       end
    end
end 

p

    
    
    
    
