{15. Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patrón A$B# donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió}
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
          if(car= '#') then writeln('Se cumplió el patrón')
                    else writeln('No cumple el patrón B');
     end
     else begin
          writeln('No cumple el patrón A');
     end;
     readln;
end.
