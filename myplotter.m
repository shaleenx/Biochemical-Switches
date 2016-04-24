function myplotter
    x = -10:0.1:10;
    plot(x, (x.*x)/(1+(x.*x)));
%     hold on;
%     plot(x, 0.1*x, 'r');
%     hold on;
%     plot(x, 0.5*x, 'b');
%     hold on;
%     plot(x, 1.5*x, 'g');
end