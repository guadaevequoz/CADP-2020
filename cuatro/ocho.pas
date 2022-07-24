{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en
el programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único,
un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que
participan del proyecto, el nombre de la escuela y la localidad a la que pertenecen. Cada escuela
puede presentar más de un proyecto, y la información se ingresar ordenada consecutivamente por
localidad, y para cada localidad por escuela.
Realizar un programa que lea la información de los proyectos hasta que se ingrese el proyecto con
código -1 (que no debe procesarse), e informe:
A) La cantidad total de escuelas que participan en la convocatoria 2018 y la cantidad de escuelas
por cada localidad
B) Los nombres de las dos escuelas con mayor cantidad de alumnos participantes
C) El título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos
pares e impares.}

program ocho;

type
    tdocente = record
             DNI: integer;
             nombre: string;
             apellido: string;
             email: string;
    end;
    tproyecto = record
             codigo: integer;
             titulo: string;
             docenteC: tdocente;
             cantA: integer;
             escuela: string;
             localidad: string;
    end;

procedure leerP(var p: tproyecto); //lee datos proyecto
     procedure leerD(var d: tdocente); //lee datos docente
     begin
          writeln('Ingrese DNI: ');
          readln(d.dni);
          writeln('Ingrese nombre: ');
          readln(d.nombre);
          writeln('Ingrese apellido: ');
          readln(d.apellido);
          writeln('Ingrese email: ');
          readln(d.email);
     end;
begin
     writeln('Ingrese el codigo: ');
     readln(p.codigo);
     if (p.codigo <> -1) then begin
        writeln('Ingrese el titulo: ');
        readln(p.titulo);
        leerD(p.docenteC);
        writeln('Ingrese la cantidad de alumnos: ');
        readln(p.cantA);
        writeln('Ingrese la escuela: ');
        readln(p.escuela);
        writeln('Ingrese la localidad: ');
        readln(p.localidad);
     end;
end;

{Los nombres de las dos escuelas con mayor cantidad de alumnos participantes}
procedure dosescuelas(var maxA1, maxA2: integer; var maxE1,maxE2: string; escuela: string; cantA: integer);
begin
     if(cantA > maxA1) then begin
              maxA2:=maxA1;
              maxE2:=maxE1;
              maxA1:=cantA;
              maxE1:= escuela;
     end
     else begin
          if(cantA > maxA2) then begin
                   maxA2:=cantA;
                   maxE2:=escuela;
          end;
     end;
end;

{El título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos
pares e impares.}
function posee(cod:integer):boolean;
var aux,cantP,cantI: integer;
begin
    aux:=cod;
    while (aux <> 0) do
    begin
         if((aux mod 2) = 0) then cantP:=cantP+1
                 else cantI:=cantI+1;
         aux:=aux div 10;
    end;
    if(cantP = cantI) then posee:= true
             else posee := false;
end;

var
   proyecto: tproyecto;
   cantE, cantEL, max1, max2: integer;
   localidad_a, es1, es2: string;
begin
     cantE:=0; max1:=0;
     leerP(proyecto);
     while(proyecto.codigo <> -1) do begin
         cantEL:=0;
         localidad_a:= proyecto.localidad;
         while(localidad_a = proyecto.localidad)or(proyecto.codigo <> -1) do begin
             cantEL:=cantEL+1;
             dosescuelas(max1,max2,es1,es2,proyecto.escuela,proyecto.cantA);
             if(proyecto.localidad = 'Daireaux') and (posee(proyecto.codigo)) then writeln('El proyecto ', proyecto.titulo,' posee igual cantidad de digitos pares e impares.');
             leerP(proyecto);
         end;
         writeln('La cantidad de escuelas participantes de la localidad de ', localidad_a,' es de: ', cantEL);
         cantE:=cantE+cantEL;
     end;
     writeln('La cantidad de escuelas participantes es de: ', cantE);
     writeln(es1,' es la escuela con mas alumnos participante y la segunda es: ', es2);
     readln;
end.
