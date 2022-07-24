{10. Una compa��a de venta de insumos agr�colas desea procesar la informaci�n de las
empresas a las que les provee sus productos. De cada empresa se conoce su c�digo, nombre,
si es estatal o privada, nombre de la ciudad donde est� radicada y los cultivos que realiza (a
lo sumo 20). Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, ma�z, soja,
girasol, etc.), cantidad de hect�reas dedicadas y la cantidad de meses que lleva el ciclo de
cultivo.
a. Realizar un programa que lea la informaci�n de las empresas y sus cultivos. Dicha
informaci�n se ingresa hasta que llegue una empresa con c�digo -1 (la cual no debe
procesarse). Para cada empresa se leen todos sus cultivos, hasta que se ingrese un
cultivo con 0 hect�reas (que no debe procesarse).
Una vez le�da y almacenada la informaci�n, calcular e informar:
b. Nombres de las empresas radicadas en �San Miguel del Monte� que cultivan trigo y
cuyo c�digo de empresa posee al menos dos ceros.
c. La cantidad de hect�reas dedicadas al cultivo de soja y qu� porcentaje representa con
respecto al total de hect�reas.
d. La empresa que dedica m�s tiempo al cultivo de ma�z
e. Realizar un m�dulo que incremente en un mes los tiempos de cultivos de girasol de
menos de 5 hect�reas de todas las empresas que no son estatales.}
program diez;
const dimF = 20;
type
    rango = 1..dimF;
    tcultivo = record
        tipoC: string;
        cantH: integer; //cantidad de hect�reas
        cantM: integer; //cantidad de meses
    end;
    vector = array[rango] of tcultivo;
    empresa = record
        cod: integer;
        nombre: string;
        tipo: string; //estatal o privada
        ciudad: string;
        cantCultivos: rango; //dimL
        cultivos: vector;
    end;
    lista = ^nodo;
    nodo = record
        datos: empresa;
        sig: lista;
    end;

{MODULOS}
{proceso que llena el vector de cultivos}
procedure CrearVector(var v:vector; var dimL: rango);
  {proceso que lee cultivo}
  procedure LeerCultivo(var c: tcultivo);
  begin
    writeln('Ingrese la cantidad de hectareas del cultivo: '); readln(c.cantH);
    if(c.cantH <> 0) then begin
        writeln('Ingrese el tipo de cultivo: '); readln(c.tipoC);
        writeln('Ingrese la cantidad de meses del ciclo: '); readln(c.cantM);
    end;
    writeln('_______________________________________');
  end;
  
var c: tcultivo;
begin
    dimL:= 0;
    LeerCultivo(c);
    while(dimL < dimF) and (c.cantH <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:= c;
        LeerCultivo(c);
    end;
end;
    
procedure CrearLista(var l: lista);
{procesos que se usan SOLO en este modulo}
  procedure LeerEmpresa(var e: empresa);
  begin
    writeln('________________________________________');
    writeln('DATOS DE LA EMPRESA');
    writeln('Ingrese el codigo de la empresa:'); readln(e.cod);
    if(e.cod <> -1) then begin
        writeln('Ingrese el nombre de la empresa:'); readln(e.nombre);
        writeln('Ingrese si es estatal o privada: '); readln(e.tipo);
        writeln('Ingrese la ciudad de la empresa: '); readln(e.ciudad);
        writeln('_________________________________');
        writeln('DATOS DEL CULTIVO:');
        CrearVector(e.cultivos,e.cantCultivos);
    end;
  end;
  
  {proceso de insertar en la lista}
  procedure insertar(var l:lista; e:empresa);
  var nue: lista;
  begin
    new(nue);
    nue^.datos:= e;
    nue^.sig:= l;
    l:= nue;
  end;
  
var e: empresa;
begin
    LeerEmpresa(e);
    while(e.cod <> -1) do begin
        Insertar(l, e);
        LeerEmpresa(e);
    end;
end;

{incisos}
{*******INCISO B ***********}
function Descomponer(num: integer): boolean;
var aux, cant0: integer;
begin
    cant0:= 0;
    while(num <> 0)do begin
        aux:= num MOD 10;
        if (aux = 0) then cant0:=cant0+1;
        num:= num DIV 10;
    end;
    if(cant0 >= 2) then Descomponer:= true
            else Descomponer:= false;
end;

function cumpleA(ciudad: string; tipoC: string;cod: integer):boolean;
begin
    if(ciudad = 'San Miguel Del Monte') and (tipoC = 'Trigo')and (Descomponer(cod)) then cumpleA:= true
            else cumpleA:= false;
end;

{***** INCISO D *****}
procedure maximo(var max: integer; var maxN: string; cant: integer; nom: string);
begin
    if(cant > max) then begin
        max:= cant;
        maxN:= nom;
    end;
end;

{INCISO E}
function cumpleE(tipoC, tipoE: string; cantH: integer):boolean;
begin
    if(tipoC = 'Girasol') and not(tipoE = 'Estatal') and (cantH < 5) then cumpleE:= true
        else cumpleE:= false;
end;

procedure IncrementarE(tipoC, tipoE: string; cantH: integer; var meses: integer);
begin
    if(cumpleE(tipoC, tipoE, cantH)) then meses:= meses + 1;
end;

procedure Informar(l: lista);
var i: rango;
    cantHT, cantHS,max: integer;
    porc: real;
    maxN: string;
begin
    cantHS:= 0; cantHT:= 0; 
    porc:= 0; max:= -1;
    while(l <> nil) do begin
        for i:=1 to l^.datos.cantCultivos do begin
            if(cumpleA(l^.datos.ciudad,l^.datos.cultivos[i].tipoC,l^.datos.cod))
                then writeln('La empresa: ',l^.datos.nombre,' cultiva trigo y radica en SMDM.'); //inciso b
            if(l^.datos.cultivos[i].tipoC = 'Maiz') then maximo(max,maxN,l^.datos.cultivos[i].cantM,l^.datos.nombre); //inciso d
            if(l^.datos.cultivos[i].tipoC = 'Soja') then cantHS:= cantHS + l^.datos.cultivos[i].cantH; //inciso c
            cantHT:= cantHT + l^.datos.cultivos[i].cantH; //inciso c
            IncrementarE(l^.datos.cultivos[i].tipoC,l^.datos.tipo,l^.datos.cultivos[i].cantH, l^.datos.cultivos[i].cantM); {inciso e}
        end;
        l:= l^.sig;
    end;
    porc:= (cantHS * 100) / cantHT; //inciso c
    writeln('La cantidad de hectareas que cultivan soja son: ', cantHS,' y representan un porciento de: ', porc:0:2,'con respecto a todas las hectareas.');
    writeln(maxN,' es la empresa que dedica m�s tiempo al cultivo de ma�z.');
end;


{PROGRAMA PRINCIPAL}
var
    l: lista;
begin
    l:= nil;
    CrearLista(l);
    Informar(l);
    readln;
end.

