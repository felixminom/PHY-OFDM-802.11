clear;
close all;

%BPSK y R=1/2
tasa_codificacion = 1/2;    %1/2, 2/3 o 3/4
tipo_modulacion = 1;        %1-->BPSK, 2-->QPSK, 3-->16QAM, 4-->64QAM
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_6Mbps.mat');

%BPSK y R=3/4
tasa_codificacion = 3/4;
tipo_modulacion = 1;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_9Mbps.mat');

%QPSK y R=1/2
tasa_codificacion = 1/2;
tipo_modulacion = 2;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_12Mbps.mat');

%QPSK y R=3/4
tasa_codificacion = 3/4;
tipo_modulacion = 2;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_18Mbps.mat');

%16QAM y R=1/2
tasa_codificacion = 1/2;
tipo_modulacion = 3;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_24Mbps.mat');

%16QAM y R=3/4
tasa_codificacion = 3/4;
tipo_modulacion = 3;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_36Mbps.mat');

%64QAM y R=2/3
tasa_codificacion = 2/3;
tipo_modulacion = 4;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_48Mbps.mat');

%64QAM y R=3/4
tasa_codificacion = 3/4;
tipo_modulacion = 4;
nTrials = 1000;
[BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials);
save('802.11_54Mbps.mat');

%%
SNR = 2:2:30; 
load('802.11_6Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'r','DisplayName','AWGN(6Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','-','Color','r','Marker','o','DisplayName','Rayleigh(6Mbps)')
hold on
load('802.11_9Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','--','Color','b','DisplayName','AWGN(9Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','--','Color','b','Marker','x','DisplayName','Rayleigh(9Mbps)')
hold on
load('802.11_12Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','-.','Color','m','DisplayName','AWGN(12Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','-.','Color','m','Marker','s','DisplayName','Rayleigh(12Mbps)')
hold on
load('802.11_18Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','-','Color','y','DisplayName','AWGN(18Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','-','Color','y','Marker','>','DisplayName','Rayleigh(18Mbps)')
hold on
load('802.11_24Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','--','Color','c','DisplayName','AWGN(24Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','--','Color','c','Marker','d','DisplayName','Rayleigh(24Mbps)')
hold on
load('802.11_36Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','-.','Color','g','DisplayName','AWGN(36Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','-.','Color','g','Marker','+','DisplayName','Rayleigh(36Mbps)')
hold on
load('802.11_48Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','-','Color','k','DisplayName','AWGN(48Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','-','Color','k','Marker','*','DisplayName','Rayleigh(48Mbps)')
hold on
load('802.11_54Mbps.mat');
semilogy(SNR,BER_promedio_awgn,'LineStyle','--','Color',[0.9,0.3,0],'DisplayName','AWGN(54Mbps)')
hold on
semilogy(SNR,BER_promedio_ray,'LineStyle','--','Color',[0.9,0.3,0],'Marker','p','DisplayName','Rayleigh(54Mbps)')
hold off
legend('Location','NorthEast')
grid on
title('BER vs SNR')
ylabel('BER')
xlabel('SNR[dB]')
%%    
