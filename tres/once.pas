{11. Realizar un programa que lea secuencia de números enteros. La lectura finaliza cuando llega el número
123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos pares y la
suma de sus dígitos impares.}
program once;
procedure sumas(num: integer; var sumap, sumai: integer);
var
   ulti, resto: integer;
begin
     ulti:=num;
     while (ulti <> 0) do
     begin
          resto:= ulti mod 10;
          if ((resto mod 2) = 0) then sumap:=sumap+resto
                                 else sumai:=sumai+resto;
          ulti:=ulti div 10;
     end;
end;
var
   num, totalp, totali: integer;
begin
     writeln('escriba un numero: ');
     readln(num);
     while(num <> 123456) do
     begin
          totalp:=0;
          totali:=0;
          sumas(num,totalp,totali);
          writeln('La suma de sus digitos pares es: ', totalp,' y la suma de sus numeros impares: ', totali);
          readln(num);
     end;
     readln;
end.
