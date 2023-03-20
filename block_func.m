%================================================================
% Divide image into blocks and compute block variances
%================================================================
function [dst_block,r,c]=block_func(img_dst,blkSZ)

[m n z] = size(img_dst);
if z > 1
    img_dst = rgb2gray(img_dst);
end

img_dst=double(img_dst);

rb = blkSZ;
cb = blkSZ;

r = floor(m/rb);
c = floor(n/cb);

dst_block=zeros(rb*cb,r*c);

k=0;
for i=1:r
    for j=1:c
        k=k+1;
        row = (rb*(i-1)+1):rb*i;
        col = (cb*(j-1)+1):cb*j;
        dst_temp = img_dst(row,col);
        dst_block(:,k)=dst_temp(:);
    end
end