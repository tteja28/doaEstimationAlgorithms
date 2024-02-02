function [eangs] = ulaESPIRT(x,D);

  [M,K] = size(x);

  Rxx = corrMat(x);
  [V,Dia] = eig(Rxx);
  [Y,Index] = sort(diag(Dia));
  En = V(:,Index(1:M-D));
  Es = V(:,Index(M-D+1:M));

  Es1 = Es(1:M-1,:);
  Es2 = Es(2:M,:);

  psi = inv(Es1'*Es1)*Es1'*Es2;
  [Vec,Val] = eig(psi);

  eangs = -asin(angle(diag(Val))/-pi)*180/pi;
end
