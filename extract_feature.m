function [feat feat2]=extract_feature(img)
feat=[];
feat2=[];
img1=img;
[m,n]=size(img1);

w=fspecial('gaussian',[3 3]);
[TM_feat ori_feat]=TM_ori_feat(img1);
feat=[feat TM_feat];
feat2=[feat2 ori_feat];

%% һ��
img2=imresize(imfilter(img1,w),[m/2 n/2]);
[TM_feat ori_feat]=TM_ori_feat(img2);
feat=[feat TM_feat];
feat2=[feat2 ori_feat];

%% ����
img3=imresize(imfilter(img2,w),[m/4 n/4]);
[TM_feat ori_feat]=TM_ori_feat(img3);
feat=[feat TM_feat];
feat2=[feat2 ori_feat];

%% ����
img4=imresize(imfilter(img3,w),[m/8 n/8]);
[TM_feat ori_feat]=TM_ori_feat(img4);
feat=[feat TM_feat];
feat2=[feat2 ori_feat];

%% �Ĵ�
img5=imresize(imfilter(img4,w),[m/16 n/16]);
[TM_feat ori_feat]=TM_ori_feat(img5);
feat=[feat TM_feat];
feat2=[feat2 ori_feat];
end

