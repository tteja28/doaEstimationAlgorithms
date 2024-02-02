function Rxx = corrMat(x);
  K = size(x,2);
  Rxx = x*x'/K;
end
