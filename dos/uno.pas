{Realizar un programa que lea 10 n�meros enteros e informe la suma total de los n�meros le�dos.
a. Modifique el ejercicio 1 para que adem�s informe la cantidad de n�meros mayores a 5
}
program uno;
const
  cant=10;
var
  i, num, suma, mayor5: Integer;
begin
  mayor5:=0;
  for i:=1 to cant do 
  begin
    writeln('Ingrese un numero:');
    readln(num);
    suma:=suma+num;
    if(num>5) then mayor5:=mayor5+1;
  end;
  writeln('La suma de los numeros es: ', suma);
  writeln('La cantidad de numeros mayores a 5 es: ', mayor5);
  readln;
end.
