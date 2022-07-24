{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos los
dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android instalada, el
tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La información
disponible se encuentra ordenada por versión de Android.
Realizar un programa que procese la información disponible de todos los dispositivos e informe:
a. la cantidad de dispositivos para cada versión de Android
b. la cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas
c. el tamaño promedio de las pantallas de todos los dispositivos}

program doce;
    
type
    versiones = 'A'..'P';
    celular = record
        version: versiones;
        tamanio: real;
        RAM: integer;
    end;
    vector = array[versiones] of integer;
    lista = ^nodo;
    nodo = record
        datos: celular;
        sig: lista;
    end;
    
    
{InsertarElemento}
Procedure InsertarElemento (var l: lista; c:celular);
var ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := c;
    act := l;
    ant := l;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
while (act<>NIL) and (act^.datos.version < c.version) do begin
    ant := act;
    act := act^.sig
end;
if (ant = act)  then l := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
nue^.sig := act ;
end;

procedure CrearLista(var l: lista);
    procedure LeerAlumno(var c:celular);
    begin
        writeln('Ingrese la version de Android:');
        readln(c.version);
        if(c.version <> 'Z') then begin
            writeln('Ingrese el tamaño de pantalla:');
            readln(c.tamanio);
            writeln('Ingrese la cantidad de RAM:');
            readln(c.RAM);
        end;
        writeln('____________________');
    end;
var
    c: celular;
begin
    LeerAlumno(c);
    while(c.version <> 'Z') do begin
        InsertarElemento(l,c);
        LeerAlumno(c);
    end;
end;

{incisos}
function incisoB(ram: integer; pantalla:real):boolean;
begin
    if(ram >= 3) and (pantalla <= 5) then incisoB:= true
        else incisoB:=false;
end;

procedure incisos(l:lista);
    {inicializar}
    procedure inicializar(var v:vector);
    var i: versiones;
    begin
        for i:='A' to 'N' do begin
            v[i]:= 0;
        end;
    end;

var i: versiones;
    cantD,c: integer;
    prom: real;
    v:vector;
begin
    cantD:= 0; 
    prom:= 0; c:=0;
    inicializar(v);
    while(l <> nil) do begin
        v[l^.datos.version]:= v[l^.datos.version] + 1;
        
        {b. la cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas}
        if(incisoB(l^.datos.ram,l^.datos.tamanio)) then cantD:=cantD+1;
        
        {el tamaño promedio de las pantallas de todos los dispositivos}
        prom := prom+ l^.datos.tamanio;
        c:= c+1;
        l:= l^.sig;
    end;
    for i:='A' to 'N' do writeln('Para la version: ', i,' la cantidad de dispositivos es de: ',v[i]);
    writeln(cantD,'es la cantidad de dispositivos con mas de 3 GB y pantallas de a lo sumo 5 pulgadas.');
    writeln('El tamaño promeio de pantallas es de: ', prom/c:1:2);
end;


var 
    l: lista;
begin
    l:=nil;
    CrearLista(l);
    incisos(l);
end.
