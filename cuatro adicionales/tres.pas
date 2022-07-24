{3. La Organización Mundial de la Salud (OMS) está simulando la evolución de un nuevo virus que parece
propagarse a gran velocidad por todo el planeta. Para realizar esta simulación, debe procesar la información
recopilada por todos los países durante los últimos 30 días. La información se ingresa ordenada por país, hasta
el país Zimbabue que debe procesarse. Para cada país se ingresa el nombre del país, la cantidad total de
habitantes, y para cada uno de los 30 días se ingresa la cantidad de nuevos casos confirmados, la cantidad de
fallecidos y la cantidad de casos dados de alta (personas curadas). Informar:
a. La cantidad de países en los que la cantidad total de infectados supera el 1% de su población
b. Los nombres de los dos países con mayor cantidad de fallecidos
c. El nombre de los países donde la epidemia está en retroceso (la cantidad total de casos confirmados
es menor que la suma entre personas curadas y personas fallecidas)
d. Para cada país y por cada día X, si la cantidad de nuevos infectados es mayor o igual al doble del día
anterior, imprimir en pantalla el siguiente mensaje:
Alerta epidemiológica: País <y>. Dia <X>. Incremento: < INFECTADOS DIA X > / <INFECTADOS DIA X-1>
Por ejemplo, si en el país España se registraron 130 infectados en el día 3, y 283 infectados en el día 4,
el mensaje debería indicar: "Alerta epidemiológica: País España. Dia 4. Incremento 2.17" (valor obtenido a
partir de 283/130).}
program tres_a;
const max = 30;
type
    str = string[20];
    tpais = record
          nombre: str;
          habitantes: integer;
    end;
    tdias = record
          nuevoscasos: integer;
          fallecidos: integer;
          altas: integer;
    end;

procedure leerp(var p: tpais);
begin
     writeln('_____________________________________');
     writeln('Ingrese el nombre del pais:');
     readln(p.nombre);
     if(p.nombre <> 'Zimbabue')then
     begin
         writeln('Ingrese los habitantes:');
         readln(p.habitantes);
     end;
end;

procedure leerd(var d: tdias);
begin
     writeln('Ingrese los nuevos casos: ');
     readln(d.nuevoscasos);
     writeln('Ingrese los fallecidos: ');
     readln(d.fallecidos);
     writeln('Ingrese los dados de alta: ');
     readln(d.altas);
end;

var
   paises: tpais;
   dias: tdias;
begin
     leerp(paises);
     while(paises.nombre <> 'Zimbague')do
     begin
          nom_a:= pais.nombre;
          if(nom_a = pais.nombre)then
          begin
               for i:=0 to max do
               begin
                    leerd(dias);
               end;
               leerp(paises);
          end;
     end;
     readln;
end.
