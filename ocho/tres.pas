{3. Una remiser�a dispone de informaci�n acerca de los viajes realizados durante el mes de mayo de
2018. De cada viaje se conoce: n�mero de viaje, c�digo de auto, direcci�n de origen, direcci�n
de destino y kil�metros recorridos durante el viaje. Esta informaci�n se encuentra ordenada por
c�digo de auto y para un mismo c�digo de auto pueden existir 1 o m�s viajes. Se pide:
a. Informar los dos c�digos de auto que m�s kil�metros recorrieron.
b. Generar una lista nueva con los viajes de m�s de 5 kil�metros recorridos, ordenada por
n�mero de viaje.}

program tres;

type
    viaje = record
          numViaje: integer;
          codAuto: integer;
          dirOrigen: string;
          dirDest: string;
          KM: real;
    end;
    lista = ^nodo;
    nodo = record
        datos: viaje;
        sig: lista;
    end;

{MODULOS}
procedure InsertarOrdenado(var l: lista; v: viaje);
var ant, nue, act: lista;
begin
new (nue);
nue^.datos := v;
act := l;
ant := l;
{Recorro mientras no se termine la lista y no encuentro la posici�n correcta}
while (act<>NIL) and (act^.datos.numViaje < v.numViaje) do begin
    ant := act;
    act := act^.sig
end;
if (ant = act)  then l := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
nue^.sig := act ;
end;

procedure maximos(cantKM: real; var max1,max2: real; var cod1,cod2: integer; codigo: integer);
begin
    if(cantKM > max1) then begin
        max2:= max1;
        cod2:= cod1;
        max1:= cantKM;
        cod1:= codigo;
    end
    else begin
        if(cantKM > max2) then begin
            max2:= cantKM;
            cod2:= codigo;
        end;
    end;
end;

procedure IncisoAyB(l:lista; var l2: lista; var cod1,cod2: integer);
var cantKM, max1,max2: real;
    act: integer;
begin
    max1:= 0;
    while(l<>nil) do begin
        cantKM:= 0;
        act:= l^.datos.codAuto;
        while(l <> nil) and (act = l^.datos.codAuto) do begin
            cantKm:= cantKm + l^.datos.KM; //inciso act
            if(l^.datos.KM > 5) then InsertarOrdenado(l2,l^.datos);
            l:= l^.sig;
        end;
        maximos(cantKm,max1,max2,cod1,cod2,act);
    end;
end;



var
   L,L2: lista; //se dispone
   c1,c2: integer;
begin
     L:= nil; L2:= nil;
     CrearLista(L); //se dispone
     IncisoA(L,c1,c2,L2);
     writeln(c1,' es el codigo de auto que realizo mas KM y ', c2,' es el segundo.');
end.
