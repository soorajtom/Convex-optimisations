A = importdata('data1.txt');
Y = A(:,1);
X = A(:,2:end);
cvx_begin
    variable w(10,1)
    minimize sum(X*w - Y)
    subject to
        norm(w) ~= 0
cvx_end
w