{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la
provincia de Bs. As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente
calculada por la UNESCO para el año 2015 (1 docente cada 23,435 alumnos). Para ello se cuenta con
información de: CUE (código único de establecimiento), nombre del establecimiento, cantidad de
docentes, cantidad de alumnos, localidad. Se pide implementar un programa que procese la
información y determine:
? la cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la
sugerida por UNESCO.
? el CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos
El programa debe utilizar:
A) Un módulo para la lectura de la información de la escuela.
B) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente
entre la cantidad de alumnos y la cantidad de docentes).}

program tres;
const
     cantE = 5;
type
    escuela = record
            CUE: integer;
            nombre:string;
            cantD: integer;
            cantA: integer;
            localidad: string;
    end;

procedure leer(var e: escuela);
begin
     write('Ingrese el CUE: ');
     readln(e.CUE);
     write('Ingrese el nombre del establecimiento: ');
     readln(e.nombre);
     write('Ingrese la cantidad de docentes: ');
     readln(e.cantD);
     write('Ingrese la cantidad de alumnos: ');
     readln(e.cantA);
     write('Ingrese la localidad: ');
     readln(e.localidad);
end;

function relacion(docentes, alumnos: integer): real;
begin
     relacion:=alumnos / docentes;
end;

var
   e: escuela;
   nombre1,nombre2: string;
   cue1, cue2: integer;
   aux, mejorR1, mejorR2: real;
   i, cantLP:integer;
begin
     cantLP:=0;
     mejorR1:=9999;
     mejorR2:=9999;
     nombre1:= 'a'; cue1:= 1;
     for i:= 1 to 3 do
     begin
          leer(e);
          aux:=relacion(e.cantD,e.cantA);
          if((e.localidad = 'La Plata')and (aux > 23.435)) then cantLP:=cantLP+1;
          if (aux < mejorR1) then
          begin
               mejorR2:= mejorR1;
               nombre2:=nombre1;
               cue2:=cue1;
               mejorR1:= aux;
               nombre1:= e.nombre;
               cue1:= e.CUE;
          end
          else
          begin
               if(aux < mejorR2) then
               begin
                    mejorR2:= aux;
                    nombre2:= e.nombre;
                    cue2:= e.CUE;
               end;
          end;
     end;
     writeln(cantLP, ' es la cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.' );
     writeln(nombre1,' es la escuela con mejor relacion y su cue es: ', cue1);
     writeln(nombre2,' es la segunda escuela con mejore relacion y su cue es: ', cue2);
     readln;
end.
