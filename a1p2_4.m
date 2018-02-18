data = load("heightweight.txt");
H = data(:,1);
W = data(:,2);
[n, m] = size(data);
w = [rand;rand];
t = 5e-5;
ct = norm(W - [h, ones(n,1)]*w);

while 1
    for i = 1:n
        w = w - t * [H(i), 1]'*(w' * [H(i),1]' - W(i))
    end
    
    if (c < 1e-10)
        break;
    end
end






% lim = 1e+10;
lim = 1000000
% x = [0.6;-34];

xt = [rand;rand];
% t = 1.9364e-8;
hold on
c = w - [h, ones(n,1)]*xt;
dt = [2.* c' * (-h);
     2.* c' * -ones(n,1)];
for i = 1:lim
    c = w - [h, ones(n,1)]*x;
    d = [2.* c' * (-h);
         2.* c' * -ones(n,1)];    
    t = ( (x - xt)' * (d - dt) )/(norm(d - dt)^2)
    x = x - t .* d;
    
    scatter3(x(1),x(2),norm(data(:,2) - [data(:,1), ones(n,1)]*x))
%     if norm(xt - x) < 1e-150
%         break
%     end
    xt = x
    dt = d
end
%     norm(data(:,2) - [data(:,1), ones(n,1)]*x)