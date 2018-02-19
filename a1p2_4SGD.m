%optimising problem 2 with stochastic gradient descent.
tic;
data = load("heightweight.txt");
[n, m] = size(data);
H = data(:,1);
W = data(:,2);
X = [H, ones(n,1)];
w = [rand;rand];
t = 1e-8;
obj = (W - X*w);
points = [w(1); w(2); norm(obj)];
while 1
    for j = 1:n
        i = 1 + floor(rand * (n - 1));
        w = w - t * ([H(i), 1]'*(w' * [H(i),1]' - W(i)));
    end
    nobj = (W - X*w);
    point = [w(1); w(2); norm(obj)];
%     points = [points point];
    if (norm(obj - nobj)) < 1
        break;
    end
    obj = nobj;
end
% plot3(points(1,:), points(2,:), points(3,:));
% title(['Stochastic Gradient Descent with alpha=',num2str(t)])
% xlabel('a')
% ylabel('b')
% zlabel('Cost function')

scatter(H, W)
hold on
plot(H, X*w)
title(['Stochastic Gradient Descent with alpha=',num2str(t)])
xlabel('Height')
ylabel('Weight')
toc;