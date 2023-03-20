function [MMT]=TM_function(img,ord)
%% set order
[NX NY]=size(img);
n=ord;   % x-order
m=ord;   % y-order
%% compute kernel
Tx=TM_Kernel_Mukundan(NX,n);  % x- kernel
% Tx = renormalize(Tx);
Ty=TM_Kernel_Mukundan(NY,m); % y- kernel
% Ty = renormalize(Ty);
%% compute moment

%% compute Tchebichef moment
MMT = Ty*double(img)*Tx';

% for s=0:n
%     for t=0:m
%         MMT(s+1,t+1) = Tx(s+1,1:NX) * img * Ty(1:NY,t+1);
%     end
% end

% %% image reconstruction
% F=zeros(NX,NY);  % initialization
% for x = 1:NX
%     for y = 1:NY
%         F(x,y)= (Tx(:,x))' * MMT * (Ty(y,:))';
%     end
% end
% F=mat2gray(F); % convert to gray scale image

% F2=zeros(NX,NY);  % initialization
% MMT(1,1)=0;
% for x = 1:NX
%     for y = 1:NY
%         F2(x,y)= (Tx(:,x))' * MMT * (Ty(y,:))';
%     end
% end
% F2=mat2gray(F2); % convert to gray scale image
