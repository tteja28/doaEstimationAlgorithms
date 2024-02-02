clc; clear all; close all;

pkg load signal;

M = 20 ; % no of sensor elements
D = 3; % no of signals
K = 65; % no of snapshots
Mc = 1; % no of monte carlo simulations
sig = 1; % signal strength
noi = 1; % noise strength
sAngsDeg = [10, 20, 30]; % source angles in degrees

sAngsRad = deg2rad(sAngsDeg); % source angles in radians

% source array steering vector
for m = 1:M
  for d = 1:D
    sA(m,d) = exp(1j*(m-1)*pi*sin(sAngsRad(d)));
  end
end
% source array steering vector


for iNoi = 1:1
  for mc = 1:Mc
    s = sqrt(sig)*sign(randn(D,K)); % signal generation
    n = sqrt(noi)*randn(M,K);
    x = sA*s + n; % sensor inputs generation
    [P, a] = ulaMUSIC(x, D);
  end
end
