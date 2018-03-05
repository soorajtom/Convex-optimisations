x = linspace(-1000,1000,100);
y1 = x;
y2 = -36*x;

xx = [x, x];
yy = [y2, y1];

hold on
% p1 = subplot(1,3,1);
fill(xx, yy, 'r');
plot(x,y1);
plot(x,y2);
plot(x,0.*x);
plot(0.*x,x);
title('Cone for \{(x, y)| ||x||_2 <= y \}');
xlabel('x');
ylabel('y');
% subplot(1,3,2);
% fill(x,y, 'g');
% title('Dual of Cone for \{(x, y)| ||x||_2 <= y \}');
% xlabel('x');
% ylabel('y');
% subplot(1,3,3);
% fill(x,y, 'b');
% title('Dual of Dual of Cone for \{(x, y)| ||x||_2 <= y \}');
% xlabel('x');
% ylabel('y');