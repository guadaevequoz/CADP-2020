{14. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos
los años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos
lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y
con todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis
estadísticos. Realizar un programa que lea y almacene los datos correspondientes a las mediciones
de los últimos 50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la
información, obtener:
- el año con mayor temperatura promedio a nivel mundial.
- el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años}

program catorce;
const max1=5; max2= 3; //cuando se ingresan por
type
    rango1 = 1..max1;
    rango2 = 1..max2;

    paises = array[rango1] of real; //vector de paises
    vectorPA = array[rango2] of real; //vector de promedio anual compuesto por el vector de los paises

{carga de vectores}

procedure procesar(v: vectorPA; var maxA1, maxA2: integer);
var i: rango2; a: rango1;
    v2: paises;
    prom, maxT, maxprom: real;
begin
     maxT:= -1;
     maxprom:= -1;
     for i:=1 to max2 do
     begin
          prom:=0;
          writeln('Año: ', i);
          {el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años}
          for a:=1 to max1 do
          begin
               writeln('Ingrese la temperatura de un punto del planeta: ');
               readln(v2[a]);
               prom:= prom + v2[a];
               if(v2[a] > maxT) then
               begin
                    maxT:= v2[a];
                    maxA2:= i;
               end;
          end;

          {el año con mayor temperatura promedio a nivel mundial.}
          prom:= prom / max1;
          v[i]:= prom;
          if( prom > maxprom) then
          begin
               maxprom:= prom;
               maxA1:= i;
          end;
     end;
end;

var
   v1: vectorPA;
   maxA1: integer;
   maxA2: integer;
begin
     procesar(v1, maxA1, maxA2);
     writeln('El año con el promedio de temperaturas mayor es: ', maxA1);
     writeln('El año con la temperatura mas alta en sus paises es: ', maxA2);
     readln;
end.

