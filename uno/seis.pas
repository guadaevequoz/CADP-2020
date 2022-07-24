program seis;
{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad.
La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse. Al finalizar la lectura,
informar:
? La cantidad de alumnos leída
? La cantidad de alumnos cuyo promedio supera 6.5
? El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo
sean menor al valor 2500.
}
var
   legajo, cant_a, cant_p, cant_d: integer;
   prom, por: real;
begin
    cant_a:=0;
    cant_p:=0;
    cant_d:=0;
    writeln('Ingrese un legajo:');
    read(legajo);
    while (legajo<>-1) do
    begin
         writeln('Ingrese promedio:');
         read(prom);
         cant_a:=cant_a+1;
         if(prom>6.5) then
         begin
              cant_p:=cant_p+1;
         end;
         if (prom>8.5) and (legajo<2500) then
         begin
              cant_d:=cant_d+1;
         end;
         writeln('Ingrese un legajo: ');
         read(legajo);
    end;
    por:=(cant_d*100)/cant_a;
    writeln('La cantidad de alumnos es: ', cant_a);
    writeln('La cantidad de alumnos cuyo promedio es mayor a 6.5: ', cant_p);
    writeln('El porcentaje de alumnos con promedio mayor a 8.5 y legajo menor a 2500 es:', por:1:2,'%');
    readln();
end.
