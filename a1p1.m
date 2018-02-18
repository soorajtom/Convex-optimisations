cvx_begin
    C = zeros(8,8);
    C(1,2) = 6;
    C(1,4) = 7;
    C(2,3) = 5;
    C(2,5) = 4;
    C(3,6) = 7;
    C(4,5) = 1;
    C(4,7) = 5;
    C(5,6) = 3;
    C(5,7) = 3;
    C(6,8) = 9;
    C(7,6) = 2;
    C(7,8) = 4;
    variable f(8,8)
    maximize sum(f(1,:))
    subject to
        for i = 2:7
            sum(f(:,i)) == sum(f(i,:));
        end
        for i = 1:8
            for j = 1:8
                f(i,j) >= 0;
                f(i,j) <= C(i,j);
            end
        end
cvx_end