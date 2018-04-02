X = importdata('data2.txt');

cvx_begin
    variable A(3,3) symmetric
    variable c(3)
    maximize log_det(A)
    subject to
        for i=1:1:size(X,1)
            norm(X(i,:)*A + c') <= 1
        end
cvx_end

[x, y, z] = sphere(30);
k = 1;

p = ones(size(x,1), 3);
invA = inv(A);

for i=1:size(x,1)
    for j=1:size(x,2)
        p(k,:) = [x(i,j) - c(1), y(i,j) - c(2), z(i,j) - c(3)];
        p(k,:) = (p(k,:)) * invA;
        x(i,j) = p(k,1);
        y(i,j) = p(k,2);
        z(i,j) = p(k,3);
        
        k = k + 1;
%         [x(i,j), y(i,j), z(i,j)] = (1 - [x(i,j), y(i,j), z(i,j)]) * invA
    end
end

scatter3(X(:,1),X(:,2),X(:,3));
hold on
sp = surf(x,y,z);
set(sp, 'FaceAlpha', 0.2)
shading interp
title({['Minimum enclosing ellipsoid '],['centred at  (',num2str(c(1)),', ' ,num2str(c(2)),', ',  num2str(c(3)), ')'],[' along with the points ']})
hold off