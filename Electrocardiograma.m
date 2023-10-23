%electrocordiograma
clc;
plot(t,ECoG);
xlabel('Tiempo[s]');
ylabel('Voltaje[mV]');
%primero calcularemos el espectro de esta señal
x=ECoG;
dt=t(2)-t(1);
T=t(end);
xf=fft(x-mean(x));%transformada de fourier
Sxx=(2*dt^2/T)*(xf.*conj(xf));
Sxx=Sxx(1:length(x)/2+1);%pertence a este vector (length)
df=1/T;
fNQ=1/dt/2;%frecuencia de Nquist
faxis=(0:df:fNQ);

figure;plot(faxis,Sxx);
xlim([0,100]);
xlabel('Frecuencia [Hz]');
ylabel('Potencia [mV^2/Hz]');

%pasar a decibeles dB

figure;
semilogx(faxis,10*log10(Sxx));
xlim([0,100]);
xlabel('Frecuencia [Hz]');
ylabel('Potencia [dB]');

%convolucion, multiplicar la señal en a, 
%Zero pading: sig que puedo agregar 1 seg de ceros, 1seg de unos, s tomo mi
%señal y los multiplico por estos, como resultados aumento la señal de la
%fecuencia, como resultado final mejoro la señal del espectro.

Fs=500; %frecuencia de muestreo
dt=1/Fs;
t=(dt:dt:1);
T=t(end);
d=sin(2*pi*t*10);
%d=[d,zeros(1,10*Fs)];%le agego zeros "concatenar"agrego zeros a mi derecha de la señal
%d=[d];
df=1/(length(d)*dt);
fNQ=Fs/2;
faxis=(0:df:fNQ);%va desde cero hasta le frecuencia de fNQ
pow=(2*dt^2/T)*(fft(d).*conj(fft(d)));%multiplicado por la tanformada de fourier
pow=pow(1:length(d)/2+1);
figure;plot(faxis,10*log10(pow));
xlim([0,20]);
ylim([-60,10]);

x=ECoG;
N=length(x);
x=hann(N).*x;
%figure;plot(hann(N))
pow=(2*dt^2/T)*(fft(x).*conj(fft(x)));%multiplicado por la tanformada de fourier
pow=pow(1:length(x)/2+1);
figure;plot(faxis,10*log10(pow));

figure;
semilogx(faxis,10*log10(pow));
hold on;
semilogx(faxis,10*log10(Sxx),'color','red')
xlim([0,100]);


