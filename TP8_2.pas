program practica;
type
    poliza = 1..6;
    cliente = record
        cod: integer;
        dni: integer;
        apellido: string;
        nombre: string;
        codP: poliza;
        montoB: real;
    end;
    lista = ^nodo;
    nodo = record
        datos: cliente;
        sig: lista;
    end;
    vectorP = array[poliza] of real;

{se dispone} 

procedure CrearVector(var v:vectorP);
begin
    v[1]:= 1000;
    v[2]:= 2000;
    v[3]:= 3000;
    v[4]:= 4000;
    v[5]:= 5000;
    v[6]:= 6000;
end;
{modulos}
procedure LeerCliente(var c:cliente);
begin
    writeln('_____________________');
    writeln('CODIGO: '); readln(c.cod);
    writeln('DNI: '); readln(c.dni);
    writeln('APELLIDO: '); readln(c.apellido);
    writeln('NOMBRE: '); readln(c.nombre);
    writeln('CODIGO POLIZA: '); readln(c.codP);
    writeln('MONTO BASICO: '); readln(c.montoB);
end;
procedure AgregarAdelante(var l:lista; c:cliente);
var nue:lista;
begin
    new(nue);
    nue^.datos:= c;
    nue^.sig:= l;
    l:= nue;
end;

procedure CrearLista(var l:lista);
var c:cliente;
begin
    repeat
        LeerCliente(c);
        AgregarAdelante(l,c);
    until c.cod = 1122;
end;

{inciso b}
function Tiene2Nueve(num:integer): boolean;
var aux, cant9: integer;
begin
    cant9:= 0;
    while(num <> 0) do begin
        aux:= num MOD 10;
        if aux = 9 then cant9:= cant9+1;
        num:= num DIV 10;
    end;
    if cant9 >= 2 then Tiene2Nueve:= true
                else Tiene2Nueve:= false;

end;

procedure RecorrerInformar(l:lista; v:vectorP);
begin
    while(l <> nil) do begin
        {inciso A}
        writeln('CLIENTE');
        writeln('DNI: ', l^.datos.dni);
        writeln('APELLIDO: ', l^.datos.apellido);
        writeln('NOMBRE: ', l^.datos.nombre);
        writeln('MONTO TOTAL: ', l^.datos.montoB + v[l^.datos.codP]);
        
        {inciso B}
        if Tiene2Nueve(l^.datos.dni) then writeln(l^.datos.apellido,' ', l^.datos.nombre,' tiene al menos dos digitos 9 en su DNI.');
        l:= l^.sig;
    end;
end;

procedure Borrar(var l:lista; cod:integer);
var ant, act: lista;
begin
    ant:= l; 
    act:= ant;
    while(act^.datos.cod <> cod) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act = ant) then l:= act^.sig
                  else ant^.sig:= act^.sig;
    dispose(act);
end;

var l:lista;
    v: vectorP;
    cod: integer;
begin
    l:= nil;
    CrearVector(v); //se dispone
    CrearLista(l);
    RecorrerInformar(l,v);
    writeln('Ingrese el codigo del cliente a borrar: '); readln(cod);
    Borrar(l, cod);
end.