{10. Una empresa de sistemas est� desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un n�mero (que
es el siguiente al �ltimo n�mero entregado). El cliente quedar� esperando a ser llamado por su n�mero, en cuyo caso
sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el m�dulo RecibirCliente, que recibe como par�metro el DNI del cliente y la lista de clientes en
espera, asigna un n�mero al cliente y retorna la lista de espera actualizada.
c. Implementar el m�dulo AtenderCliente, que recibe como par�metro la lista de clientes en espera, y retorne el
n�mero y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista de
espera.
d. Implementar un programa que simule la atenci�n de los clientes. En dicho programa, primero llegar�n todos los
clientes juntos, se les dar� un n�mero de espera a cada uno de ellos, y luego se los atender� de a uno por vez. El
ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

program diez;
type
    lista = ^nodo;
    persona = record
        dni:integer;
        numEspera: integer;
    end;
    nodo = record
        p: persona;
        sig: lista;
    end;

var
    ult: lista;
{inciso a}    
procedure agregarAtras(var pri,ult: lista; p: persona);
var  nue : lista;
begin 
    new (nue);
    nue^.p:= p;
    nue^.sig := NIL;
    if pri <> Nil then ult^.sig := nue
            else pri := nue;
    ult := nue;
end;

{inciso b}
procedure RecibirCliente(var l:lista; dni: integer);
var p: persona;
begin
    p.dni:= dni;
    p.numEspera:= p.numEspera+1;
    agregarAtras(l, ult, p);
end;

{inciso c}
procedure AtenderCliente(var l:lista);
begin
    while(l <> nil) do begin
        writeln(l^.p.dni,' es el DNI del cliente a ser atendido y su numero de espera es ', l^.p.dni);
        l := l^.sig;
    end;
end;

{imprimir}
procedure imprimir(l:lista);
Begin
    while(l <> nil) do Begin
        writeln(l^.p.dni);
        writeln(l^.p.numEspera);
        writeln('________');
        l:= l^.sig;
    end;
end;

var
    l: lista;
    c,i,dni: integer;
begin
    l:= nil; 
    c:= 0; 
    writeln('Ingrese el DNI del cliente');
    readln(dni);
    while(dni <> 0) do begin
        RecibirCliente(l,dni);
        c:= c+1;
        writeln('Ingrese el DNI del proximo cliente');
        readln(dni);
    end;
    imprimir(l);
    for i:=0 to c do AtenderCliente(l);
end.
