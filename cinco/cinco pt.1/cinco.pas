{5. Utilizando los módulos implementados en el ejercicio 4, realice un programa que lea números
enteros desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el
número 0. Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del
menor elemento, e informe la operación realizada de la siguiente manera:
“El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el elemento
mínimo ... que se encontraba en la posición ...”}
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
function elementoMax(v: vectorN; dimL:integer):integer;
var aux,i,pos: integer;
begin
     aux:=-1;
     for i:=1 to dimL do
     begin
          if(v[i] > aux) then
          begin
               aux:=v[i];
               pos:=i;
          end;
     end;
     elementoMax:=pos;
end;

{inciso f}
function elementoMin(v: vectorN; dimL:integer):integer;
var aux,i,pos: integer;
begin
     aux:=9999;
     for i:=1 to dimL do
     begin
          if(v[i] < aux) then
          begin
               aux:=v[i];
               pos:=i;
          end;
     end;
     elementoMin:=pos;
end;

procedure imprimir(v:vectorN; dim: integer);
var i:integer;
begin
     for i:=1 to dim do writeln(i,') ', v[i]);
end;

var
   v: vectorN;
   dimL: integer;
begin
     cargar(v,dimL);
     intercambio(elementoMax(v,dimL),elementoMin(v,dimL),v);
     writeln('El elemento máximo ', v[elementoMax(v,dimL)],' que se encontraba en la posición ', elementoMin(v,dimL),' fue intercambiado con el elemento mínimo ',v[elementoMin(v,dimL)],' que se encontraba en la posición ', elementoMax(v,dimL));
     imprimir(v, dimL);
     readln;
end.
