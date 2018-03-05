x = linspace(-100,100,100);
y = abs(x);
hold on
subplot(1,3,1);
fill(x,y, 'r');
title('Cone for \{(x, y)| ||x||_2 <= y \}');
xlabel('x');
ylabel('y');
subplot(1,3,2);
fill(x,y, 'g');
title('Dual of Cone for \{(x, y)| ||x||_2 <= y \}');
xlabel('x');
ylabel('y');
subplot(1,3,3);
fill(x,y, 'b');
title('Dual of Dual of Cone for \{(x, y)| ||x||_2 <= y \}');
xlabel('x');
ylabel('y');