function salida=modulador(entrada,modulacion)
switch modulacion
    case 1 %BPSK
        salida = zeros(1,length(entrada));
        for i=1 : length(entrada)
            if entrada(1,i) == 1
                salida(1,i) = 1;
            else 
                salida(1,i) = -1;
            end
        end
    case 2 %QPSK
        aux = reshape(entrada,2,[]).';
        aux1 = bi2de(aux);
        salida = zeros(1,length(entrada)/2);
        for i = 1 : length(entrada)/2
            if aux1(i,1) == 0
                salida(1,i) = -1-1i;
            elseif aux1(i,1) == 1
                salida(1,i) = -1+1i;
            elseif aux1(i,1) == 2
                salida(1,i) = 1-1i;
            else
                salida(1,i) = 1+1i;
            end
        end
    case 3 %16QAM
        aux = reshape(entrada,4,[]).';
        aux1 = bi2de(aux);
        salida = qammod(aux1,16,'gray').';
    case 4 %64QAM
        aux = reshape(entrada,6,[]).';
        aux1 = bi2de(aux);
        salida = qammod(aux1,64,'gray').';
end

