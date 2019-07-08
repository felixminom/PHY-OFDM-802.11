function salida = demodulador(entrada,modulacion)
switch modulacion
    case 1 %BPSK
        salida = zeros(1,length(entrada));
        for i=1 : length(entrada)
            if entrada(1,i) > 0
                salida(1,i) = 1;
            else 
                salida(1,i) = 0;
            end
        end
    case 2 %QPSK
        salida = zeros(1,2*length(entrada));
        j = 1;
        for i = 1 : length(entrada)
            if (real(entrada(1,i)) < 0 && imag(entrada(1,i)) < 0)
                salida(1,j) = 0;
                j= j+1;
                salida(1,j) = 0;
                j = j+1;
            elseif (real(entrada(1,i)) > 0 && imag(entrada(1,i)) < 0)
                salida(1,j) = 0;
                j= j+1;
                salida(1,j) = 1;
                j = j+1;
            elseif (real(entrada(1,i)) < 0 && imag(entrada(1,i)) > 0)
                salida(1,j) = 1;
                j= j+1;
                salida(1,j) = 0;
                j = j+1;
            else
                salida(1,j) = 1;
                j = j+1;
                salida(1,j) = 1;
                j = j+1;
            end
        end
    case 3 %16QAM
        aux = qamdemod(entrada.',16,'gray');  
        aux1 = de2bi(aux,4);                    
        salida = reshape(aux1.',1,[]);
    case 4 %64QAM
        aux = qamdemod(entrada.',64,'gray');  
        aux1 = de2bi(aux,6);                    
        salida = reshape(aux1.',1,[]);
end

