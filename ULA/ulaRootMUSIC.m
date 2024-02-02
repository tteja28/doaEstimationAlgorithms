function [rts, eangs, eangs2] = ulaRootMUSIC(x,D);

  [M,K] = size(x);

  Rxx = corrMat(x); % correlation matrix
  [RxxEigVec,RxxEigVal] = eig(Rxx);
  [Y,Index] = sort(diag(RxxEigVal));
  En = RxxEigVec(:,Index(1:M-D));

  C = En*En';
  for l = -M+1:M-1;
    c(l+M) = sum(diag(C,l));
  end

  rts = roots(c);
  magrts = abs(rts);

  [sor,idx] = sort(magrts);
  srts = rts(idx);
  q = size(rts);
  rrr = srts(q/2+1:q/2+D);
  eangsrad = -asin(angle(rts)/pi);
  eangs = rad2deg(eangsrad);
  eangsrad2 = -asin(angle(rrr)/pi);
  eangs2 = rad2deg(eangsrad2);
  %figure; zplane(rts);
end
