 {3. Se dispone de un vector con n�meros enteros, de dimensi�n f�sica dimF y dimensi�n l�gica dimL.
a. Realizar un m�dulo que imprima el vector desde la primera posici�n hasta la �ltima.
b. Realizar un m�dulo que imprima el vector desde la �ltima posici�n hasta la primera.
c. Realizar un m�dulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera
posici�n, y desde la mitad m�s uno hacia la �ltima posici�n.
d. Realizar un m�dulo que reciba el vector, una posici�n X y otra posici�n Y, e imprima el
vector desde la posici�n X hasta la Y. Asuma que tanto X como Y son menores o igual a
la dimensi�n l�gica. Y considere que, dependiendo de los valores de X e Y, podr�a ser
necesario recorrer hacia adelante o hacia atr�s.
e. Utilizando el m�dulo implementado en el inciso anterior, vuelva a realizar los incisos a,
b y c.
}

program tres;
const dimF = 6;
type
    rango = 1..dimF;
    vectorN = array[rango] of integer;

procedure cargar(var v: vectorN; var dimL: integer);
var num: integer;
begin
     dimL:=0;
     writeln('Ingrese un entero.');
     readln(num);
     while(dimL < dimF) do
     begin
          dimL:=dimL+1;
          v[dimL]:= num;
          writeln('Ingrese un entero.');
          readln(num);
     end;
end;

{inciso a}
procedure priAUlti(dimL: integer; v: vectorN);
var
   i: integer;
begin
     writeln('Primer al ultimo numero:');
     for i:=1 to dimL do writeln('Posicion ', i,') ', v[i]);
end;

{inciso b}
procedure ultiAPri(dimL: integer; v: vectorN);
var i: integer;
begin
     writeln('Ultimo al primer numero:');
     for i:= dimL downto 1 do writeln('Posicion ', i,') ', v[i]);
end;

{inciso c}
{Realizar un m�dulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera
posici�n, y desde la mitad m�s uno hacia la �ltima posici�n.}
procedure mitad(dimL: integer; v: vectorN);
var i,aux: integer;
begin
     aux:= dimL DIV 2;
     writeln('Mitad al primer numero:');
     for i:= aux downto 1 do writeln('Posicion ', i,') ', v[i]);
     writeln('Mitad mas uno hasta el ultimo numero:');
     for i:=aux+1 to dimL do writeln('Posicion ', i,') ', v[i]);
end;

{inciso d}
{d. Realizar un m�dulo que reciba el vector, una posici�n X y otra posici�n Y, e imprima el
vector desde la posici�n X hasta la Y. Asuma que tanto X como Y son menores o igual a
la dimensi�n l�gica. Y considere que, dependiendo de los valores de X e Y, podr�a ser
necesario recorrer hacia adelante o hacia atr�s.}
procedure xy(x,y: integer; v: vectorN);
var i:integer;
begin
     if(x > y) then
     begin
          for i:=x downto y do writeln('Posicion ', i,') ', v[i]);
     end
     else begin
          for i:=x to y do writeln('Posicion ', i,') ', v[i]);
     end;
end;


var
   v: vectorN;
   dimL,x, y: integer;
begin
     cargar(v,dimL);
     writeln('_____________________________');
     priAUlti(dimL, v);
     writeln('_____________________________');
     ultiAPri(dimL, v);
     writeln('_____________________________');
     mitad(dimL, v);
     writeln('_____________________________');
     writeln('Ingrese una posicion del vector: ');
     readln(x);
     writeln('Ingrese otra posici�n: ');
     readln(y);
     xy(x,y,v);
     writeln('_____________________________');
     {inciso e}
     writeln('Inciso D en A');
     xy(1,6,v);
     writeln('Inciso D en B');
     xy(6,1,v);
     writeln('Inciso D en C');
     xy((dimL DIV 2),1,v);
     xy((dimL DIV 2 +1), dimL, v);
     readln;
end.
