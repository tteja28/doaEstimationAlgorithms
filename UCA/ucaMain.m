clc; clear all; close all;

N = 13;
sAngsDeg = [20,60 ; 40,100 ; 60, 150];
sAngsDeg = transpose(sAngsDeg);
D = size(sAngsDeg,2);
K = 60;
T = 1;
sig = 1;
noi = 1;

sAngsRad = deg2rad(sAngsDeg);

ucaSA = ucaSteerVec(N, D, sAngsRad);

s = sqrt(sig)*sign(randn(D,K));
no = sqrt(noi)*randn(N,K);
x = ucaSA*s + no;

P1 = ucaMVDR(x,D);
P = ucaMUSIC(x, D);

