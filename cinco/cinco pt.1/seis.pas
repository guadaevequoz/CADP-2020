{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento
máximo y otra para el mínimo), implementar un único módulo que recorra una única vez el vector y
devuelva ambas posiciones.}
program cinco;

const dimF = 100;
type
    rango = 1..dimF;
    vectorN = array[rango] of integer;

procedure cargar(var v: vectorN; var dim: integer);
var num: integer;
begin
     dim:=0;
     writeln('Ingrese un valor');
     readln(num);
     while (dim < dimF) and (num <> 0) do
     begin
          dim:=dim+1;
          v[dim]:=num;
          writeln('Ingrese un valor');
          readln(num);
     end;
end;

procedure intercambio(x,y: integer; var v: vectorN);
var aux: integer;
begin
     aux:=v[x];
     v[x]:=v[y];
     v[y]:=aux;
end;

{inciso e}
procedure elementoMaxYMin(v: vectorN; dimL:integer; var Pmax, Pmin: integer);
var aux1, aux2,i: integer;
begin
     aux1:=-1; aux2:=9999;
     for i:=1 to dimL do
     begin
          if(v[i] > aux1) then
          begin
               aux1:=v[i];
               Pmax:=i;
          end;
          if(v[i] < aux2) then
          begin
               aux2:=v[i];
               Pmin:=i;
          end;
     end;
end;

procedure imprimir(v:vectorN; dim: integer);
var i:integer;
begin
     for i:=1 to dim do writeln(i,') ', v[i]);
end;

var
   v: vectorN;
   dimL, PosMax, PosMin: integer;
begin
     cargar(v,dimL);
     elementoMaxYMin(v,dimL,PosMax, PosMin);
     intercambio(PosMax,PosMin,v);
     writeln('El elemento máximo ', v[PosMin],' que se encontraba en la posición ', PosMax,' fue intercambiado con el elemento mínimo ',v[PosMax],' que se encontraba en la posición ', PosMin);
     imprimir(v, dimL);
     readln;
end.
