{15. Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patr�n A$B# donde:
- A es una secuencia de s�lo letras vocales
- B es una secuencia de s�lo caracteres alfab�ticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patr�n no se cumpli�}
program quince;

function vocal(var letra:char):boolean;
begin
     if (letra = 'A' ) or (letra = 'E') or (letra = 'I') or (letra = 'U') or (letra = 'O') then vocal:= true
        else vocal:= false;
end;

var
   car: char;
begin
     writeln('Ingrese un caracter');
     readln(car);
     while(vocal(car)) do  {revisa si es vocal}
     begin
          writeln('Ingrese un caracter del patron A');
          readln(car);
     end;
     if(car = '$') then
     begin
          writeln('Ingrese un caracter del patron B');
          readln(car);
          while (not vocal(car) and (car <> '#')) do
          begin
               writeln('Ingrese un caracter del patron B');
               readln(car)
          end;
          if(car= '#') then writeln('Se cumpli� el patr�n')
                    else writeln('No cumple el patr�n B');
     end
     else begin
          writeln('No cumple el patr�n A');
     end;
     readln;
end.
