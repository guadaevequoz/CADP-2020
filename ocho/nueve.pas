{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por
las críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello
se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se
lee: DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La
lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por
código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos
pares que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).}
program nueve;
type
    generos = 1..8;
    peliculas = record
        codP: integer;
        titulo: string;
        codGenero: generos;
        puntajeProm: real;
    end;
    contador = array[generos] of real;
    listaP = ^nodoP;
    nodoP = record
        datos: peliculas;
        sig: listaP;
    end;
    
    critica = record
        DNI_C:integer;
        apeYnom: string;
        codP: integer;
        puntaje: real;
    end;
    
    listaC = ^nodoC;
    nodoC = record
        datos: critica;
        sig: listaC;
    end;

{se dispone}
procedure CrearLista1(var l:listaP);
 procedure LeerPelicula(var p:peliculas);
 begin
    writeln('Ingrese el codigo de pelicula: '); readln(p.codP);
    if(p.codP <> -1) then begin
        writeln('Ingrese el titulo: '); readln(p.titulo);
        writeln('Ingrese el codigo de genero: '); readln(p.codGenero);
        writeln('Ingrese el puntaje promedio: '); readln(p.puntajeProm);
    end;
 end;
 
 procedure InsertarAdelante(var l:listaP; p: peliculas);
 var nue: listaP;
 begin
    new(nue);
    nue^.datos:= p;
    nue^.sig:=l;
    l:= nue;
 end;
var p: peliculas;
begin
    LeerPelicula(p);
    while(p.codP <> -1) do begin
        InsertarAdelante(l,p);
        LeerPelicula(p);
    end;
end;

{modulos}
procedure CrearLista2(var l:listaC);
 procedure LeerCritica(var c: critica);
 begin
    writeln('Ingrese el codigo de pelicula: '); readln(c.codP);
    if(c.codP <> -1) then begin
        writeln('Ingrese el DNI del critico: '); readln(c.DNI_C);
        writeln('Ingrese el nombre y apellido del critico: '); readln(c.apeYnom);
        writeln('Ingrese el puntaje: '); readln(c.puntaje);
    end;
 end;
 
 procedure Insertar(var l:listaC; c:critica);
 var act, ant, nue:listaC;
 begin
    new(nue);
    nue^.datos:= c;
    act:= l;
    ant:= l;
    while(act <> nil) and (act^.datos.codP < c.codP) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(ant = act) then l:= nue
                  else ant^.sig:= nue;
    nue^.sig:= act;
 end;
var
    c: critica;
begin
    LeerCritica(c);
    while(c.codP <> -1) do begin
        Insertar(l, c);
        LeerCritica(c);
    end;
end;
procedure BuscarYCambiar(var l1: listaP; totalPuntaje: real; codP: integer);
var aux: listaP;
begin
    new(aux);
    aux:= l1;
    while(aux <> nil) and (codP <> aux^.datos.codP) do begin
                 aux:= aux^.sig;
        end;
    aux^.datos.puntajeProm:= (aux^.datos.puntajeProm  + totalPuntaje)/2;
    dispose(aux);
end;

procedure maximo(v: contador; var max: real; var maxC:generos);
var i: generos;
begin
     for i:=1 to 8 do begin
         if(v[i] > max) then begin
             max:= v[i];
             maxC:= i;
             end;
     end;
end;
{modulo que saca promedio y reemplaza}
procedure Actualizar(var l1: listaP; l2: listaC; var v:contador; var maxC: generos);
var c: integer;
    totalPuntaje: real;
    act: integer;
    max: real;
begin
     max:= 0;
    while(l2 <> nil) do begin
        act:= l2^.datos.codP;
        totalPuntaje:= 0;
        c:= 0;
        while(l2 <> nil) and (act = l2^.datos.codP) do begin
            totalPuntaje:= totalPuntaje + l2^.datos.puntaje;
            v[l1^.datos.codGenero]:= v[l1^.datos.codGenero] + l2^.datos.puntaje;
            c:= c+1;
            l2:= l2^.sig;
        end;
        maximo(v, max, maxC);
        totalPuntaje:= totalPuntaje / c;
        BuscarYCambiar(l1, totalPuntaje, act);
    end;
end;



procedure Inicializar(var v: contador);
var i: generos;
begin  
    for i:=1 to 8 do v[i]:=0;
end;
{
procedure InformarB(l1: listaP);
var v: contador;
    max: real;
    maxC: generos;
begin
    Inicializar(v);
    max:= -1;
    while(l1 <> nil) do begin
        v[l1^.datos.codGenero]:= v[l1^.datos.codGenero] + l1^.datos.puntajeProm;
        l1:= l1^.sig;
    end;
    maximo(v, max, maxC);
    writeln('El codigo de genero que obtuvo mejor puntaje es: ', maxC);
end;   }

{inciso c}
{Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos
pares que impares en su DNI.}
procedure Descomponer(num: integer; var cantI, cantP: integer);
var aux: integer;
begin
    while(num <> 0) do begin
        aux:= num MOD 10;
        if(aux MOD 2 = 0) then cantP:=cantP+1
                        else cantI:= cantI+1;
        num:= num DIV 10;
    end;
end;

function cumple(dni: integer): boolean;
var cantI,cantP: integer;
begin  
    cantI:= 0; cantP:= 0;
    Descomponer(dni, cantI,cantP);
    if(cantP = cantI)then cumple:= true
            else cumple:= false;
end;

procedure InformarC(l2: listaC);
begin
    while(l2 <> nil)do begin
        if(cumple(l2^.datos.DNI_C)) then writeln('El critico: ', l2^.datos.apeYnom,' tiene la misma cantidad de digitos pares que impares.');
        l2:= l2^.sig;
    end;
end;

procedure BorrarPelicula(var l1: listaP; cod: integer; exito:boolean);
var act, ant: listaP;
begin
    exito:= false;
    act:= l1;
    while(act <> nil) and (cod <> act^.datos.codP) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil) then begin
     exito:= true;
     if (act = l1) then  l1 := act^.sig
                else  ant^.sig:= act^.sig;
     dispose (act);
    end;
end;

procedure imprimir(l1: listaP; l2: listaC);
begin
    while(l1 <> nil) do begin
        writeln('PELICULA. ');
        writeln(l1^.datos.codP); writeln(l1^.datos.titulo); writeln(l1^.datos.puntajeProm);
        l1:= l1^.sig;
    end;
    while(l2 <> nil) do begin
        writeln('CRITICO:');
        writeln(l2^.datos.codP); writeln(l2^.datos.puntaje);
        l2:= l2^.sig;
    end;
end;
var
    l1:listaP;
    l2:listaC;
    v: contador;
    exito: boolean;
    cod: integer;
    maxC: generos;
begin
    l1:= nil; l2:= nil;
    maxC:= 0;
    CrearLista1(l1); {se dispone}
    CrearLista2(l2);
    Inicializar(v);
    Actualizar(l1, l2,v,maxC);
    writeln('El codigo de genero que obtuvo mejor puntaje es: ', maxC);
    imprimir(l1,l2);
    InformarC(l2);
    writeln('Ingrese el codigo de pelicula que desea eliminar:'); readln(cod);
    BorrarPelicula(l1,cod, exito);
    if(exito) then writeln('La pelicula se elimino.');
end.
