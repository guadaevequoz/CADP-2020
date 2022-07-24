{2. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada
por código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
a. Los dos aviones que más kilómetros recorrieron, y los dos aviones que menos kilómetros recorrieron
b. El avión que salió desde más países diferentes
c. La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión
d. La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
}
program dosA;

type
    pais = string[25];
    tavion = record
           cod: integer;
           paisS: pais;
           paisL: pais;
           cantKM: real;
           porcOcu: real;
    end;

procedure leer(var a: tavion);
begin
     writeln('_____________________________________');
     writeln('Ingrese el codigo del avion:');
     readln(a.cod);
     if(a.cod <> 44)then
     begin
         writeln('Ingrese el pais de salida:');
         readln(a.paisS);
         writeln('Ingrese el pais de llegada:');
         readln(a.paisL);
         writeln('Ingrese la cantidad de kilometros:');
         readln(a.cantKM);
         writeln('Ingrese el porcentaje de ocupacion:');
         readln(a.porcOcu);
     end;
end;

{Los dos aviones que más kilómetros recorrieron, y los dos aviones que menos kilómetros recorrieron}
procedure dosaviones(var amax1, amax2, amin1, amin2: integer; var maxkm1, maxkm2, minkm1, minkm2: real; avion_c:integer; avion_km: real);
begin
     {dos maximos}
     if(avion_km > maxkm1) then
     begin
          maxkm2:=maxkm1;
          amax2:= amax1;
          maxkm1:= avion_km;
          amax1:= avion_c;
     end
     else
     begin
          if(avion_km > maxkm2) then
          begin
               maxkm2:= avion_km;
               amax2:= avion_c;
          end;
     end;

     {dos minimos}
     if(avion_km < minkm1)then
     begin
          minkm2:=minkm1;
          amin2:= amin1;
          minkm1:= avion_km;
          amin1:= avion_c;
     end
     else begin
          if(avion_km < minkm2) then
          begin
               minkm2:= avion_km;
               amin2:= avion_c;
          end;
     end;
end;

{La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión}
function cant5km(km, ocup: real):boolean;
begin
     if(km > 5000) and (ocup < 60) then cant5km:= true
                                   else cant5km:=false;
end;

{La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda}
function cant10km(km: real; paisL: pais):boolean;
begin
     if(km > 10.000) and ((paisL = 'Australia') or (paisL ='Nueva Zelanda')) then cant10km:= true
           else cant10km:= false;
end;

var
   avion: tavion;
   paisS_a: pais;
   amax1,amax2,amin1,amin2, cant1, cant2, paisdif:integer;
   maxkm1,maxkm2,minkm1,minkm2:real;
begin
     maxkm1:= -1; minkm1:=9999;
     cant1:= 0; cant2:= 0;
     leer(avion);
     while(avion.cod <> 44) do
     begin
        paisS_a:= avion.paisS;
        //paisdif:=0;
        while(paisS_a = avion.paisS) and (avion.cod <> 44) do
        begin
             dosaviones(amax1,amax2,amin1,amin2,maxkm1,maxkm2,minkm1,minkm2,avion.cod,avion.cantKM);
             if(cant5km(avion.cantKM, avion.porcOcu)) then cant1:=cant1 + 1;
             if(cant10km(avion.cantKM, avion.paisL)) then cant2:=cant2 + 1;
             //paisdif:=paisdif+1;
             leer(avion);
        end;
     end;
     writeln(amax1,' es el avion con mas KM y ', amax2,' es el segundo.');
     writeln(amin1,' es el avion con menos KM y ', amin2,' es el segundo.');
     writeln(cant1,' es la cantidad de aviones con mas de 5.000 km y menos del 60% de ocupacion.');
     writeln(cant2,' es la cantidad de aviones con mas de 10.000 km y con el pais de llegada "Australia" o "Nueva Zelanda".');
     readln;
end.
