program JugamosConListas;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
var
pri, ult: lista;
valor : integer;
procedure armarNodo(var pri,ult: lista; v: integer);
var  nue : lista;
begin 
new (nue);
nue^.num:= v;
nue^.sig := NIL;
if pri <> Nil then ult^.sig := nue
else pri := nue;
  ult := nue;
end;

procedure imprimir(l:lista);
Begin
    while(l <> nil) do Begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

begin
pri := nil; ult := nil;
writeln('Ingrese un numero');
read(valor);
while (valor <> 0) do begin
armarNodo(pri,ult, valor);
writeln('Ingrese un numero');
read(valor);
end;
imprimir(pri);
end.



