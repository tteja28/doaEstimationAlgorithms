function sA = ulaSteerVec(N, D, sAngsRad, ulaD);

  for n = 1:N
    for d = 1:D
      sA(n,d) = exp(1j*(n-1)*2*pi*ulaD*sin(sAngsRad(d)));
    end
  end
end
