{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1:
estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto
(1..7), nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y
año de su descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos
los datos.
B. Una vez leída y almacenada toda la información, se pide calcular e informar:
I. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
II. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
III. La cantidad de objetos observados por cada categoría.
IV. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.}
program seis;
type
    categorias= 1..7;
    objeto = record
        cod: integer;
        categoria: categorias;
        nombre: string;
        dist: real;
        nomDesc: string;
        anioDesc: integer;
    end;
    lista = ^nodo;
    nodo = record
        datos: objeto;
        sig: lista;
    end;
    contador = array[categorias] of integer;
{modulos}
procedure CrearLista(var l: lista);
 procedure LeerObjeto(var o: objeto);
 begin
  writeln('______________________________________');
  writeln('Ingrese el codigo: '); readln(o.cod);
  if(o.cod <> -1) then begin
    writeln('Ingrese la categoria: '); readln(o.categoria);
    writeln('Ingrese el nombre: '); readln(o.nombre);
    writeln('Ingrese la distancia: '); readln(o.dist);
    writeln('Ingrese el nombre del descubridor: '); readln(o.nomDesc);
    writeln('Ingrese el año del descubrimiento: '); readln(o.anioDesc);
    writeln('______________________________________');
  end;
 end;
 
 procedure AgregarAlFinal (var pri, ult: lista; o:objeto); 
 var  nue : lista;
 begin 
 new (nue);
 nue^.datos:= o;
 nue^.sig := NIL;
 if pri <> Nil then ult^.sig := nue
 else pri := nue;
  ult := nue;
 end;
var
    ult: lista;
    o: objeto;
begin
    ult:= nil;
    LeerObjeto(o);
    while(o.cod <> -1) do begin
        AgregarAlFinal(l,ult, o);
        LeerObjeto(o);
    end;
end;

{********* INCISO B, 1 **********}
procedure Maximos(var max1,max2: real; var maxCod1, maxCod2: integer; cod: integer; dist: real);
begin
    if(dist  > max1) then begin
        max2:= max1;
        maxCod2:= maxCod1;
        max1:= dist;
        maxCod1:= cod;
    end
    else begin
        if(dist > max2) then begin
            max2:= dist;
            maxCod2:= cod;
        end;
    end;
end;

{******* INCISO B,2 ***********}
function Galileo1600(descubridor: string; anio: integer; categoria: categorias): boolean;
begin
    if(descubridor = 'Galileo Galilei') and (anio < 1600) and (categoria = 2) then Galileo1600:= true
        else Galileo1600:= false;
end;

{****** inciso 3,2 *********}
procedure Inicializar(var v: contador);
var i: integer;
begin
    for i:=1 to 7 do v[i]:=0;
end;

procedure Imprimir(v:contador);
var i: integer;
begin
    for i:=1 to 7 do  writeln('La cantidad de objetos de la categoria ', i,' es de: ', v[i]);
end;

{****** inciso b,4 *********}
function cumple(cod: integer; categoria: categorias): boolean;
var aux, cantP, cantI: integer;
begin
    cantI:= 0; cantP:= 0;
    cumple:= false;
    if(categoria = 4) then begin
        while(cod <> 0) do begin
            aux:= cod MOD 10;
            if( aux MOD 2 = 0) then cantP:= cantP+1
                else cantI:= cantI+1;
            cod:= cod DIV 10;
        end;
        if(cantP > cantI) then cumple:= true
            else cumple:= false;
    end;
end;

{proceso que recorre e informe}
procedure Informar(l: lista);
var 
    max1, max2: real;
    maxCod1, maxCod2, CantG: integer;
    v: contador;
begin
    max1:= 0; CantG:= 0;
    Inicializar(v);
    while(l <> nil) do begin
        Maximos(max1,max2,maxCod1,maxCod2, l^.datos.cod, l^.datos.dist);
        if( Galileo1600(l^.datos.nomDesc, l^.datos.anioDesc, l^.datos.categoria)) then CantG:= CantG + 1;
        v[l^.datos.categoria]:= v[l^.datos.categoria] + 1;
        if(cumple(l^.datos.cod, l^.datos.categoria)) then writeln(l^.datos.nombre,' esta estrella posee más digitos pares que impares.');
        l:=l^.sig;
    end;
    writeln(maxCod1,' es el codigo del objeto más alejado de la tierra y ', maxCod2,' es el segundo.');
    writeln(CantG,' es la cantidad de planetas descubiertos por Galileo Galilei antes del año 1600.');
    Imprimir(v);
end;


var 
    L: lista;
begin
    L:= nil; 
    CrearLista(L);
    Informar(L);
end.
