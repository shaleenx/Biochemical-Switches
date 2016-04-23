function ans = main()
    figure(1);
    part1(0, 0.25)
    figure(2);
    part1(0.1);
end

function ans = part1(s, r)

    x0 = fzero(@(x) fun(s, r, x), [-2, 0.1])   %Fixed point 1: 0.2679491924311228 %
    x1 = fzero(@(x) fun(s, r, x), [0.1, 1])   %Fixed point 2: 0
    x2 = fzero(@(x) fun(s, r, x), [1, 4])   %Fixed point 3:  3.732050807568877

    y0_1 = [x0; r];
    y0_2 = [x1; r];
    y0_3 = [x2; r];

    t_span = -2:0.01:2;
 
%     [y1, istate, msg] = lsode("f1", t_span, y0_1);
    [t, y1] = ode45(@f1, t_span, y0_1);
    figure(1);
    plot(y1(:, 2), y1(:, 1));
    hold on;
    
    [t, y2] = ode45(@f1, t_span, y0_2);
%     figure(2);
    plot(y2(:, 2), y2(:, 1));
    hold on;
    
    [t, y3] = ode45(@f1, t_span, y0_3);
%    figure(3);
    plot(y3(:, 2), y3(:, 1));
    hold on;

end

function ydot = f1(t, y)
    x = y(1);
    r = y(2);
    xdot = x;
    rdot = -r + ((2*x)/(1+x*x)) - ((2*x*x*x)/((1+x*x)^2));
    ydot = [xdot; rdot];
end
