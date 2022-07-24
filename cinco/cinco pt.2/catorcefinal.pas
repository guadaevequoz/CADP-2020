 program catorce;
const paises=5; anios= 3; //cuando se ingresan por
type

    rango2 = 1..3;
    vectorPA = array[rango2] of real; //vector de promedio anual compuesto por el vector de los paises
    


{calculo anio temperatura maxima}
procedure max(tempPais, anio :integer; var maxAnio,maxTemp:integer);
begin
  if (tempPais > maxTemp) then begin
    maxAnio:= anio;
    maxTemp:= tempPais;
  end;
end;

{carga de vectores y resolucion inciso 1}
procedure carga(var v:vectorPA; var maxAnio:integer);
var
  anio, pais, tempPais,maxTemp: integer;
  acumulador:real;
begin
  maxTemp:= 0;
  for anio:= 1 to anios do begin
    writeln('Ingresar temperaturas corresponientes al anio: ', anio);
    writeln();
    acumulador:= 0;
    for pais:= 1 to paises do begin
      write('Ingrese la temperatura del punto ',pais, ': ');
      readln(tempPais);
      max(tempPais, anio, maxAnio, maxTemp);
      acumulador:= acumulador + tempPais;
    end;
    v[anio]:= acumulador / 5;
  end;
end;

 


{Analizar cual de los promedios anuales es el mayor}
function mayorPromedio(v:vectorPA): integer;
var
  i,anioMayor:integer;
  promMayor:real;
begin
  promMayor:= 0;
  for i:= 1 to anios do begin
    if (v[i] > promMayor) then begin
       promMayor:= v[i];
       anioMayor:= i;
    end;
  end;
  mayorPromedio:= anioMayor;
end;

var
   v1: vectorPA;
   maxAnio: integer;
begin
  carga(v1,maxAnio); // Se carga el vector de temperaturas promedio de cada anio y a la vez, me llega el anio con la mayor temp registrada
  writeln();
  writeln('El anio con la mayor temperatura registrada fue: ', maxAnio,' y el anio con la mayor temperatura promedio fue: ', mayorPromedio(v1));
end.
