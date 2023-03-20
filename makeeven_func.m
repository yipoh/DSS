%% make the image matrix to be even by even, so the moment can be correctly computed
function A2 = makeeven_func(A)

[H,W]=size(A);

if mod(H,2)==1 && mod(W,2)==1
    A2=A( 1:(H-1), 1:(W-1) );
elseif mod(H,2)==1 && mod(W,2)==0
    A2=A( 1:(H-1), : );
elseif mod(H,2)==0 && mod(W,2)==1
    A2=A( :, 1:(W-1));
else A2=A;
end