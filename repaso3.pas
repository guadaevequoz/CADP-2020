program practica;
type
    provincias = 1..23;
    estancias = record
        codE: integer; 
        localidad: string;
        codP: provincias;
        cantGanado: integer;
    end;
    lista=^nodo;
    nodo = record
        datos: estancias;
        sig: lista;
    end;
    contador = array[provincias] of integer;
    
{modulos}
procedure LeerEstancia(var e:estancias);
begin
    writeln('CODIGO ESTANCIA: '); readln(e.codE);
    if(e.codE <> 0) then begin
        writeln('LOCALIDAD: '); readln(e.localidad);
        writeln('CODIGO PROVINCIA: '); readln(e.codP);
        writeln('CANT CABEZAS DE GANADO:'); readln(e.cantGanado);
    end;
end;

procedure AgregarAdelante(var l:lista; e:estancias);
var nue: lista;
begin
    new(nue);
    nue^.datos:= e;
    nue^.sig:= l;
    l:= nue;
end;

procedure CrearLista(var l:lista);
var e: estancias;
begin
    LeerEstancia(e);
    while(e.codE <> 0) do begin
        AgregarAdelante(l,e);
        LeerEstancia(e);
    end;
end;

function Encontre234(l:lista):boolean;
var encontre: boolean;
begin
    while(l <> nil) and (not encontre) do begin
        if(l^.datos.codE = 234) then encontre:= true
                            else encontre:= false;
        l:= l^.sig;
    end;
    Encontre234:= encontre;
end;

procedure IniVector(var c:contador);
var i: provincias;
begin
    for i:=1 to 23 do c[i]:= 0;
end;

procedure CargarVector(var c:contador; l:lista);
begin
    while(l<> nil) do begin
        c[l^.datos.codP]:= c[l^.datos.codP] + l^.datos.cantGanado;
        l:= l^.sig;
    end;
end;

procedure Maximos(var max1,max2:integer; var maxC1,maxC2: provincias;
                    codP:provincias; cant: integer);
begin
    if(cant > max1) then begin
        max2:= max1;
        maxC2:= maxC1;
        max1:= cant;
        maxC1:= codP;
    end
    else begin
        if(cant > max2)then begin
            max2:= cant;
            maxC2:= codP;
        end;
    end;
end;

procedure RecorrerYEvaluar(l:lista; var maxC1,maxC2:provincias);
var c:contador;
    i: provincias;
    max1,max2: integer;
begin
    max1:= -1;
    IniVector(c);
    CargarVector(c,l);
    for i:=1 to 23 do maximos(max1,max2,maxC1,maxC2,i,c[i]);
end;

var 
    l:lista;
    maxC1,maxC2: provincias;
begin
    l:= nil;
    CrearLista(l);
    if(Encontre234(l))then writeln('Se encuentra almacenada la estancia con codigo 234.')
                   else writeln('No existe la estancia con el codigo234.');
    RecorrerYEvaluar(l,maxC1,maxC2);
    writeln(maxC1,' es el codigo de provincia con mayor cantidad de cabezas de ganado y ', maxC2,' es la segunda.');
end.
