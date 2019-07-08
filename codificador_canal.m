function code=codificador_canal(msg, rate)
ConstraingLenght=7;
CodeGenerator=[133, 177]; 
trel=poly2trellis(ConstraingLenght, CodeGenerator);
if (rate==1/2)    
    puct=1;
    code = convenc(msg,trel,puct);
elseif(rate==2/3)    
    puct=[1 1 1 0];
    code = convenc(msg,trel,puct);
elseif(rate==3/4)    
    puct=[1 1 1 0 0 1];
    code = convenc(msg,trel,puct);
else
    disp('Error')
end