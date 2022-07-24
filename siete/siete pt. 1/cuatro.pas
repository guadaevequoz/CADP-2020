program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
    end;
var
   pri: lista;
   valor, v: integer;


procedure armarNodo(var L: lista; v: integer);
var
   aux : lista;
begin
     new(aux);
     aux^.num := v;
     aux^.sig := L;
     L := aux;
end;


procedure imprimir(L: lista);
begin
     while(L<> nil) do
     begin
	    writeln(abs(L^.num));
	    L:= L^.sig;
     end;
end;

function maximo(l: lista):integer;
var max: integer;
begin
     max:= -1;
     while(l <> nil) do
     begin
          if(l^.num > max) then max:= l^.num;
          l:= l^.sig;
     end;
     maximo:= max;
end;

function minimo(l: lista):integer;
var min: integer;
begin
     min:= 9999;
     while(l <> nil) do
     begin
          if(l^.num < min) then min:= l^.num;
          l:= l^.sig;
     end;
     minimo:= min;
end;

procedure multiplos(l: lista; v: integer);
begin
    while(l <> nil) do
     begin
          if((l^.num MOD v) = 0) then writeln(l^.num,' es multiplo de ', v);
          l:= l^.sig;
     end;
end;


begin
     pri := nil;
     writeln('Ingrese un numero');
     read(valor);
     while (valor <> 0) do begin
           armarNodo(pri, valor);
           writeln('Ingrese un numero');
           read(valor);
     end;
imprimir(pri);
writeln('El numero maximo es: ', maximo(pri));
writeln('El numero minimo es: ', minimo(pri));
writeln('Ingrese un valor');
readln(v);
multiplos(pri,v);
readln;
end.


