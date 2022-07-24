{
16. Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patrón A%B* donde:
- A es una secuencia de caracteres en la que no exista el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecieron en A y en la que aparezca a
lo sumo 3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió
}

var
   car: char;
   cant: integer;
   condicionA, condicionB: boolean;
begin
     condicionA:= true;
     condicionB:= true;
     cant:=0;
     writeln('Ingrese un caracter');
     readln(car);
     while(condicionA) do  {revisa si ingrese el $ o %}
     begin
          if ((car = '$') or (car = '%')) then condicionA:=false
          else
          begin
               writeln('Ingrese un caracter del patron A');
               readln(car);
          end;
     end;
     if(car = '%') then
     begin
          writeln('Ingrese un caracter del patron B');
          readln(car);
          if(car = '@') then cant:= cant+1;
          while (condicionB) do
          begin
               if ((cant > 3) or (car = '*')) then condicionB:=false
               else
               begin
                    writeln('Ingrese un caracter del patron B');
                    readln(car);
                    if(car = '@') then cant:= cant+1;
               end;
          end;
          if(car= '*') then writeln('Se cumplió el patrón')
                    else writeln('No cumple el patrón B');
     end
     else begin
          writeln('No cumple el patrón A');
     end;
     readln;
end.
