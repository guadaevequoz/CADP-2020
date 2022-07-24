{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para
analizar la información de los productos que mantiene actualmente en stock. Para ello, se conoce la
siguiente información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core
i7, Opteron, Atom, Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8),
velocidad del reloj (medida en Ghz) y tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45,
etc..).
Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
? la marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22
nm
? las dos marcas con mayor cantidad de procesadores con transistores de 14 nm
? la cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes
alcancen velocidades de al menos 2 Ghz
Nota: la información de los microprocesadores se lee de forma consecutiva por marca de procesador
y la lectura finaliza al ingresar un procesador con 0 cores, que no debe procesarse.}

program seis;

type
    marcas = string[20];
    lineas = string[15];
    producto = record
             marca: marcas;
             linea: lineas;
             cantN: integer;
             velocidad: real;
             tNano: integer;
    end;

{lee los datos del procesador}
procedure leer(var micro: producto);
begin
    with micro do begin
         writeln('Ingrese la marca:');
         readln(marca);
         writeln('Ingrese la cantidad de nucleos:');
         readln(cantN);
         if(cantN <> 0)then begin
                  writeln('Ingrese la linea:');
                  readln(linea);
                  writeln('Ingrese la velocidad:');
                  readln(velocidad);
                  writeln('Ingrese el tamaño de los nanometros:');
                  readln(tNano);
         end;
    end;
end;

{la marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22
nm}
function mas2cores(cant:integer; tNano: integer):boolean;
begin
     mas2cores:= ((cant> 2) and (tNano <= 22));
end;
{las dos marcas con mayor cantidad de procesadores con transistores de 14 nm}
procedure actualizardosmarcas(marca: marcas; cant: integer; var maxM1, maxM2: marcas; var max1, max2: integer);
begin
      if(cant > max1) then
      begin
           max2:=max1;
           maxM2:= maxM1;
           max1:=cant;
           maxM1:=marca;
      end
      else
      begin
          if(cant > max2) then
          begin
               max2:=cant;
               maxM2:=marca;
          end;
      end;
end;
{la cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes
alcancen velocidades de al menos 2 Ghz}
function cantproce(marca: marcas; velocidad: real; cantN: integer):boolean;
begin
     cantproce:= (((marca = 'Intel') or (marca = 'AMD')) and (velocidad >= 2) and (cantN > 2));
end;

var
   m: producto;
   marca_a, marcaM1, marcaM2:string[20];
   cantT, max1, max2, cantP: integer;
begin
     cantP:=0;
     max1:=0;
     leer(m);
     while (m.cantN <> 0) do
     begin
          cantT:=0;
          marca_a:=m.marca;
          while(marca_a = m.marca) do
          begin
               if(mas2cores(m.cantN, m.tNano)) then writeln('El procesador de la marca ', m.marca,' y linea ', m.linea,' tiene más de 2 cores con transistores de a lo sumo 22 nm');
               if(m.tNano = 14) then cantT:=cantT+1;
               if cantproce(marca_a, m.velocidad, m.tNano) then cantP := cantP + 1;
               leer(m);
          end;
          actualizardosmarcas(marca_a,cantT,marcaM1,marcaM2,max1,max2);
     end;
     writeln(marcaM1, ' es la marca con transitores con masde 14 mn y ', marcaM2,' es la segunda.');
     writeln(cantP, ' son la cantidad procesadores multicore de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.');
     readln;
end.
