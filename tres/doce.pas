{12. Realice un programa que lea 10 pares de números (X,Y) e informe, para cada par de números, la suma y el
producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)}

program doce;

function esmayor(n1, n2: integer): boolean;
begin
     if(n1 > n2) then esmayor:= true
                 else esmayor:= false;
end;

procedure cuentas(var n1, n2, suma, multi: integer);
var
 i, aux: integer;
begin
  if (esmayor(n1,n2)) then begin
    aux:= n1;
    n1:= n2;
    n2:= aux; // Se encarga de que el valor mayor siempre sea n2
  end;
  if (n1=0) then n1:=1;  // Si n1 es 0 la multiplicacion no funciona, así que lo setea en 1
  for i:= n1 to n2 do begin // Realiza las cuentas
    suma:= suma + i;
    multi:= multi * i;
  end;
end;

var
   num1, num2, sum, mul, i, j: integer;
begin
     writeln('Ejercicio 12 TP3 ');
     writeln();
     for i:=1 to 10 do begin // Se leen los 10 pares de numeros
          sum:=0;
          mul:=1;
          writeln('Ingresar un par de numeros (', i, ' de ',10,')');
          write('Ingresar primer numero: ');
          readln(num1);
          write('Ingresar segundo numero: ');
          readln(num2);
          cuentas(num1, num2, sum, mul);
          write('La suma es: ', sum, ' (obtenido de calcular ');
          for j:= num1 to num2-1 do write(j, ' + '); // No es necesario, se imprime para entender la suma que se hizo
          writeln(num2, ')'); 
          write('El producto es: ', mul, ' (obtenido de calcular ');
          for j:= num1 to num2-1 do write(j, ' * '); // No es necesario, se imprime para entender la multiplicacion que se hizo
          writeln(num2, ')');
          writeln();
          writeln('-------------------------- ');
     end;
     readln; // Para que no se cierre la consola
end.
