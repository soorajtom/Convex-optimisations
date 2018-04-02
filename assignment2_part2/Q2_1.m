X = importdata('data2.txt');

cvx_begin
    variable r
    variable c(3)
    minimize r
    subject to
        for i=1:size(X,1)
            norm(X(i,:) - c') <= r
        end
cvx_end
r
scatter3(X(:,1),X(:,2),X(:,3));
hold on
[x, y, z] = sphere(30);
x = x.*r;
x = x + c(1);
y = y.*r;
y = y + c(2);
z = z.*r;
z = z + c(3);
sp = surf(x,y,z);
set(sp, 'FaceAlpha', 0.2)
shading interp
title({['Minimum enclosing ball with '],[' radius= ', num2str(r),' centred at  (',num2str(c(1)),', ' ,num2str(c(2)),', ',  num2str(c(3)), ')'],[' along with the points ']})
hold off