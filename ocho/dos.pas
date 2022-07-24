{2. Implementar un programa que lea y almacene información de clientes de una empresa
aseguradora automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código
de póliza contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando
llega el cliente con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que
el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que
tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga
mensualmente por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de
la estructura.}

program dos;
type
    codPoliza=1..6;
    cliente = record
        codCli: integer;
        dni: integer;
        apellido: string;
        nombre: string;
        codPol: codPoliza;
        montoBasico: real;
    end;
    vector = array[codPoliza] of real; //se dispone
    
    lista = ^nodo;
    nodo = record
        datos: cliente;
        sig: lista;
    end;

{**************** MODULOS ****************}
{proceso que lee los clientes}
procedure LeerCliente(var c:cliente);
begin
    writeln('Ingrese el codigo de cliente: '); readln(c.codCli);
    writeln('Ingrese el DNI del cliente: '); readln(c.dni);
    writeln('Ingrese el apellido: '); readln(c.apellido);
    writeln('Ingrese el nombre: '); readln(c.nombre);
    writeln('Ingrese el codigo de poliza: '); readln(c.codPol);
    writeln('Ingrese el monto basico que abona: '); readln(c.montoBasico);
end;

{proceso de agregar adelante en la tabla}
procedure AgregarAdelante(var l:lista; c: cliente);
var nue: lista;
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
    until (c.codCli = 1122);
end;

{procesos para inciso b}
procedure Descomponer(dni: integer; var Cant9: integer);
var aux: integer;
begin
    while(dni <> 0) do begin
        aux:= dni MOD 10;
        if(aux = 9) then Cant9:= Cant9+1;
        dni:= dni DIV 10;
    end;
end;

function tieneDos9(dni: integer):boolean;
var cant9: integer;
begin
    cant9:= 0;
    Descomponer(dni, cant9);
    if(cant9 >= 2) then tieneDos9:= true
                   else tieneDos9:= false;
end;



{*************** INCISO A Y B *****************}
procedure IncisoAyB(l:lista; v: vector);
begin
    while(l <> nil) do begin
        writeln('Cliente: ');
        writeln('DNI: ', l^.datos.dni);
        writeln('Apellido: ', l^.datos.apellido);
        writeln('Nombre: ', l^.datos.nombre);
        writeln('Monto completo del seguro: ', l^.datos.montoBasico + v[l^.datos.codPol]:0:1);
        if (tieneDos9(l^.datos.dni)) then writeln(l^.datos.apellido,' ', l^.datos.nombre,' tiene al menos dos nueves en su dni.');
        l:= l^.sig;
    end;
end;

{**************** INCISO C ******************}
procedure BorrarElemento (var pri:lista; cod:integer; var exito: boolean);
var ant, act: lista;
begin 
exito := false;
act := pri;
{Recorro mientras no encuentre el elemento}
while (act^.datos.codCli <> cod) do begin
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

{cargar Tabla de precios adicionales de polizas solo para probar si funciona}
procedure CargaTabla(var v:vector);
begin
    v[1]:= 1000;
    v[2]:= 2000;
    v[3]:=  2500;
    v[4]:= 5000;
    v[5]:= 1560;
    v[6]:= 4000;
end;

{************** PROGRAMA PRINCIPAL *****************}
var 
    v: vector;
    l:lista;
    cod_b: integer;
    exito: boolean;
begin
    l:= nil;
    CargaTabla(v);
    CrearLista(l);
    IncisoAyB(l,v);
    writeln('Ingrese un codigo de cliente para eliminar: ');
    readln(cod_b);
    BorrarElemento(l,cod_b,exito);
    if exito then writeln('Se ha borrado el cliente.');
end.
