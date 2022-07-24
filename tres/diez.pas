{10. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
a. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman
exactamente 10, el cual debe procesarse.}

program diez;
procedure cuenta(n: integer; var cantD, suma: integer);
var
   ulti, resto: integer;
begin
     ulti:= n;
     while (ulti <> 0) do
     begin
        resto:= ulti mod 10; {toma el ultimo numero}
        cantD:=cantD+1; {suma 1 al contador de digitos}
        ulti:= ulti div 10;
        suma:= suma + resto;{suma el ultimo numero}
     end;
end;
var
   num, sum, digitos: integer;
begin
     readln(num);
     cuenta(num, digitos, sum);
     writeln('Posee: ', digitos, ' digitos y su suma es: ', sum);
     readln;
end.
