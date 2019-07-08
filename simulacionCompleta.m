function  [BER_promedio_awgn, BER_promedio_ray] = simulacionCompleta(tasa_codificacion,tipo_modulacion,nTrials)
%Variables extras
N=144;                                    %Bits a transmitir
SNR = 2:2:30;                             %Vector SNR
[~, c] = size(SNR);
BER_awgn = zeros(c,nTrials);              %Matriz con los valores BER de todas las muestras
BER_ray = zeros(c,nTrials);

for x = 1 : nTrials
    data_in_serie = randi([0, 1],1,N);                                          %Generacion de datos binarios
    data_in_codificada = codificador_canal(data_in_serie,tasa_codificacion);    %Codififcacion del canal
    data_mod = modulador(data_in_codificada,tipo_modulacion);                   %Modulacion de datos
    [data_mod_OFDM, redundancia] = moduladorOFDM(data_mod);                     %Modulacion OFDM
    for z = SNR
        data_canal_awgn = awgn(data_mod_OFDM,z,'measured');                     %Agregar ruido gaussiano a la senal
        h = 1/sqrt(2)*(raylrnd(0.1,1,length(data_mod_OFDM)) + 1i*raylrnd(0.1,1,length(data_mod_OFDM)));
        filtrado_ray = h + data_mod_OFDM;                                   %Paso tren de simbolos por el canal rayleigh
        data_canal_ray = awgn(filtrado_ray,z,'measured'); 
        data_out_awgn_OFDM = demoduladorOFDM(data_canal_awgn, redundancia); %Demodulacion OFDM
        data_out_ray_OFDM = demoduladorOFDM(data_canal_ray, redundancia);    
        data_demod_awgn = demodulador(data_out_awgn_OFDM,tipo_modulacion);  %Demodulacion de la senal 
        data_demod_ray = demodulador(data_out_ray_OFDM,tipo_modulacion);  
        data_out_awgn = decodificador_canal(data_demod_awgn,tasa_codificacion); %Decodificacion del canal
        data_out_ray = decodificador_canal(data_demod_ray,tasa_codificacion);
        BER_awgn(z/2,x) = sum(abs(data_out_awgn-data_in_serie))/N;            %Obtener el BER de la senal demodulada
        BER_ray(z/2,x) = sum(abs(data_out_ray-data_in_serie))/N;
    end
end
%Obtencion del BER promediado
BER_promedio_awgn = (sum(BER_awgn,2)/(nTrials));
BER_promedio_ray = (sum(BER_ray,2)/(nTrials));
end

