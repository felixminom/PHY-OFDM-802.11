function salida = demoduladorOFDM(entrada, redundancia)
    data_rx_paralelo = reshape(entrada,80,[]).';                           %Conversion S/P
    data_sin_pc = data_rx_paralelo(:,17:end);                              %Eliminacion del pc
    fft_symT_out = fft(data_sin_pc);                                       %Transformada de fourier
    sym_out_paralelo = [fft_symT_out(:,6:10) fft_symT_out(:,12:24)...      %Obtencion de las subportadoras de datos
        fft_symT_out(:,26:31) fft_symT_out(:,33:38)...
        fft_symT_out(:,40:52) fft_symT_out(:,54:58)]; 
    salida = reshape(sym_out_paralelo.',1,[]);                             %Conversion P/S
    if redundancia ~= 0
        salida = salida(:,1:end-redundancia);
    end
end

