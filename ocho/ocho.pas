program ocho;
type
    motivos= 1..7;
    dias = 1..30; meses = 1..11;
    fechas = record
        dia: dias;
        mes: meses;
    end;
    transferencia = record
        nroCOrigen: integer;
        DNI_CO: integer;
        nroCDest: integer;
        DNI_CD: integer;
        fecha: fechas;
        hora: string;
        monto: real;
        codM: motivos;
    end;
    contador = array[motivos] of integer;
    lista = ^nodo;
    nodo = record
        datos: transferencia;
        sig: lista;
    end;

{lo que se dispone}
procedure CrearLista1(var l: lista);
 procedure LeerT(var t: transferencia);
   procedure LeerFecha(var f: fechas);
   begin
    writeln('dia:');readln(f.dia);
    writeln('mes:');readln(f.mes);
   end;
 begin
    writeln('___________________');
    writeln('nro origen:');readln(t.nroCOrigen);
    if(t.nroCOrigen <> -1) then begin
        writeln('dni origen: ');readln(t.DNI_CO);
        writeln('nro dest:');readln(t.nroCDest);
        writeln('dni dest:');readln(t.DNI_CD);
        LeerFecha(t.fecha);
        writeln('hora:');readln(t.hora);
        writeln('monto: ');readln(t.monto);
        writeln('motivo: '); readln(t.codM);
    end;
    writeln('___________________');
 end;
 procedure Agregar(var l: lista; t: transferencia);
 var nue: lista;
 begin 
    new(nue);
    nue^.datos:= t;
    nue^.sig:= l;
    l:= nue;
 end;
 
var t: transferencia;
begin
    LeerT(t);
    while(t.nroCOrigen <> -1) do begin
        Agregar(l, t);
        LeerT(t);
    end;
end;

{modulos}
{inciso a}
procedure CrearLista2(l1: lista; var l2: lista);
 procedure InsertarElemento(var l2: lista; t: transferencia);
 var act, ant, nue: lista;
 begin
    new(nue);
    nue^.datos:= t;
    act:= l2;
    ant:= l2;
    while(act <> nil) and (act^.datos.nroCOrigen < t.nroCOrigen) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(ant = act) then l2:= nue
                  else ant^.sig:= nue;
    nue^.sig:= act;
 end;
begin
    while(l1 <> nil) do begin
        if(l1^.datos.DNI_CO <> l1^.datos.DNI_CD) then InsertarElemento(l2,l1^.datos);
        l1:=l1^.sig;
    end;
end;


{informes}
{inciso c}
procedure Inicializar(var v:contador);
var i: motivos;
begin
    for i:=1 to 7 do v[i]:= 0;
end;
{proceso que compara  y devuelve maximos}
procedure maximo(var max: integer; var maxM: motivos; motivo: motivos; cant: integer);
begin
    if(cant > max)then begin
        max:= cant;
        maxM:= motivo;
    end;
end;

{funcion que retorna el motivo mas utilizado}
function maxMotivo(v: contador): motivos;
var i, maxM: motivos; 
    max: integer;
begin
    max:= 0;
    for i:=1 to 7 do maximo(max,maxM,i,v[i]);
    maxMotivo:= maxM;
end;

{inciso d}
{proceso que descompone un numero contando sus digitos pares e impares}
procedure descomponer(num: integer; var cantI, cantP: integer);
var aux: integer;
begin
    while(num <> 0) do begin
        aux:= num MOD 10;
        if(aux MOD 2 = 0) then cantP:= cantP+1
                          else cantI:= cantI+1;
        num:= num DIV 10;
    end;
end;
{funcion que retorna verdadero si el mes es junio y la cantidad de digitos impares
es mayor a la cantidad de digitos pares}
function cumple(mes: meses; nroDest: integer): boolean;
var cantI, cantP: integer;
begin
    cantI:= 0; cantP:= 0;
    if(mes = 6) and (cantP < cantI) then cumple:= true
                            else cumple:= false;
end;

procedure Informar(l: lista);
var montoT: real;
    v: contador;
    act, cant: integer;
begin
    Inicializar(v);
    cant:= 0; 
    while(l <> nil) do begin
        act:= l^.datos.nroCOrigen;
        montoT:= 0;
        while(l<> nil) and (act = l^.datos.nroCOrigen)  do begin
            montoT:= montoT + l^.datos.monto; {inciso b}
            v[l^.datos.codM]:= v[l^.datos.codM] + 1; {inciso c}
            if(cumple(l^.datos.fecha.mes, l^.datos.nroCDest)) then cant:= cant+1; {inciso d}
            l:=l^.sig;
        end;
        writeln('Para la cuenta: ', act,' el monto total de transferencias es: ', montoT:0:2);
    end;
    writeln('El codigo de motivo más utiliado es: ', maxMotivo(v)); {inciso c}
    writeln('La cantidad de transferencias hechas en Junio con un nro. destinatario con mas digitos impares es: ', cant);
end;

procedure imprimir(l: lista);
begin
    while(l <>nil) do begin
        writeln('Nro: ', l^.datos.nroCOrigen,' y Motivo: ', l^.datos.codM);
        l:= l^.sig;
    end;
end;
var
    L1,L2: lista;
begin
    L1:= nil; L2:= nil;
    CrearLista1(L1); {se dispone}
    CrearLista2(L1, L2); 
    imprimir(L2);
    Informar(L2);
end.
