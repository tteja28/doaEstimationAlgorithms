function [f,P] = ulaBartlett(Rxx);
  M = size(Rxx,1);
  for k=1:180;
    th(k)=-pi/2+k*pi/180;
    clear a
    a=[1];
    for jj=2:M
      a = [a exp(1j*jj*pi*sin(th(k)))];
    end
    P(k)=real(a*Rxx*a');
  end
  figure;
  plot(th*180/pi,10*log10(P/max(P)),'k');
  xticks([-20 -10 -8 -6 -4 -2 0 2 4 6 8 10 20 90]);
  grid on
  xlabel('Angle')
  ylabel('|P(\theta)| (dB)')
  axis([-90 90 -30 2]);
end
