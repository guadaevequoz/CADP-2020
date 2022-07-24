{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a alumnos de
la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por una muestra de
1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 y 1300), día del mes,
Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren
universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más de un medio de
transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de datos
apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

program catorce;

type
    cadena = string[20];
    medios = 1..5;
    dias = 1..30;
    viaje = record
        cod: integer;
        dia: dias;
        facultad: cadena;
        medio: medios;
    end;

    lista = ^nodo;
    nodo = record
        datos: viaje;
        sig: lista;
    end;
    
    vector = array[1..5] of real;
    
{modulos}
{modulo de agregar adelante en la lista}
Procedure AgregarAdelante (var L:lista; v:viaje);
Var nue:Lista;
Begin
  New(nue);
  nue^.datos:=v;
  nue^.sig:=L;
  L:=nue;
End;

{creacion de lista}
procedure CrearLista(var l:lista);
 {proceso leer que SOLO se usa dentro de este modulo}
 procedure LeerViaje(var v: viaje);
 begin
    writeln('Ingrese el codigo del alumno: ');
    readln(v.cod);
    if(v.cod <> -1) then begin
        writeln('Ingrese el dia del mes del viaje realizado:');
        readln(v.dia);
        writeln('Ingrese la facultad del alumno: ');
        readln(v.facultad);
        writeln('Ingrese el medio utilizado: ');
        readln(v.medio);
    end;
 end;
var 
    v: viaje;
begin
    LeerViaje(v);
    while(v.cod <> -1) do begin
        AgregarAdelante(l,v);
        LeerViaje(v);
    end;
end;

function cantGasto(medio: medios):integer;
begin
    if(medio = 1) then cantGasto:= 20;
    if(medio = 2) then cantGasto:= 50;
    if(medio = 3) then cantGasto:= 12;
    if(medio = 4) then cantGasto:= 17;
end;
{inciso a}
procedure Informar(l: lista; var cant6,cant80: integer);
var act,cantV: integer;
    sumaGastos: integer;
begin
    while(l <> nil) do begin
        cantV:=0;
        sumaGastos:= 0;
        act:= l^.datos.cod;   
        while (act = l^.datos.cod) and (l <> nil) do begin
            cantV:= cantV+1;
            sumaGastos:= sumaGastos + cantGasto(l^.datos.medio);
            l:= l^.sig;
            act:= l^.datos.cod;
        end;
        if (cantV >= 6) then cant6:= cant6+1;
        if (sumaGastos > 80) then cant80 := cant80+1;
    end;
end;


var 
    l: lista;
    cant6,cant80: integer;
begin
    l:= nil;
    cant6:= 0; cant80:= 0;
    CrearLista(l);
    Informar(l,cant6,cant80);
    writeln('La cantidad de alumnos que realizan más de 6 viajes al dia es de: ', cant6);
    writeln('La cantidad de alumnos que gastan mas de 80 pesos por dia es de: ', cant80);
end.
