{5. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al
espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de meses
que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del espectro
electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar
la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. el nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento)
b. la cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético
c. la cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas
d. el nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.}

program cinco;
type
    categorias = 1..7;
    tsonda = record
        nombre: string;
        duracion: integer; //cant meses
        costoC:real;
        costoM: real;
        rango: categorias;
    end;
    
    lista = ^nodo;
    nodo = record
        sonda: tsonda;
        sig: lista;
    end;
    

{procesos}
procedure leerS(var s: tsonda);
begin
    writeln('Ingrese el nombre:');
    readln(s.nombre);
    if(s.nombre <> 'GAIA') then
    begin
        writeln('Ingrese la duracion de la mision:');
        readln(s.duracion);
        writeln('Ingrese el costo de construccion:');
        readln(s.costoC);
        writeln('Ingrese el costo de mantenimiento:');
        readln(s.costoM);
        writeln('Ingrese el rango:');
        readln(s.rango);
    end;
end;

{agregar elemento}
procedure agregar(var l:lista;s: tsonda);
var aux: lista;
begin
    new(aux);
    aux^.sonda:= s;
    aux^.sig:= l;
    l:= aux;
end;

{crear lista}
procedure crear(var l: lista);
var s:tsonda;
begin
    leerS(s);
    while(s.nombre <> 'GAIA') do begin
        agregar(l,s);
        leerS(s);
    end;
end;

{inciso a}
function maxcosto(l:lista):string;
var suma, maxS: real; 
max: string;
begin
    maxS:= -1;
    while(l <> nil) do 
    begin
        suma:= l^.sonda.costoM + l^.sonda.costoC;
        if(suma > maxS) then begin
            maxS:= suma;
            max:= l^.sonda.nombre;
        end;
        l:=l^.sig;
        suma:=0;
    end;
    maxcosto:= max;
end;

{inciso b}
procedure cants(l: lista);
begin
    while (l <> nil) do begin
        for (i:=1 to 7) do begin
            if(l^.sonda.rango = i) then 
        end;
        if (l^.sonda.rango = 1) then cant1:= cant1+1;
        if (l^.sonda.rango = 2) then cant2:= cant2+1;
        if (l^.sonda.rango = 3) then cant3:= cant3+1;
        if (l^.sonda.rango = 4) then cant4:= cant4+1;
        if (l^.sonda.rango = 5) then cant5:= cant5+1;
        if (l^.sonda.rango = 6) then cant6:= cant6+1;
        if (l^.sonda.rango = 7) then cant7:= cant7+1;
        l:= l^.sig;
    end;
end;

var
    l: lista;
begin
    l:= nil;
    crear(l);
    writeln('La sonda con mayor costo es: ', maxcosto(l));
end.
