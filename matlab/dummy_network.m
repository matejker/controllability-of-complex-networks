pkg load control

A = [0,0,0;1,0,0;0,1,0];
B = [1,0,0]';
K = place(A, B, [-1.,-1.2,-1.3])

function dy = dummy_network(y,u)
A = [0,0,0;1,0,0;0,1,0];
B = [1,0,0]';
dy = A*y + B*u;
end

tspan = 0:.001:10;
y0 = [1,2,3];
[t,y] = ode45(@(t,y)dummy_network(y,-K*(y-[3,2,1]'')),tspan,y0);
plot(y)
