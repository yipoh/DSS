function feat_E = TM_En_Func(img_gradient,order,blkSZ)


ord1=[1,8];
ord2=[2,9,16];
ord3=[3,10,17,24];
ord4=[4,11,18,25,32];
ord5=[5,12,19,26,33,40];
ord6=[6,13,20,27,34,41,48];
ord7=[7,14,21,28,35,42,49,56];
ord8=[15,22,29,36,43,50,57];
ord9=[23,30,37,44,51,58];
ord10=[31,38,45,52,59];
ord11=[39,46,53,60];
ord12=[47,54,61];
ord13=[55,62];
ord14=[63];

if (~exist('order'))
   order = blkSZ-1;
end

if (~exist('blkSZ'))
   blkSZ = 8;
end

[img_block,Rnum,Cnum]=block_func(img_gradient,blkSZ);
  E0=0;
  E1=0;
  E2=0; 
  E3=0;
  E4=0;
  E5=0;
  E6=0;
  E7=0;
  E8=0;
  E9=0;
  E10=0;
  E11=0;
  E12=0;
  E13=0;
  E14=0;

for k=1:size(img_block,2)
    
   block = reshape(img_block(:,k),blkSZ,blkSZ);
   mmt = TM_function(block,order);       % Tchebichef moment
   en0=(mmt(1,1).^2);
   mmt(1,1)=6658566.66554; % remove DC component
   mmt(mmt==6658566.66554)=[];
  
   en1=sum(([mmt(ord1(1)) mmt(ord1(2))].^2));
   en2=sum(([mmt(ord2(1)) mmt(ord2(2)) mmt(ord2(3))].^2));
   en3=sum(([mmt(ord3(1)) mmt(ord3(2)) mmt(ord3(3)) mmt(ord3(4))].^2));
   en4=sum(([mmt(ord4(1)) mmt(ord4(2)) mmt(ord4(3)) mmt(ord4(4)) mmt(ord4(5))].^2));
   en5=sum(([mmt(ord5(1)) mmt(ord5(2)) mmt(ord5(3)) mmt(ord5(4)) mmt(ord5(5)) mmt(ord5(6))].^2));
   en6=sum(([mmt(ord6(1)) mmt(ord6(2)) mmt(ord6(3)) mmt(ord6(4)) mmt(ord6(5)) mmt(ord6(6)) mmt(ord6(7))].^2));
   en7=sum(([mmt(ord7(1)) mmt(ord7(2)) mmt(ord7(3)) mmt(ord7(4)) mmt(ord7(5)) mmt(ord7(6)) mmt(ord7(7)) mmt(ord7(8))].^2));
   en8=sum(([mmt(ord8(1)) mmt(ord8(2)) mmt(ord8(3)) mmt(ord8(4)) mmt(ord8(5)) mmt(ord8(6)) mmt(ord8(7)) ].^2));
   en9=sum(([mmt(ord9(1)) mmt(ord9(2)) mmt(ord9(3)) mmt(ord9(4)) mmt(ord9(5)) mmt(ord9(6)) ].^2));
   en10=sum(([mmt(ord10(1)) mmt(ord10(2)) mmt(ord10(3)) mmt(ord10(4)) mmt(ord10(5)) ].^2));
   en11=sum(([mmt(ord11(1)) mmt(ord11(2)) mmt(ord11(3)) mmt(ord11(4)) ].^2));
   en12=sum(([mmt(ord12(1)) mmt(ord12(2)) mmt(ord12(3))  ].^2));
   en13=sum(([mmt(ord13(1)) mmt(ord13(2))  ].^2));
   en14=sum(([mmt(ord14(1)) ].^2));
     
   E0=E0+en0 ;  % DC 0½×ÄÜÁ¿
   E1=E1+en1;
   E2=E2+en2;
   E3=E3+en3;
   E4=E4+en4;
   E5=E5+en5;
   E6=E6+en6;
   E7=E7+en7;
   E8=E8+en8;
   E9=E9+en9;
   E10=E10+en10;
   E11=E11+en11;
   E12=E12+en12;
   E13=E13+en13; 
   E14=E14+en14;

        
end

feat_E=[E1+E2+E3+E4 E5+E6+E7+E8+E9 E10+E11+E12+E13+E14];

end

