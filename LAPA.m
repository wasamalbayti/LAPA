Left = 1;
Right = 1; 
Top = 0;
Bottom = 0;
nx = 12; 
ny = 12; 

V = zeros(nx,ny);
maxIter = 1000;


for k = 0 : maxIter 

    for i = 1 : (nx)
         for j = 1 : (ny)
            if i == 1
               V(i,j) = Left;
            elseif i == nx
               V(i,j) = Right;        
            elseif j == 1
               V(i,j) = Bottom;
            elseif j == ny
               V(i,j) = Top;
            else  
               V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1))+V(i,(j-1)))/4;
             end
         end
    end
    
    % electric field 
    
    [x,y] = gradient(V);
    
    % Plots
    
    subplot(4,1,1)
    surf(V);
    pause(0.01)
    
    subplot(4,1,2)
    surf(-x,-y)
    
    subplot(4,1,3)
    quiver(-x,-y)
    pause(0.01)
    
    subplot(4,1,4)
    imshowpair(V,imboxfilt(V,3))
    pause(0.01)
    
end
    

