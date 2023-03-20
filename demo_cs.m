%% Matlab code, DSS

clear;
clc;
close all

dis_img=imread('img1.bmp');
dis_img=rgb2gray(dis_img);
Score_proposed=score(dis_img)