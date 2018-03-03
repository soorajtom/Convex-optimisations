%optimising problem 2 with Newton's method.
tic;
data = load("heightweight.txt");
[n, m] = size(data);
H = data(:,1);
W = data(:,2);
X = [H, ones(n,1)];
t = 1
lim = 1000
w = [rand;rand];
points = [w(1); w(2); norm(W - X*w)];

for i = 1:lim
    d = inv(X' * X) * X' * (X*w - W);
    w = w - t * d;
    
    nobj = W - X*w;
    diff = nobj - obj;
    obj = nobj;
    
    newpoint = [w(1); w(2); norm(obj)];
    points = [points newpoint];
    
    if norm(diff) < 1e-8
        break
    end
end

plot3(points(1,:), points(2,:), points(3,:));
title('Newton''s method')
xlabel('a')
ylabel('b')
zlabel('Cost function')

% scatter(H, W)
% hold on
% plot(H, X*w)
% title('Newton''s Method')
% xlabel('Height')
% ylabel('Weight')
size(points)
toc;
