program uno;
type
    str20 = string[20];
    alumno = record
           codigo : integer;
           nombre : str20;
           promedio : real;
    end;
procedure leer(var alu : alumno);
begin
     write('Ingrese el codigo del alumno: ');
     readln(alu.codigo);
     if (alu.codigo <> 0) then begin
        write('Ingrese el nombre del alumno: ');
        readln(alu.nombre);
        write('Ingrese el promedio: ');
        readln(alu.promedio);
     end;
end;
var
   a: alumno;
   cant: integer;
   maxP: real;
   nomMaxP: string;
begin
   cant:=0;
   maxP:= 0;
   leer(a);
   while (a.codigo <> 0) do
   begin
        cant:=cant+1;
        if(a.promedio > maxP) then
        begin
             maxP:= a.promedio;
             nomMaxP:= a.nombre;
        end;
        leer(a);
   end;
   writeln('La cantidad de alumnos leidos es: ', cant);
   writeln('El alumno con mayor promedio es: ', nomMaxP);
   readln;
end.
