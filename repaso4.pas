program practica;
type
    paises=1..20;
    universidades = record
        codU: integer;
        nombre: string;
        codP: paises;
        cantA: integer;
    end;
    
    lista = ^nodo;
    nodo = record
        datos: universidades;
        sig:lista;
    end;
    contador = array[paises] of integer;

procedure LeerUniversidad(var u:universidades);
begin
    writeln('CODIGO UNI:'); readln(u.codU);
    if(u.codU <> 0) then begin
        writeln('NOMBRE: '); readln(u.nombre);
        writeln('CODIGO PAIS: '); readln(u.codP);
        writeln('CANTIDAD ALUMNOS: '); readln(u.cantA);
    end;
end;

procedure AgregarUltimo(var l,ult: lista; u:universidades);
var nue: lista;
begin
    new(nue);
    nue^.datos:= u;
    nue^.sig:= nil;
    if l <> nil then ult^.sig:= nue
                else l:= nue;
    ult:= nue;
end;

procedure CrearLista(var l:lista);
var u:universidades;
    ult: lista;
begin
    ult:= nil;
    LeerUniversidad(u);
    while(u.codU <> 0) do  begin
        AgregarUltimo(l,ult,u);
        LeerUniversidad(u);
    end;
end;

function Encontre567(l:lista): boolean;
begin
    while(l <> nil) and (not Encontre567)do begin
        if(l^.datos.codU = 567) then Encontre567:= true
                                else Encontre567:= false;
        l:= l^.sig;
    end;
end;

procedure IniVec(var c:contador);
var i: paises;
begin
    for i:=1 to 20 do c[i]:= 0;
end;

procedure CargarVector(var c:contador; l:lista);
begin
    while(l <> nil) do begin
        c[l^.datos.codP]:= c[l^.datos.codP] + l^.datos.cantA;
        l:= l^.sig;
    end;
end;

procedure Minimos(var min1,min2:integer; var cod1,cod2:paises; cant: integer; cod: paises);
begin
    if(cant < min1) then  begin
        min2:= min1;
        cod2:= cod1;
        min1:= cant;
        cod1:= cod;
    end
    else begin
        if(cant < min2) then begin
            min2:= cant;
            cod2:= cod;
        end;
    end;
end;

procedure RecorrerYBuscar(l:lista; var c1,c2: paises);
var i: paises;
    min1,min2: integer;
    c: contador;
begin
    min1:= 9999;
    IniVec(c);
    CargarVector(c,l);
    for i:=1 to 20 do Minimos(min1,min2,c1,c2,c[i],i);
end;

var
    l:lista;
    c1,c2: paises;
begin
    l:= nil;
    CrearLista(l);
    if Encontre567(l) then writeln('Se encontró el codigo de uni 567.')
                    else writeln('No se encontro.');
    RecorrerYBuscar(l,c1,c2);
    writeln(c1,' es el pais con menos alumns y ',c2,' el segundo.');
end.