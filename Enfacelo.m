%electrofacelograma, es un ensayo, de 1000 columnos, se promedian 1000
%flashes, que indican que capte luz, etc.., 
%enfacelograma recibe un tomo a, enfacelograma toma un tomo b
ntrials=size(EEGa,1);
plot(EEGa(1,:));
%puedo calcular el intervalo de tiempo entre 
dt=t(2)-t(1);
plot(t,EEGa(1,:))
xlabel('Tiempo[s]');
ylabel('Voltaje[\mu V]');
title('EEG de la condicion A y B, ensayo 1');
hold on;
plot(t,EEGb(1,:));
plot([0.25,0.25],[-6,6],'k','linewidth',2);
hold off;
%similar a lo de veck!
%necesitamos hacer un analisis
imagesc(t,(1:ntrials),EEGa);
xlabel('Tiempo[s]');
ylabel('#ensayo');
hold on;
plot([0.25,0.25],[0,1000],'k','linewidth',2);
hold off;

figure;
plot(t,mean(EEGa,1));
xlabel('Tiempo [s]');
ylabel('Voltaje[\muV]');
title('Potencial evocado condicion A');

figure;
plot(t,mean(EEGb,1));
xlabel('Tiempo [s]');
ylabel('Voltaje[\muV]');
title('Potencial evocado condicion B');

%EEGa
%media de los ensayos, desviacion estandar, error estandar de la media

%std(EEGa);
mn_a=mean(EEGa,1);%1 u 2 ,jamas 3
sd_a=std(EEGa,1);
sdmn_a=sd/sqrt(ntrials);
%vamos a poner la señal de la media en los inervalos de confianza,
%utilizaremos el teorema del valor medio

%dos desviaciones estandar arriba y dos desviaciones estandar abajo

figure;
plot(t,mn,'linewidth',2,'color','blue');
hold on;
plot(t,mn_a+2*sdmn_a,'color','blue');
plot(t,mn_a-2*sdmn_a,'color','blue');
xlabel('Tiempo[s]');
ylabel('Voltaje[\muV]');
title('Potencial evocado condicion A');

mn_b=mean(EEGa,1);%1 u 2 ,jamas 3
sd_b=std(EEGa,1);
sdmn_b=sd/sqrt(ntrials);
%vamos a poner la señal de la media en los inervalos de confianza,
%utilizaremos el teorema del valor medio

%dos desviaciones estandar arriba y dos desviaciones estandar abajo

figure;
plot(t,mn,'linewidth',2,'color','red');
hold on;
plot(t,mn_b+2*sdmn_b,'color','red');
plot(t,mn_b-2*sdmn_b,'color','red');
xlabel('Tiempo[s]');
ylabel('Voltaje[\muV]');
title('Potencial evocado condicion A');

mn_a;
sdmn_a;
mn_b;
sdmn_b;
mn_diff=mn_a-mn_b;
st_d=sqrt((sd_a.^2/ntrials)+((sd_b.^2)/ntrials))/sqrt(ntrials);
sdmn_diff=sqrt(sdmn_a.^2+sdmn_b.^2);

figure;
plot(t,mn_diff,'linewidth',2,'color','blue');
hold on;
plot(t,mn_diff+2*sdmn_d,'color','red');
plot(t,mn_diff-2*sdmn_d,'color','red');



