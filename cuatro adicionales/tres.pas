{3. La Organizaci�n Mundial de la Salud (OMS) est� simulando la evoluci�n de un nuevo virus que parece
propagarse a gran velocidad por todo el planeta. Para realizar esta simulaci�n, debe procesar la informaci�n
recopilada por todos los pa�ses durante los �ltimos 30 d�as. La informaci�n se ingresa ordenada por pa�s, hasta
el pa�s Zimbabue que debe procesarse. Para cada pa�s se ingresa el nombre del pa�s, la cantidad total de
habitantes, y para cada uno de los 30 d�as se ingresa la cantidad de nuevos casos confirmados, la cantidad de
fallecidos y la cantidad de casos dados de alta (personas curadas). Informar:
a. La cantidad de pa�ses en los que la cantidad total de infectados supera el 1% de su poblaci�n
b. Los nombres de los dos pa�ses con mayor cantidad de fallecidos
c. El nombre de los pa�ses donde la epidemia est� en retroceso (la cantidad total de casos confirmados
es menor que la suma entre personas curadas y personas fallecidas)
d. Para cada pa�s y por cada d�a X, si la cantidad de nuevos infectados es mayor o igual al doble del d�a
anterior, imprimir en pantalla el siguiente mensaje:
Alerta epidemiol�gica: Pa�s <y>. Dia <X>. Incremento: < INFECTADOS DIA X > / <INFECTADOS DIA X-1>
Por ejemplo, si en el pa�s Espa�a se registraron 130 infectados en el d�a 3, y 283 infectados en el d�a 4,
el mensaje deber�a indicar: "Alerta epidemiol�gica: Pa�s Espa�a. Dia 4. Incremento 2.17" (valor obtenido a
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
