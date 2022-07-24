{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales.
De cada centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece,
la cantidad de investigadores y la cantidad de becarios que poseen. La información se lee de forma
consecutiva por universidad, y la lectura finaliza al leer un centro con 0 investigadores, que no debe
procesarse. Informar:
? la cantidad total de centros para cada universidad.
? la universidad con mayor cantidad de investigadores en sus centros.
? los dos centros con mayor cantidad de becarios.
}

program siete;

type

    centros = record
            nombre: string[10];
            uni: string[20];
            cantI: integer;
            cantB: integer;
     end;

procedure leerC(var c: centros); //lee centros
begin
     writeln('Ingrese la cantidad de investigadores del centro ');
     readln(c.cantI);
     if(c.cantI <> 0) then
     begin
          writeln('Ingrese el nombre abreviado del centro ');
          readln(c.nombre);
          writeln('Ingrese la universidad del centro ');
          readln(c.uni);
          writeln('Ingrese la cantidad de becarios del centro ');
          readln(c.cantB);
     end;
end;

{la universidad con mayor cantidad de investigadores en sus centros.}
procedure maxI(uni: string[20]; cant: integer; var nMax: string[20]; var cantM: integer);
begin
     if(cant > cantM)then
     begin
          cantM:=cant;
          nMax:= uni;
     end;
end;

{los dos centros con mayor cantidad de becarios.}
procedure maxbecarios(centro: string[10];cantB: integer; var maxC1, maxC2: string[10]; var max1, max2: integer);
begin
     if(cantB > max1) then
     begin
          maxC2:= maxC1;
          max2:= max1;
          max1:= cantB;
          maxC1:= centro;
     end
     else begin
          if(cantB > max2) then
          begin
               max2:= cantB;
               maxC2:= centro;
          end;
     end;
end;


var
   centro: centros;
   cantC, cantMI, max1, max2,cantI: integer;
   uniMax, uni_a, nMax1, nMax2: string[10];
begin
     cantMI:=0;
     leerC(centro);
     while(centro.cantI <> 0) do
     begin
          cantC:=0;
          cantI:=0;
          uni_a:=centro.uni;
          while (uni_a = centro.uni) and (centro.cantI <> 0) do
          begin
               cantI:=cantI+centro.cantI;//cantidad de aculador de investigadores
               maxbecarios(centro.nombre, centro.cantB, nMax1, nMax2, max1, max2);
               cantC:=cantC+1; //acumulador de cantidad total de centros
               leerC(centro);
          end;
          writeln(cantC, ' es la mayor cantidad de centros para la universidad: ', uni_a);
          maxI(uni_a, cantI, uniMax,cantMI);
     end;
     writeln(uniMax,' es la facultad con mayor cantidad de investigadores');
     writeln(nMax1,' y ', nMax2,' son los centros con más becarios');
     readln;
end.
