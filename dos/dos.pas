{Realice un programa que lea 10 n�meros e informe cu�l fue el mayor n�mero le�do. Por ejemplo,
si se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deber� informar: �El mayor n�mero le�do fue el 98�
a. Modifique el programa anterior para que, adem�s de informar el mayor n�mero le�do, se
informe el n�mero de orden, dentro de la secuencia, en el que fue le�do. Por ejemplo, si se
lee la misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deber� informar: �El mayor n�mero le�do fue el 98, en la posici�n 7�}
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
  writeln('El numero mayor es: ', mayor, ' y esta en la posici�n: ', posm);
  readln;
end.
