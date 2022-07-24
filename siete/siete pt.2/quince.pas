{15. La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial, en la que
corredores de todos los países participantes salen a correr en el mismo momento en distintos puntos del planeta. La
app registra, para cada corredor, el nombre y apellido, la distancia recorrida (en kilómetros), el tiempo (en minutos)
durante el que corrió, el país y la ciudad desde donde partió, y la ciudad donde finalizó su recorrido.
Realizar un programa que permita leer y almacenar toda la información registrada durante la competencia. Una vez
que se han almacenado todos los datos, informar:
a. La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos los corredores.
b. El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de kilómetros recorridos
por los corredores de esa ciudad.
c. La distancia promedio recorrida por corredores de Brasil.
d. La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.
e. El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.}

program quince;

type
    corredor = record
        NomYApe: string;
        distancia: real;
        tiempo: integer;
        pais: string;
        ciudadP: string;
        ciudadF: string;
    end;
    lista = ^nodo;
    nodo = record
        datos: corredor;
        sig: lista;
    end;
    
    
{modulos}
{modulo que agrega adelante de la lista}
Procedure InsertarElemento ( var pri: lista; c:corredor);
var ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := c;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.datos.ciudadP < c.ciudadP) do begin
        ant := act;
        act := act^.sig
    end;
    if (ant = act)  then pri := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

{modulo que crea lista}
procedure CrearLista(var l: lista);

{proceso que lee corredores y solo se utiliza en este modulo}
  procedure LeerCorredor(var c: corredor);
  begin
    writeln('Ingrese nombre y apellido del corredor: ');
    readln(c.NomYApe);
    if(c.NomYApe <> 'z')then begin //fuerzo que deje de cargar cuando se ingresa z
        writeln('Ingrese distancia del corredor: ');
        readln(c.distancia);
        writeln('Ingrese tiempo: ');
        readln(c.tiempo);
        writeln('Ingrese el pais del corredor: ');
        readln(c.pais);
        writeln('Ingrese ciudad de partida: ');
        readln(c.ciudadP);
        writeln('Ingrese ciudad de llegada: ');
        readln(c.ciudadF);
    end;
  end;

var c: corredor;
begin
    LeerCorredor(c);
    while(c.NomYApe <> 'z') do begin
        InsertarElemento(l,c);
        LeerCorredor(c);
    end;
end;

{informes}
procedure totalesAD(l:lista); //incio a
var 
    totalC, totalT: integer;
    totalD: real;
    cantDif: integer;
begin
    totalD:= 0; totalT:= 0; totalC:=0; 
    cantDif:= 0;
    while(l <> nil) do begin
        totalC:=totalC+1; //cuenta los corredores
        totalD:= totalD + l^.datos.distancia; //acumula los kilometros
        totalT:= totalT + l^.datos.tiempo;//acumula el tiempo de carrera
        if(l^.datos.ciudadP <> l^.datos.ciudadF) then cantDif:= cantDif +1; //inciso d, si la ciudad de partida y llegada son diferentes suma 1
        l:=l^.sig;
    end;
    writeln(totalC,' es el total de corredores que participaron.');
    writeln(totalD:0:2,' es el total de kilometros recorridos.');
    writeln(totalT,' es el total de tiempo de carrera de los corredores.');
    writeln(cantDif,' es la cantidad de corredores que comenzaon la carrera en una ciudad y la terminaron en otra.'); //inciso d
end;


{inciso b}
procedure maximo(var max: integer; var maxC: string; var maxK: real; cantC: integer; c_act: string; cantKm: real);
begin
    if (cantC > max) then begin //si la cantidad de corredores ingresad es mayor a la maxima calculada, se actualizan los datos
            max:= cantC;
            maxC:= c_act;
            maxK:= cantKm;
        end;
end;

{inciso c}
procedure cantDistBrasil(pais: string; dist:real; var cantDist: real; var cantPerBrasil: integer);
begin
    if(pais = 'Brasil') then begin       //si el pais ingresado es Brasil acumula las distancias y la cantidad de corredores
        cantDist:= cantDist + dist;
        cantPerBrasil:= cantPerBrasil+1;
    end;
end;

{inciso e}
procedure pasoBoston(ciudad: string; dist: real; tiempo: integer; var paso: real; var cantCorredoresB: integer);
begin
    if(ciudad = 'Boston') then begin     //si la ciudad es Boston realiza el calculo del paso y calculala cantidad de corredores
        paso:= dist * tiempo;
        cantCorredoresB:= cantCorredoresB+1;
    end;
end;

{incisos B, C Y E}
procedure informesBCE(l:lista);
var
    act, maxC: string;
    cantC, max, cantCBrasil, cantCBoston: integer;
    cantKm, maxK, cantKmBrasil, pasosBoston: real;
begin
    max:= 0; maxK:=0;
    cantKmBrasil:= 0; cantCBrasil:= 0;
    pasosBoston:= 0; cantCBoston:=0;
    while(l <> nil) do begin
        cantC:= 0;
        cantKm:= 0;
        act:= l^.datos.ciudadP;
        while (l <> nil) and (act = l^.datos.ciudadP) do begin 
            cantC:= cantC+1;
            cantKm:= cantKm + l^.datos.distancia;
            cantDistBrasil(l^.datos.pais,l^.datos.distancia,cantKmBrasil,cantCBrasil); //inciso c
            pasoBoston(act,l^.datos.distancia,l^.datos.tiempo,pasosBoston,cantCBoston);//inciso E
            l:= l^.sig;
        end;
        maximo(max,maxC,maxK,cantC,act,cantKm); //calculo el inciso B
    end;
    writeln('La ciudad que convoco más corredores es: ', maxC,' y en total recorrieron: ', maxK:0:2,' KMs');
    writeln('La distancia promedio que recorrieron las personas que corrieron en Brasil es de: ', cantKmBrasil/cantCBrasil:0:2);
    writeln('El paso promedio de los corredores de la ciudad de Boston es de: ', pasosBoston/cantCBoston:0:2);
end;

var
    l:lista;
begin
    l:= nil;
    CrearLista(l);
    totalesAD(l);
    informesBCE(l);
    readln;
end.
