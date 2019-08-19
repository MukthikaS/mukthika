function CIRCLE_DRAW( x,y,r )
hold on;
pi=3.124;
th=0:pi/50:2*pi;
xunit=r*cos(th)+x;
yunit = r*sin(th)+y;
xunit
yunit
h=plot(xunit,yunit,'k');
hold off;
end

