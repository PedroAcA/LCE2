%Simulacao de sinal PPG via capacitor carregando e descarrgenado
clear
tau1 = 0.05;
tau2 = 0.1;
k1 = 12;
i = 1;
t_desc= 0.2;

for t1=0:1/100:t_desc
  v(i) = k1*(1-(e^(-t1/tau1)));
  i = i+1;
endfor
i=i-1;
for t2 = t_desc:1/100:1  
  v(i) = k1*(e^(-(t2-t_desc)/tau2));
  i = i+1;
endfor
t = 0:1/100:1;
length(v)
length(t)
plot(t,v);
print("PPG_modelo.png");