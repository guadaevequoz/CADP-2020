{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles
son los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al
leer el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al
leer el número 0, el cual no debe procesarse}

program cuatro;
const
     cant=10;
var
   num, min1, min2, i: integer;
begin
   min1:=10000;
   min2:=10000;
   repeat
        writeln('Ingrese un numero: ');
        readln(num);
        if(num<min1) and (num<min2) then
        begin
             min1:=num;
        end
        else
        begin
             if(num>min1) and (num<min2) then min2:=num;
        end;
   until (num=0);
   writeln('Los dos numeros mas chicos son: ', min1, ' y ', min2);
   readln;
end.
