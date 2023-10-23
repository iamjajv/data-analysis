x=EEG;
xf=fft(x-mean(x));%calculamos la transformada de fourier y le restamos los datos del enfacelo, se le quita la media por lo regular y nos indica que tanto se proxima a la media
dt=t(2)-t(1);%intervalo de muestreo
N=length(x);%numero de puntos
T=N*dt;%duracion de los datos
Sxx=(2*dt^2/T)*(xf.*conj(xf));
figure;
plot(Sxx);
%f9
Sxx=Sxx(1:N/2+1);%quitamos las frecuencias negativas , hasta la fcuencia de nqust
df=1/T;
fNQ=(1/dt)/2;
faxis=0:df:fNQ;
figure;
plot(faxis,Sxx);

%f9
figure;
plot(faxis,10*log10(Sxx/max(Sxx)));%aqui estamos pasando a decibeles%checar en acustica porque deben dar +
xlim([0,100])
ylim([-60, 0])
%f9
figure;
semilogx(faxis,10*log10(Sxx/max(Sxx)));
xlim([0,100])
ylim([-60, 0])
%nos dice a que frecuencias oscilo ver el pico de 60hz

Fs=1/dt;
interval=round(Fs);
overlap=round(Fs*0.95);
nfft=round(Fs);

[S,F,T,P]=spectrogram(x-mean(x),interval,overlap,nfft,Fs);%sig que la funcion de espectograma regresa a esas 4 funciones
figure;
imagesc(T,F,10*log10(P));
colorbar;
colormap(jet);
axis xy
ylim([0 70])
xlabel('Tiempo [s]')
ylabel('Frecuencia [hz]')







