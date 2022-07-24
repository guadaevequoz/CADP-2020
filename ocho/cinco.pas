program cinco;
type
    rango = 1..100;
    cadena20 = string[20];
    
    camiones = record
        patente: integer;
        añoFabricacion: integer;
        capacidad: real;
    end;
    vectorCamiones = array[rango] of camiones;
    
    viajes = record
        codViaje: integer;
        codCamion: rango;
        distancia: real;
        ciudadDest: cadena20;
        año: integer;
        DNI_C: integer;
    end;
    
    lista = ^nodo;
    nodo = record
        datos: viajes;
        sig: lista;
    end;
{MODULOS}
procedure CargarLista(var l: lista);
  {leer viaje}
  procedure LeerViaje(var v: viajes);
  begin
    writeln('Ingrese el codigo del viaje: '); readln(v.codViaje);
    if(v.codViaje <> -1) then begin
        writeln('Ingrese el codigo del camion: '); readln(v.codCamion);
        writeln('Ingrese la distancia del viaje: '); readln(v.distancia);
        writeln('Ingrese la ciudad de destino: '); readln(v.ciudadDest);
        writeln('Ingrese el año en que se realizó el viaje: '); readln(v.año);
        writeln('Ingrese el DNI del chofer: '); readln(v.DNI_C);
    end;
  end;
  {agregar a la lista}
  procedure AgregarAdelante(var l: lista; v: viajes);
  var aux: lista;
  begin
    new(aux);
    aux.datos:= v;
    aux.sig:= l;
    l:= aux;
  end;
var v: viajes;
begin
    LeerViaje(v);
    while(v.codViaje <> -1) do begin
        AgregarAdelante(l,v);
        LeerViaje(v);
    end;
end;

{incisos}
{maximo y minimo del inciso A}
procedure MaxyMin(var maxKm, minKm: real; var maxPat, minPat: integer; cantKm: real; patente: integer);
begin
    if(cantKm > maxKm) then
    begin
        maxKm:= cantKm;
        maxPat:= patente;
    end;
    
    if(cantKm < minKm) then
    begin
        minKm:= cantKm;
        minPat:=  patente;
    end;
end;

{boolean del inciso B}
function CapacidadYAnti(capacidad: real; antiguedad: integer): boolean;
begin
    if(capacidad > 30.5) and (antiguedad > 5) then CapacidadYAnti:= true;
        else CapacidadYAnti:= false;
end;

{boolean inciso c}
function DNIImpar(dni: integer):boolean;
var aux, cantI, cantP: integer;
begin
    while(dni <> 0) do
    begin
        aux:= dni MOD 10;
        if(aux MOD 2 <> 0) then cantI:= cantI+1
            else cantP:= cantP+1;
        dni:= dni DIV 10;
    end;
    if(cantP = 0) then DNIImpar:= true;
                else DNIImpar:= false;
end;

procedure Informar(l: lista; v: vectorCamiones);
var maxKm, minKm, cantKM: real;
    maxPat, minPat, cantCumplen, antiguedad: integer;
    CamionActual: rango;
begin
    maxKm:= -1; minKm:= 9999;
    cantCumplen:= 0;
    while(l <> nil) do begin
        CamionActual:= l^.datos.codCamion;
        cantKM:= 0;
        while(l <> nil) and (CamionActual = l^.datos.codCamion) do begin
            cantKM:= cantKM + l^.datos.distancia;
            antiguedad:= l^.datos.año -  v[CamionActual].añoFabricacion;
            if (CapacidadYAnti(v[CamionActual].capacidad,antiguedad)) then cantCumplen:= cantCumplen+1;
            if(DNIImpar(v[CamionActual].dni)) then writeln(l^.datos.codViaje,' el chofer que realizo este viaje tiene solo digitos impares en su DNI.');
            l:= l^.sig;
        end;
        MaxYMin(maxKm,minKm,maxPat,minPat,cantKM,v[CamionActual].patente);
        writeln(maxPat,' es la patente del camion que más kilometros posee y ', minPat,' es la que menos posee.');
        writeln(cantCumplen,'es la cantidad de viajes cuyos camiones superaban la capacidad de 30,5 toneladas y tenian más de 5 años de antiguedad.')
    end;
end;

var
    V: vectorCamiones;
    L: lista;
begin
    CargarFlota(V);
    CargarLista(L);
    Informar(L,V);
end.
