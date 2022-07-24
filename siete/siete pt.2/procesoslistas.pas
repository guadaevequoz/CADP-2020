//imprimir lista
procedure imprimir(l:lista)
Begin
    while(l <> nil) do Begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

//AgregarAdelante
Procedure AgregarAdelante (var L:lista; per:persona);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:=per;
  nue^.sig:=L;
  L:=nue;
End;

//agregar al final
procedure AgregarAlFinal2 (var pri, ult: lista; per: persona); 
var  nue : lista;
begin 
new (nue);
nue^.datos:= per;
nue^.sig := NIL;
if pri <> Nil then ult^.sig := nue
else pri := nue;
  ult := nue;
end;

//borrar elemento de la lista
Procedure BorrarElemento (var pri:lista; nom:cadena50; var exito: boolean);
var ant, act: lista;
begin 
exito := false;
act := pri;
{Recorro mientras no se termine la lista y no encuentre el elemento}
while  (act <> NIL)  and (act^.datos.nom <> nom) do begin
    ant := act;
    act := act^.sig;
end;   
if (act <> NIL) then begin
    exito := true; 
    if (act = pri) then  pri := act^.sig
                else  ant^.sig:= act^.sig;
    dispose (act);
    end;
end;

//insertar elemento ordenado
Procedure InsertarElemento ( var pri: lista; per: persona
var ant, nue, act: lista;
begin
new (nue);
nue^.datos := per;
act := pri;
ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
while (act<>NIL) and (act^.datos.nombre < per.nombre) do begin
    ant := act;
    act := act^.sig
end;
if (ant = act)  then pri := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
nue^.sig := act ;
end;

//busqueda de elemento
function buscar (pri: lista; x:cadena50):boolean;
Var encontre : boolean
begin
encontre := false;
while (pri <> NIL) and (not encontre) do
   if x = pri^.datos.nom  then encontre:= true
                        else pri:= pri^.sig;
    buscar := encontre;
End;
