{14. El Grupo Intergubernamental de Expertos sobre el Cambio Clim�tico de la ONU (IPCC) realiza todos
los a�os mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos
lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 a�os, y
con todos los datos recolectados, el IPCC se encuentra en condiciones de realizar an�lisis
estad�sticos. Realizar un programa que lea y almacene los datos correspondientes a las mediciones
de los �ltimos 50 a�os (la informaci�n se ingresa ordenada por a�o). Una vez finalizada la carga de la
informaci�n, obtener:
- el a�o con mayor temperatura promedio a nivel mundial.
- el a�o con la mayor temperatura detectada en alg�n punto del planeta en los �ltimos 50 a�os}

program catorce;
const max1=3; max2= 5;
type
    rango1 = 1..max1;
    rango2 = 1..max2;

    vectorP = array[rango1] of real; //vector de paises
    vectorPA = array[rango2] of real; //vector de promedio anual

{carga de vectores}
procedure carga(var v1: vectorP; var v2: vectorPA);
var i: rango1; a: rango2;
    prom, suma: real;
begin
     for a:=1 to max2 do //carga los a�os
     begin
          suma:=0;
          for i:=1 to max1 do //carga los paises con temperaturas al azar
          begin
               //v1[i]:= random(100);
               {sin random:}
               writeln('Ingrese la temperatura ', i, ' del a�o ', a);
               readln(v1[i]);
               suma:= suma + v1[i];
          end;
          prom:= suma /  max1;
          v2[a]:= prom;
     end;
end;

function masaT(v: vectorP):real;
   var i: rango1;
    maxT: real;
begin
     maxT:= -1;
     for i:= 1 to max1 do begin
         if (v[i] > maxT) then
       begin

              maxT := v[i];
         end;
     end;
end;

procedure procesar(v1: vectorPA ; v2: vectorP; var maxA1: integer; var maxA2: integer);
var i: rango2;
    maxT1, maxT2: real;
begin
     maxA2:=2;
     maxT1:= -1; maxT2:= -1;
     for i:=1 to max2 do   //recorre vector anual
     begin
          if (masaT(v2) >  maxT2) then
          begin
               maxT2:= masaT(v2);
               maxA2:= i;
          end;
          {el a�o con mayor temperatura promedio a nivel mundial.}
          if(v1[i] > maxT1) then
          begin
               maxT1:= v1[i];
               maxA1:= i;
          end;
     end;
end;

var
   v1: vectorP;
   v2: vectorPA;
   anio1, anio2: integer;
begin
     carga(v1,v2);
     procesar(v2, v1,anio1, anio2);
     writeln('El a�o con el promedio de temperaturas mayor es: ', anio1);
     writeln('El a�o con la temperatura mas alta en algun pais es: ', anio2);
     readln;
end.

