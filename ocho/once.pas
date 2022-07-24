{11. Realizar un programa para una empresa productora que necesita organizar 100 eventos
culturales. De cada evento se dispone la siguiente información: nombre del evento, tipo de evento
(1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad
máxima de personas permitidas para el evento y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada
venta se debe guardar: código de venta, número de evento (1..100), DNI del comprador y
cantidad de entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos
pares que impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad
máxima de personas permitidas.}
program once;

const max = 3;
type 
    eventos = 1..5;
    rango = 1..3;
    evento = record
        nombre: string;
        tipo: eventos;
        lugar: string;
        maxPersonas: integer;
        costoE: real;
    end;
    vectorE = array[rango] of evento;
    
    venta = record
        cod: integer;
        numEvento: rango;
        dni: integer;
        cantEntradas:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos: venta;
        sig: lista;
    end;

{se dispone}
procedure CrearVector(var v: vectorE);
  procedure LeerEvento(var e:evento);
  begin
   writeln('Ingrese el nombre: '); readln(e.nombre);
   writeln('Ingrese el tipo de evento:'); readln(e.tipo);
    writeln('Ingrese el lugar: '); readln(e.lugar);
    writeln('Ingrese la cantidad maxima de personas: '); readln(e.maxPersonas);
    writeln('Ingrese el costo de la entrada: '); readln(e.costoE); 
  end;
 var i: rango;
    e: evento;
begin
    for i:=1 to max do begin
        LeerEvento(e);
        v[i]:= e;
    end;
end;

{modulos}
procedure CrearLista(var l: lista);
  procedure LeerVenta(var v: venta);
  begin
    writeln('Ingrese el codigo de la venta: '); readln(v.cod);
    if(v.cod <> -1) then begin
        writeln('Ingrese el numero de evento:'); readln(v.numEvento);
        writeln('Ingrese el DNI del comprador: '); readln(v.dni);
        writeln('Ingrese la cantidad de entradas: '); readln(v.cantEntradas);
    end;
  end;
  procedure InsertarAdelante(var l: lista; v: venta);
  var nue: lista;
  begin
    new(nue);
    nue^.datos:= v;
    nue^.sig:= l;
    l:= nue;
  end;

var 
    v:venta;
begin
    LeerVenta(v);
    while(v.cod <> -1) do begin
        InsertarAdelante(l,v);
        LeerVenta(v);
    end;
end;

{INCISOS}
procedure Minimos(var min1,min2: real; var minN1, minN2: string; var minL1,minL2: string;
                    cant: real; nom: string; lugar: string);
begin
    if(cant < min1) then 
    begin
        min2:= min1;
        minN2:= minN1;
        minL2:= minL1;
        min1:= cant;
        minN1:= nom;
        minL1:= lugar;
    end
    else begin
        if(cant < min2)then begin
            min2:= cant;
            minN2:= nom;
            minL2:=  lugar;
        end;
    end;
end;

function cumple(dni:integer; tipo: eventos): boolean;
  procedure descomponer(num: integer; var cantP, cantI: integer);
  var aux: integer;
  begin
    while(num <> 0) do begin
        aux:= num MOD 10;
        if(aux MOD 2 = 0) then cantP := cantP +1
                        else cantI:= cantI+1;
        num:= num DIV 10;
    end;
  end;

var cantP,cantI: integer;
begin
    cantP:= 0; cantI:= 0;
    descomponer(dni,cantP,cantI);
    if(cantP > cantI) and (tipo = 3) then cumple:= true
    else cumple:= false;
end;

{c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad
máxima de personas permitidas.}
procedure Informar(l:lista; v:vectorE);
var min1,min2, coste: real;
    minN1,minN2: string;
    minL1,minL2: string;
    cantE: integer;
    incisoC: boolean;
begin
    min1:= 9999;
    cantE:= 0;
    incisoC:= false;
    while(l <> nil) do begin
        coste:= l^.datos.cantEntradas * v[l^.datos.numEvento].costoE;
        Minimos(min1,min2,minN1,minN2,minL1,minL2, coste,
                v[l^.datos.numEvento].nombre,v[l^.datos.numEvento].lugar); //inciso a
        if(cumple(l^.datos.dni, v[l^.datos.numEvento].tipo)) then cantE:= cantE + l^.datos.cantEntradas; //inciso b
        if(l^.datos.numEvento = 3) and (v[l^.datos.numEvento].maxPersonas = l^.datos.cantEntradas) then incisoC:= true; 
        l:= l^.sig;
    end;
    writeln(minN1,' en ', minL1,' fue el evento con menos recaudación. Y ', minN2,' en ', minL2,' el segundo.');
    writeln(cantE, 'es la cantidd de entradas vendidas para obras de teatro cuyo dni del comprador tiene mas pares e impares.');
    if(incisoC) then writeln('La cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de personas permitidas.');
end;


var l: lista;
    v: vectorE;
begin
    l:= nil;
    CrearVector(v); {se dispone}
    CrearLista(l);
    Informar(l,v);
end.
