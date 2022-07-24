{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo,
si se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se
lee la misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}
program dos;
const
  cant=10;
var
  i, num, posm, mayor: Integer;
begin
  mayor:=0;
  for i:=1 to cant do 
  begin
    writeln('Ingrese un numero:');
    readln(num);
    if(num>mayor) then 
    begin
      mayor:=num;
      posm:=i;
    end;
  end;
  writeln('El numero mayor es: ', mayor, ' y esta en la posición: ', posm);
  readln;
end.
