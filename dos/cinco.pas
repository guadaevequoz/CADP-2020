{Realizar un programa que lea n�meros enteros desde teclado. La lectura debe finalizar cuando
se ingrese el n�mero 100, el cual debe procesarse. Informar en pantalla:
? El n�mero m�ximo le�do.
? El n�mero m�nimo le�do.
? La suma total de los n�meros le�dos.}

program cinco;
const
     maxi=10;
var
   num, max, min, suma: integer;
begin
   max:=0;
   min:=100000;
   repeat
         writeln('Ingrese un numero: ');
         readln(num);
         suma:=suma+num;
         if(num>max) then max:=num;
         if(num<min) then min:=num;
   until (num=maxi);
   writeln('La suma es los numeros es: ', suma);
   writeln(max,' es el numero mayor y ', min, ' es el numero menor');
   readln;
end.
