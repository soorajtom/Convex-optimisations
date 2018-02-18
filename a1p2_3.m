data = load("heightweight.txt");
H = data(:,1);
W = data(:,2);
X = [h, ones(n,1)];
[n, m] = size(data);
lim = 1000
wo = [0; 0];
w = [rand;rand];

d = -(X' * W);
obj = W - X*wo;
points = [wo(1); wo(2); norm(obj)];

for i = 1:lim
    dold = d;
    d = X' * (X*w - W);
    t = ((w - wo)' * (d - dold)) / ((norm(d - dold))^2);
    wo = w;
    w = w - t * d;
    
    nobj = W - X*w;
    diff = nobj - obj;
    obj = nobj;
    
    newpoint = [wo(1); wo(2); norm(obj)];
    points = [points newpoint];
    
    if norm(diff) < 1e-20
        break
    end
end

plot3(points(1,:), points(2,:), points(3,:));


