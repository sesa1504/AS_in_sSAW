function [X_fine,Z_fine,UW_mess] = finergrid(X,Z,UW,num_elemX,num_elemZ)

x_fine = linspace(min(X(:,1)),max(X(:,1)),num_elemX);
z_fine = linspace(min(Z(1,:)),max(Z(1,:)),num_elemZ);
[X_fine, Z_fine] = meshgrid(x_fine,z_fine);

UW_mess = interp2(Z,X,UW,Z_fine,X_fine);

X_fine = permute(X_fine,[2 1]);
Z_fine = permute(Z_fine,[2 1]);
UW_mess = permute(UW_mess,[2 1]);
end
