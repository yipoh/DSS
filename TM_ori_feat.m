function [TM_feat ori_feat]=TM_ori_feat(img)

blkSZ = 8;       % Block size
order = blkSZ-1; 
if size(img,3) == 3
    img = rgb2gray(img); 
end

img_dst = makeeven_func(img);  % Eeven size for computing moments
img_dst = double(img_dst);  

%% compute gradient
[grad1x,grad1y]=gradient(img_dst);
img_gradient11=((grad1x).^2+(grad1y).^2).^0.5;
%% Tchebichef moment
TM_feat = TM_En_Func(img_gradient11,order,blkSZ);

%% orientation-histogram
[grad1x,grad1y]=gradient(double(img));
grad=((grad1x).^2+(grad1y).^2).^0.5;
weightmap = grad;
oriHist = [];
theta=atan2(grad1y,grad1x)*180/pi;  
TH=[-150:30:180;...
    -180:30:150];
 for k=1:12
     idx = find(theta<TH(1,k) & theta>=TH(2,k));
     kval = sum(weightmap(idx));
     oriHist = [oriHist kval];
 end
ori_feat(1,1:12)=oriHist;
end
