n = 10;
hold on
for i = 1:5
    s = plot(i, i+5)
end
hold off

function XY = grid(n)
    x = -n:n;
    y = -n:n;
    [X, Y] = meshgrid(x,y);
    X = reshape(X, [(2*n+1)^2, 1]);
    Y = reshape(Y, [(2*n+1)^2, 1]);
    XY = [X Y];
end
