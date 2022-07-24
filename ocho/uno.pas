{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La
lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede
no existir.}

program uno;

type 
    codGenero= 1..5;
    actores = record
        dni: integer;
        ApeYNom: string;
        edad: integer;
        cod: codGenero;
    end;
    
    lista = ^nodo;
    nodo = record
        datos: actores;
        sig: lista;
    end;
    codigos = array[codGenero] of integer; //array contador de los codigos de genero que prefieren los actores

{*********************** MODULOS ***********************}
{proceso que agrega adelante en la lista}
Procedure AgregarAdelante (var L:lista; a:actores);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:=a;
  nue^.sig:=L;
  L:=nue;
End;

{proceso que lee actores}
procedure LeerActores(var a:actores);
begin
    writeln('__________________________');
    writeln('Ingrese el DNI del actor:');
    readln(a.dni);
    writeln('Ingrese el nombre y apellido:');
    readln(a.ApeYNom);
    writeln('Ingrese la edad:');
    readln(a.edad);
    writeln('Ingrese el codigo de genero: ');
    readln(a.cod);
end;

{proceso que crea la lista}
procedure CrearLista(var L: lista; var v: codigos);
var 
    a:actores;
begin
    repeat
        v[a.cod]:= v[a.cod] + 1;
        AgregarAdelante(L,a);
        LeerActores(a);
    until (a.dni = 0);
end;

{proceso que cuenta los pares e impares}
procedure cantPyI(var cantI,cantP:integer; dni: integer);
var
    aux: integer;
begin
    while (dni <> 0) do begin
        aux:= dni mod 10;
        if ((aux mod 2) = 0) then cantP:= cantP + 1
            else  cantI:= cantI + 1;
        dni:= dni div 10;
    end;
end;

function MasPares(dni:integer):boolean; //devuelve true si hay mas pares que impares
var cantI, cantP: integer;
begin
    cantP:= 0;
    cantI:= 0;
    cantPyI(cantI, cantP, dni); //llama al proceso que devuelve la cantidad de pares e impares
    if(cantP > cantI)then MasPares:= true
                    else MasPares:= false;
end;

{**************** INCISO A ******************}
procedure incisoA(l:lista);
var 
    cantP: integer;
begin
    cantP:= 0;
    while(l <> nil) do begin
        if(MasPares(l^.datos.dni)) then cantP:= cantP+1; //si el  dni tiene mas pares que impares suma una persona
        l:= l^.sig;
    end;
    writeln('________________________________');
    writeln('La cantidad de personas cuyo DNI tiene más digitos pares que impares es de: ',cantP);
end;

{**************** INCISO B ******************}
procedure incisoB(v:codigos);
var
    i, cod1, cod2, max1, max2: integer;
begin
    max1:=0;
    for i:=1 to 5 do begin
        if(v[i] > max1) then begin
            max2:= max1;
            cod2:= cod1;
            max1:= v[i];
            cod1:= i;
        end
        else begin
            if (v[i] > max2) then begin
                max2:= v[i];
                cod2:= i;
            end;
        end;
    end;
    writeln('________________________________');
    writeln(cod1,' es el codigo de genero más elegido y ', cod2,' es el segundo.');
end;

{**************** INCISO C ******************}
procedure BorrarElemento (var pri:lista; dni:integer; var exito: boolean);
var ant, act: lista;
begin 
exito := false;
act := pri;
{Recorro mientras no se termine la lista y no encuentre el elemento}
while  (act <> NIL)  and (act^.datos.dni <> dni) do begin
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



{incializar vector}
procedure Inicializar(var v:codigos);
var i: integer;
begin
    for i:=1 to 5 do v[i]:=0;
end;


{***************** PROGRAMA PRINCIPAL ********************}
var 
    L: lista;
    V: codigos;
    exito: boolean;
    dni_b: integer;
begin
    L:= nil;
    Inicializar(V);
    CrearLista(L,V);
    incisoA(L);
    incisoB(V);
    BorrarElemento(L, dni_b,exito);
    writeln('________________________________');
    writeln('Ingrese un DNI a eliminar: '); readln(dni_b);
    if exito then writeln('El dni: ', dni_b,' se ha eliminado correctamente.')
             else writeln('El dni: ', dni_b,' no esta en la lista.');
end.
