{10. Realizar un m�dulo que reciba como par�metro un n�mero entero y retorne la cantidad de d�gitos que
posee y la suma de los mismos.
a. Utilizando el m�dulo anterior, realizar un programa que lea una secuencia de n�meros e imprima la
cantidad total de d�gitos le�dos. La lectura finaliza al leer un n�mero cuyos d�gitos suman
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
   num, sum, digitos, totalD: integer;
begin
     repeat
           sum:=0;
           readln(num);
           cuenta(num, digitos, sum);
     until sum=10;
     writeln('El total de digitos es: ', digitos);
     readln;
end.
