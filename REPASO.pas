program practico;

const dimF = 5;
type
    materias = 1..7;
    codigo = 1..dimF;
    libros = record
        codL: codigo;
        codM: materias;
        titulo: string;
        anioEdicion: integer;
        precioV: real;
        autor: string;
    end;
    
    catalogo = array[codigo] of libros;
    contador = array[materias] of integer;
    {se dispone}
    meses = 1..12; anios = 2010..2020;
    fechas = record
        mes: meses;
        anio: anios;
    end;
    
    ventas = record
        codL: codigo;
        dni: integer;
        fecha: fechas;
    end;
    
    lista = ^nodo;
    nodo = record
        datos: ventas;
        sig: lista;
    end;

{modulos}
procedure CrearListaVentas(var l: lista);
 procedure LeerVenta(var v: ventas);
   procedure LeerFecha(var f: fechas);
   begin
    writeln('Ingrese mes: '); readln(f.mes);
    writeln('Ingrese anio: '); readln(f.anio);
   end;
   
 begin
    writeln('Ingrese el codigo del libro:');
    readln(v.codL);
    if(v.codL <> 5) then begin
        writeln('DNI: '); readln(v.dni);
        LeerFecha(v.fecha);
    end;
 end;
 
 procedure Agregar(var l: lista; v: ventas);
 var nue: lista;
 begin
    new(nue);
    nue^.datos:= v;
    nue^.sig:= l;
    l:= nue;
 end;
 
var v:ventas;
begin
    LeerVenta(v);
    while(v.codL <>  5) do begin
        Agregar(l, v);
        LeerVenta(v);
    end;
end;

procedure LeerYAlmacenar(var c: catalogo);
  procedure LeerLibro(var l: libros);
  begin
    writeln('Ingrese el codigo del libro: '); readln(l.codL);
    writeln('Ingrese el codigo de materia: '); readln(l.codM);
    writeln('Ingrese el titulo: '); readln(l.titulo);
    writeln('Ingrese el anio de edicion: '); readln(l.anioEdicion);
    writeln('Ingrese el precio de venta: '); readln(l.precioV);
    writeln('Ingrese el apellido del autor: '); readln(l.autor);
  end;
  
var i: codigo;
    l: libros;
begin
    for i:=1 to dimF do begin
        LeerLibro(l);
        c[l.codL]:= l;
    end;
end;



procedure CrearContador(l: lista; v: catalogo; var c: contador);
    procedure Inicializar(var c: contador);
    var i: materias;
    begin
        for i:=1 to 7 do c[i]:=0;
    end;
begin
    Inicializar(c);
    while(l <> nil) do begin
        c[v[l^.datos.codL].codM]:= c[v[l^.datos.codL].codM] +1;
        l:= l^.sig;     
    end;
end;

procedure Maximos(var max1,max2: integer; var maxC1, maxC2: materias;
                cant: integer; cod: materias);
begin
    if(cant > max1) then begin
        max2:=  max1;
        maxC2:= maxC1;
        max1:= cant;
        maxC1:= cod;
    end
    else begin
        if(cant > max2) then begin
            max2:= cant;
            maxC2:= cod;
        end;
    end;
end;

procedure IncisoA(l: lista; c: catalogo; var maxC1, maxC2: materias);
var con: contador;
    max1,max2: integer;
    i: integer;
begin
    max1:= 0; max2:= 0;
    CrearContador(l,c,con);
    for i:=1 to 7 do  maximos(max1, max2,maxC1,maxC2,con[i],i);
end;


procedure Descomponer(num: integer; var cantI, cantP: integer);
var aux: integer;
begin
    while(num <> 0) do begin
        aux:= num MOD 10;
        if(aux MOD 2 = 0) then cantP:= cantP+1
            else cantI:= cantI+1;
        num:= num DIV 10;
    end;
end;

function cumple(dni: integer; anio: integer): boolean;
var cantI, cantP: integer;
begin
    cantI:= 0; cantP:= 0;
    Descomponer(dni,cantI, cantP);
    if(cantP = 0) and (anio >= 2011) and (anio <= 2017) then cumple:= true
                else cumple:= false;
    
end;


procedure IncisoB(l:lista; v: catalogo);
begin
    if cumple(l^.datos.dni,v[l^.datos.codL].anioEdicion)
            then writeln(l^.datos.fecha.anio, v[l^.datos.codL].titulo);
end;

var
    L: lista;
    C: catalogo;
    maxC1, maxC2: materias;
begin
    L:= nil;
    CrearListaVentas(L); {se dispone}
    LeerYAlmacenar(C);
    IncisoA(L,C,maxC1, maxC2);
    writeln(maxC1,' es la materia con mas ventas y ', maxC2,' es la segunda.');
    IncisoB(L,C);
end.