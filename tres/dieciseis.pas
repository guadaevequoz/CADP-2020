{
16. Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patr�n A%B* donde:
- A es una secuencia de caracteres en la que no exista el car�cter �$�.
- B es una secuencia con la misma cantidad de caracteres que aparecieron en A y en la que aparezca a
lo sumo 3 veces el car�cter �@�.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patr�n no se cumpli�
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
          if(car= '*') then writeln('Se cumpli� el patr�n')
                    else writeln('No cumple el patr�n B');
     end
     else begin
          writeln('No cumple el patr�n A');
     end;
     readln;
end.
