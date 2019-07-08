function [salida, redundancia] = moduladorOFDM(entrada)
    residuo = mod(length(entrada),48);
    if  residuo ~= 0
        redundancia = 48-residuo;
        aux = zeros(1,redundancia);
        entrada = [entrada aux];
    else
        redundancia = 0;
    end
	data_in_paralelo = reshape(entrada,48,[]).';                                %Conversion S/P
    [f, ~] = size(data_in_paralelo);
    sym_in_paralelo = [zeros(f,5) data_in_paralelo(:,1:5) ones(f,1)...          %Concatenacion de subportdoras de datos, piloto, nulas y DC
        data_in_paralelo(:,6:18) ones(f,1) data_in_paralelo(:,19:24)...
        zeros(f,1) data_in_paralelo(:,25:30) ones(f,1) data_in_paralelo(:,31:43)...
        -ones(f,1) data_in_paralelo(:,44:48) zeros(f,6)];
    ifft_sym_in = ifft(sym_in_paralelo);                                        %Tranformada de fourier
    ifft_symT_in = [ifft_sym_in(:,49:end) ifft_sym_in];                         %Obtencion del pc
    salida = reshape(ifft_symT_in.',1,[]);                                      %Conversion P/S
end

