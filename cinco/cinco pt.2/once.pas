{11. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes.
Para ello, cuenta con información sobre todos los viajes realizados durante el mes de marzo.
De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero
transportado y distancia recorrida por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura
finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó más dinero.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km. }

program once;
const dimF = 200;

type
    dias = 1..31;
    tviaje= record
            dia: dias;
            monto: real;
            dist: real;
    end;
    rango = 1..dimF;
    vector=array[rango] of tviaje;
{inciso a}
procedure leerycargar(var v: vector; var dimL: integer);
          procedure leer(var a: tviaje);
          begin
               writeln('Ingrese la distancia recorrida: ');
               readln(a.dist);
               if(a.dist <> 0) then
               begin
                   writeln('Ingrese el dia: ');
                   readln(a.dia);
                   writeln('Ingrese el monto de dinero transportado: ');
                   readln(a.monto);
               end;
          end;
begin
     dimL:=1;
     leer(v[dimL]);
     while (dimL < dimF) and (v[dimL].dist <> 0) do
     begin
          dimL:=dimL+1;
          leer(v[dimL]);
     end;
end;

{inciso b}
{- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó más dinero.}
procedure b(v:vector; dimL: integer; var montop, distMax: real; var diaMax:dias );
var
   i: integer;
   maxM, cantM: real;
begin
     maxM:=-1;
     for i:=1 to dimL do
     begin
          cantM:=cantM+v[i].monto;
          if(v[i].monto > maxM) then
          begin
               maxM:=v[i].monto;
               distMax:=v[i].dist;
               diaMax:=v[i].dia;
          end;
     end;
     montop:= cantM / dimL;
end;

{inciso c}
{Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km. }
procedure c(var vec:vector; var dimL: integer);
procedure borrar(var v:vector; var dimL: integer; pos: integer);
var i: integer;
begin
    for i:=pos+1 to dimL do v[i-1]:= v[i];
    dimL:=dimL-1;
end;

var
   pos: integer;
begin
   pos:=1;
   while(pos < dimL) do
   begin
        if(vec[pos].dist = 100) then begin
           borrar(vec,dimL,pos);
        end
        else begin
             pos:=pos+1;
        end;
   end;
end;

procedure imprimir(v: vector; dimL: integer);
var i: integer;
begin
     for i:=1 to dimL do writeln(i,') ', v[i].dist:1:2);
end;

var
   dimL: integer;
   v: vector;
   distancia, montoprom: real;
   dia: dias;
begin
     leerycargar(v, dimL);
     b(v, dimL, montoprom, distancia, dia);
     writeln('El promedio de los montos es de: ', montoprom:1:2);
     writeln('La distancia del viaje que mas dinero transporto es: ', distancia:1:2,' en el dia ', dia);
     c(v,dimL);
     imprimir(v,dimL);
     readln;
end.
