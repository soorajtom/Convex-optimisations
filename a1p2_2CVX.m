%Problem 2 optimization with cvx
data = load("heightweight.txt");
[n, m] = size(data)

cvx_begin
    variable x(2,1)
    minimize(norm(data(:,2) - [data(:,1), ones(n,1)]*x ))
cvx_end

scatter(data(:,1),data(:,2))
hold on
plot(data(:,1), [data(:,1), ones(n,1)]*x)
title('CVX')
xlabel('Height')
ylabel('Weight')