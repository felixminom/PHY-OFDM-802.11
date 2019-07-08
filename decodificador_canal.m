function decode=decodificador_canal(msg, rate)
ConstraingLenght=7;
CodeGenerator=[133, 177]; 
trel=poly2trellis(ConstraingLenght, CodeGenerator);
tblen=32;           
if rate==1/2    
    puct=[1];
    decode=vitdec(msg, trel, tblen, 'trunc', 'hard');    
elseif rate==2/3
    puct=[1 1 1 0];
    decode=vitdec(msg,trel,tblen, 'trunc','hard', puct);
elseif  rate==3/4
    puct=[1 1 1 0 0 1];      
    decode=vitdec(msg,trel,tblen, 'trunc','hard', puct);
else
    disp('Error')
end
