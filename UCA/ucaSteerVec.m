function sA = ucaSteerVec(N, D, sAngsRad);

  for n = 1:N
    for d = 1:D
      sA(n,d) = exp(1j*(n-1)*2*pi*sin(sAngsRad(1,d))*cos(sAngsRad(2,d)-(2*pi*(n-1)/N)));
    end
  end
end
