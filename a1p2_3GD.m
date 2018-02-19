%optimising problem 2 with gradient descent.
tic;
data = load("heightweight.txt");
[n, m] = size(data);
H = data(:,1);
W = data(:,2);
X = [H, ones(n,1)];
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
    
    if norm(diff) < 1e-8
        break
    end
end

% plot3(points(1,:), points(2,:), points(3,:));
% title('Gradient Descent')
% xlabel('a')
% ylabel('b')
% zlabel('Cost function')
scatter(H, W)
hold on
plot(H, X*w)
title('Gradient Descent')
xlabel('Height')
ylabel('Weight')
toc;
