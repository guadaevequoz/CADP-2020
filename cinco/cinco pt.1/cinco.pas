{5. Utilizando los m�dulos implementados en el ejercicio 4, realice un programa que lea n�meros
enteros desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el
n�mero 0. Al finalizar la carga, se debe intercambiar la posici�n del mayor elemento por la del
menor elemento, e informe la operaci�n realizada de la siguiente manera:
�El elemento m�ximo ... que se encontraba en la posici�n ... fue intercambiado con el elemento
m�nimo ... que se encontraba en la posici�n ...�}
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
     writeln('El elemento m�ximo ', v[elementoMax(v,dimL)],' que se encontraba en la posici�n ', elementoMin(v,dimL),' fue intercambiado con el elemento m�nimo ',v[elementoMin(v,dimL)],' que se encontraba en la posici�n ', elementoMax(v,dimL));
     imprimir(v, dimL);
     readln;
end.
