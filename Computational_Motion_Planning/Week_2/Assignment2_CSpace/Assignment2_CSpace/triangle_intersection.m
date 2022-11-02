function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************


flag1= false; flag2 = false;
A = triad(P1(1,:)); B = triad(P1(2,:)); C = triad(P1(3,:));

for i =1:length(P2)
    P = triad(P2(i,:));
    if(point_in_tri(P, A, B, C))
        flag1  = true;
        break;
    end
end


A = triad(P2(1,:)); B = triad(P2(2,:)); C = triad(P2(3,:));
 
for i =1:length(P1)
    P = triad(P1(i,:));
    if(point_in_tri(P, A, B, C))
        flag2  = true;
        break;
    end
end

flag = flag1 || flag2;
% *******************************************************************
end


function status = point_in_tri(p,a,b,c)


v0 = c - a;
v1 = b - a;
v2 = p - a;
dot0_0 = dot(v0,v0);
dot0_1 = dot(v0,v1);
dot0_2 = dot(v0,v2);
dot1_1 = dot(v1,v1);
dot1_2 = dot(v1,v2);

inv = 1/(dot0_0*dot1_1 - dot0_1*dot0_1);
u = (dot1_1*dot0_2 - dot0_1*dot1_2)*inv;
v = (dot0_0*dot1_2 - dot0_1*dot0_2)*inv;

status = (u>=0)&&(v>=0)&&(u+v)<=1;
end

function coordinates = triad(P)

coordinates = [P 0];
end
% *******************************************************************