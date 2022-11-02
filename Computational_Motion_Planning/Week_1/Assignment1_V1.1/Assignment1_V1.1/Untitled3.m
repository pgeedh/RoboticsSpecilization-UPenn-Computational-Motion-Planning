h = animatedline;
x = 1:1000;
y = sin(x);

for k = 1:length(x)
    addpoints(h,x(k),y(k));
    drawnow
end