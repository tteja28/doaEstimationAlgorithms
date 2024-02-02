function P = ucabMUSIC(N, M, D, Ryy, FrH);
  M = 6;
  [RxxEigVec,RxxEigVal] = eig(Ryy);
  [Yo,Index] = sort(diag(RxxEigVal));
  En = RxxEigVec(:,Index(1:(2*M+1)-D));

  for y = 1:360
    clear A;
    py(y) =  y*pi/180;
    for x = 1:90
      th(x) = x*pi/180;
      for m = 1:N
        A(m) = exp(1j*(m-1)*pi*sin(th(x))*cos(py(y)-(2*pi*(m-1)/N)));
      end
      a = transpose(A);
      P(x, y) = 1/abs((FrH*a)'*inv(Ryy)*FrH*a);
    end
  end
  figure;surf(P, 'FaceAlpha', 0.5 );
  xlim([0, 180]);
  ylim([0, 90]);
endfunction
