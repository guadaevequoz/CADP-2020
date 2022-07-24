{13. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el
Grupo Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga,
informe:
- la cantidad de galaxias de cada tipo
- La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y
el porcentaje que esto representa respecto a la masa de todas las galaxias.
- la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
- el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program trece;
const dimF=4;

type
    tipoG = 1..4;
    str = string[20];
    galaxia = record
            nombre: str;
            tipo: tipoG;
            masa: real;
            dist: real;
    end;

    vectorG=array[1..dimF] of galaxia;

    vectorC=array[tipoG] of integer;

{modulos}
procedure leer(var g: galaxia);
begin
     writeln('Ingrese el nombre de la galaxia:');
     readln(g.nombre);
     writeln('Ingrese el tipo de la galaxia:');
     readln(g.tipo);
     writeln('Ingrese la masa');
     readln(g.masa);
     writeln('Ingrese la distancia a la tierra:');
     readln(g.dist);
     writeln('______________________');
end;

procedure cargar(var v:vectorG);
var i: integer; g: galaxia;
begin
     for i:=1 to dimF do
     begin
          leer(g);
          v[i]:=g;
     end;
end;

{la cantidad de galaxias de cada tipo}
procedure tipos(v: vectorG; var vT: vectorC);
var i,pos: integer;
begin
     for i:=1 to dimF do
     begin
          pos:= v[i].tipo;
          vT[pos]:= vT[pos] + 1;
     end;
     for i:=1 to 4 do writeln('La cantidad del tipo ', i,' es ', vT[i]);
     writeln('______________________');
end;


procedure porcentajesYcantI(v: vectorG; var masaP, prom: real; var cantI: integer);
var
   i: integer;
   masaT: real;
begin
     for i:=1 to dimF do
     begin
          {La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y
          el porcentaje que esto representa respecto a la masa de todas las galaxias.}
          if(v[i].nombre = 'Via Lactea') or (v[i].nombre = 'Andromeda') or (v[i].nombre = 'Triangulo') then masaP:= masaP + v[i].masa;
          masaT:= masaT + v[i].masa;

          {- la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc}
          if(v[i].tipo <> 4) and (v[i].dist < 1000) then cantI:= cantI+1;
     end;
     prom:= (masaP / masaT)*100;

end;

{el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}
procedure masymenos(v:vectorG; var maxN1,maxN2,minN1,minN2: str);
var i: integer; max1,max2,min1,min2: real;
begin
     max1:=-1;
     min1:=9999;
     for i:=1 to dimF do
     begin
          {maximos}
          if(v[i].masa > max1) then
          begin
               max2:= max1;
               maxN2:= maxN1;
               max1:= v[i].masa;
               maxN1:= v[i].nombre;
          end
          else begin
               if(v[i].masa > max2) then
               begin
                    max2:= v[i].masa;
                    maxN2:= v[i].nombre;
               end;
          end;

          {minimos}
          if(v[i].masa < min1) then
          begin
               min2:= min1;
               minN2:= minN1;
               min1:= v[i].masa;
               minN1:= v[i].nombre;
          end
          else begin
               if(v[i].masa < min2) then
               begin
                    min2:= v[i].masa;
                    minN2:= v[i].nombre;
               end;
          end;
     end;
end;

{principal}
var
   v: vectorG;
   vC: vectorC;
   masaP,prom: real;
   cantI:integer;
   maxN1, maxN2, minN1, minN2: str;
begin
     masaP := 0;
     prom := 0;
     cantI :=0;
     cargar(v);
     tipos(v,vC);
     porcentajesYcantI(v, masaP, prom, cantI);
     writeln('La masa total acumulada por las tres galaxias principales es de: ', masaP:1:2);
     writeln('Y el porcentaje respecto a las otras galaxias es del:', prom:1:2,'%');
     writeln('La cantidad de galaxias no irregulares que estan a una distancia menor de 1000 pc es de: ', cantI);
     writeln('______________________');
     masymenos(v, maxN1, maxN2, minN1, minN2);
     writeln(maxN1,' es la galaxia con mayor masa y la segunda es ', maxN2);
     writeln(minN1,' es la galaxia con menos masa y la segunda es ', minN2);
     readln;
end.
