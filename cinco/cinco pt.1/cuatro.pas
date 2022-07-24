{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion : dado un número X y el vector de números, retorna la posición del número X
en dicho vector, o el valor -1 en caso de no encontrarse.
b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna
el mismo vector donde se intercambiaron los valores de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector
f. elementoMinimo: retorna la posicion del menor elemento del vector}
program cuatro;

const dimF = 100;
type
    rango = 1..dimF;
    vectorN = array[rango] of integer;

procedure crear(var v: vectorN);
var i: integer;
begin
     for i:=1 to dimF do v[i]:=abs(random(100));
end;

{inciso a}
{posicion : dado un número X y el vector de números, retorna la posición del número X
en dicho vector, o el valor -1 en caso de no encontrarse.}
procedure posicion(num: integer; v: vectorN);
var dim: integer; exito: boolean;
begin
     dim:=0;
    exito:=false;
    while(not exito) and (dim < dimF) do
    begin
         dim:=dim+1;
        if(num = v[dim]) then exito:=true
               else exito:= false;

    end;
    if(exito) then writeln('El numero ', num,' esta en la posicion ', dim)
              else writeln('-1');
end;

{inciso b}
{b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna
el mismo vector donde se intercambiaron los valores de las posiciones x e y.}
procedure intercambio(x,y: integer; var v: vectorN);
var aux: integer;
begin
     aux:=v[x];
     v[x]:=v[y];
     v[y]:=aux;
end;
{imprimir vector}
procedure imprimir(v:vectorN);
var i:integer;
begin
     for i:=1 to dimF do writeln(i,') ', v[i]);
end;

{inciso c}
{c. sumaVector: retorna la suma de todos los elementos del vector.}
function sumaVector(v:vectorN): integer;
var i,aux: integer;
begin
     aux:=0;
    for i:=1 to dimF do aux:=aux+v[i];
    sumaVector:=aux;
end;

{inciso d}
function promedio(suma: integer):real;
begin
     promedio:=suma/dimF;
end;

{inciso e}
function elementoMax(v: vectorN):integer;
var aux,i,pos: integer;
begin
     aux:=-1;
     for i:=1 to dimF do
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
function elementoMin(v: vectorN):integer;
var aux,i,pos: integer;
begin
     aux:=9999;
     for i:=1 to dimF do
     begin
          if(v[i] < aux) then
          begin
               aux:=v[i];
               pos:=i;
          end;
     end;
     elementoMin:=pos;
end;

var
   v: vectorN;
   num,x,y: integer;
begin
     crear(v);
     writeln('Ingrese un numero.');
     readln(num);
     posicion(num,v);
     writeln('Ingrese una posicion para intercambiar:');
     readln(x);
     writeln('Ingrese otra:');
     readln(y);
     intercambio(x,y,v);
     imprimir(v);
     writeln('La suma del vector es: ', sumaVector(v));
     writeln('El valor promedio de los elementos del vector es: ', promedio(sumaVector(v)):1:2);
     writeln('El elemento maximo del vector es: ', elementoMax(v));
     writeln('El elemento minimo del vector es: ', elementoMin(v));
     readln;
end.
