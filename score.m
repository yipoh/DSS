function Score_proposed=score(img)
         
[feat_TM feat_ORI]=extract_feature(img);
feat=[feat_TM feat_ORI];

fid = fopen('test_ind.txt','w');
for jj = 1:size(feat,1)
fprintf(fid,'1 ');
for kk = 1:size(feat,2)
fprintf(fid,'%d:%f ',kk,feat(jj,kk));
end
fprintf(fid,'\n');
end
fclose(fid);

warning off all
delete output test_ind_scaled dump
system('svm-scale  -r range test_ind.txt >> test_ind_scaled');
system('svm-predict  -b 1  test_ind_scaled model output.txt>dump');
load output.txt;
Score_proposed= output;
end
   




