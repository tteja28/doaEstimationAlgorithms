function [b, a] = ulaMUSIC(x,D);

  [M,K] = size(x);

  Rxx = corrMat(x); % correlation matrix
  [RxxEigVec,RxxEigVal] = eig(Rxx); % Eigen vectors and Eigen values of correlationmatrix
  [Y,Index] = sort(diag(RxxEigVal)); % Sorting eigen vectors according to eigen values
  En = RxxEigVec(:,Index(1:M-D)); % Constructing noise subspace

  for k = 1:180;
    th(k) = -pi/2+k*pi/180;
    clear a;
    a = [1];
    for jj = 2:M;
      a = [a exp(1j*jj*pi*sin(th(k)))];
    end
    a = a.';
    b = a';
    P(k)=1/abs(a'*En*En'*a);
  end
  angs = rad2deg(th);
  plot(th*180/pi,10*log10(P/max(P)),'k'); figure;
  grid on;
end
