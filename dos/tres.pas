{. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}

program tres;
type
    notaa= 1..10 ;
    cadenaN= string[20];
var
   nombre: cadenaN;
   nota: notaa;
   aprob, siete: integer;
begin
   repeat
         write('Ingrese un nombre: ');
         readln(nombre);
         write('Ingrese una nota: ');
         readln(nota);
         if(nota>=8) then
         begin
              aprob:=aprob+1;
         end
         else begin
         if(nota=7) then siete:=siete+1;
         end;
   until(nombre='Zidane Zinedine');
   writeln('La cantidad de alumnos aprobados es: ', aprob);
   writeln('La cantidad de alumnos que obtuvieron 7 es: ', siete);
   readln;
end.
