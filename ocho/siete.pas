{7. La Facultad de Inform�tica desea procesar la informaci�n de los alumnos que finalizaron la
carrera de Analista Programador Universitario. Para ello se deber� leer la informaci�n de cada
alumno, a saber: n�mero de alumno, apellido, nombres, direcci�n de correo electr�nico, a�o de
ingreso, a�o de egreso y las notas obtenidas en cada una de las 24 materias que aprob� (los
aplazos no se registran).
1. Realizar un m�dulo que lea y almacene la informaci�n de los alumnos hasta que se ingrese el
alumno con n�mero de alumno -1, el cual no debe procesarse. Las 24 notas
correspondientes a cada alumno deben quedar ordenadas de forma descendente.
2. Una vez le�da y almacenada la informaci�n del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo n�mero de alumno est� compuesto
�nicamente por d�gitos impares.
c. El apellido, nombres y direcci�n de correo electr�nico de los dos alumnos que m�s
r�pido se recibieron (o sea, que tardaron menos a�os)
3. Realizar un m�dulo que, dado un n�mero de alumno le�do desde teclado, lo busque y
elimine de la estructura generada en el inciso 1. El alumno puede no existir.}
program siete;
const dimF = 4;
type 
    rango = 1..dimF;
    cadena20 = string[20];
    cadena50 = string[50];
    vNotas = array[rango] of real;
    alumno = record
        nroAlumno: integer;
        apellido: cadena20;
        nombre: cadena20;
        mail: cadena50;
        anioIn: integer;
        anioEg: integer;
        notas: vNotas;
    end;
    lista = ^nodo;
    nodo = record
        datos: alumno;
        sig: lista;
    end;

{modulos}
procedure CrearLista(var l:lista);
Procedure InsertarElemOrd (var v: vNotas;  var dimL: rango;elem : real);
  Function BuscarPosicion (x: real;  v:vNotas; dimL: rango): rango;
     var pos : rango;
    begin
      pos:=1;
      while (pos<=dimL) and (x > v[pos]) do 
         pos:=pos+1;
      BuscarPosicion:= pos;
    end;
    Procedure Insertar (var v:vNotas; var dimL:rango; pos: rango; elem:real);
    var j: rango;
    begin
        for j:= dimL downto pos do 
            v [ j +1 ] := v [ j ] ;
        v [ pos ] := elem; 
        dimL := dimL + 1;
    End;
var pos: rango;
Begin
   if (dimL < dimF)
   then begin
          pos:= BuscarPosicion (elem, v, dimL);
          Insertar (v, dimL, pos, elem);
        end;
end;

{leo alumno}
procedure LeerAlumno(var a:alumno);
var i,dimL: rango; nota: real;
begin
    dimL:= 0;
    writeln('Ingrese el numero del alumno: '); readln(a.nroAlumno);
    if(a.nroAlumno <> -1) then begin
        writeln('Ingrese el apellido del alumno: '); readln(a.apellido);
        writeln('Ingrese el nombre del alumno: '); readln(a.nombre);
        writeln('Ingrese el mail del alumno: '); readln(a.mail);
        writeln('Ingrese el a�o de ingreso del alumno: '); readln(a.anioIn);
        writeln('Ingrese el a�o del egreso del alumno: '); readln(a.anioEg);
        for i:=1 to dimF do begin
            dimL:= dimL+1;
            writeln('Ingrese una nota: '); readln(nota);
            InsertarElemOrd(a.notas,dimL,nota);
        end;
    end;
end;

{AgregarAdelante}
procedure AgregarAdelante(var l: lista; a:alumno);
var aux: lista;
begin
    new(aux);
    aux^.datos:= a;
    aux^.sig:= l;
    l:= aux;
end;   

var a: alumno;
begin
    LeerAlumno(a);
    while(a.nroAlumno <> -1)do begin
        AgregarAdelante(l,a);
        LeerAlumno(a);
    end;
end;

{procedure imprimir(l:lista);
var i:rango;
begin
    while(l <> nil) do begin
        writeln('El alumno: ',l^.datos.nombre);
        writeln('Sus notas:');
        for i:=1 to dimF do begin
            writeln(l^.datos.notas[i]:0:2);
        end;
        l:= l^.sig;
    end;
end;}

{INCISOS}
{******inciso 2,a******}
function promedio(v: vNotas): real;
var i: rango;
    suma: real;
begin
    suma:=0;
    for i:=1 to dimF do suma:= suma + v[i];
    promedio:= suma / dimF;
end;

{******inciso 2,b******}
function cumple2012Impar(nro: integer; anioIn: integer): boolean;
var aux, cantP: integer;
begin
    cantP:=0;
    cumple2012Impar:= false;
    if(anioIn = 2012) then begin
        while(nro <> 0) do begin
            aux:= nro MOD 10;
            if(aux MOD 2 = 0) then cantP:= cantP +1;
            nro:= nro DIV 10;
        end;
        if(cantP = 0) then cumple2012Impar:= true
                else cumple2012Impar:= false;
    end;
end;

{inciso 2,c}
procedure maximos(var max1, max2:integer; var maxN1, maxN2, maxA1, maxA2: cadena20;
                  var maxM1, maxM2: cadena50; cant: integer; nom, ape: cadena20; mail: cadena50);
begin
    if(cant < max1) then
    begin
        max2:= max1;
        maxN2:= maxN1; 
        maxA2:= maxA1;
        maxM2:= maxM1;
        max1:= cant;
        maxN1:= nom;
        maxA1:= ape;
        maxM1:= mail;
    end
    else begin
        if(cant < max2) then begin
            max2:= cant;
            maxN2:= nom;
            maxA2:= ape;
            maxM2:= mail;
        end;
    end;
end;

procedure informar(l:lista);
var cant2012I,cantAnios,max1,max2: integer;
    maxN1, maxN2, maxA1, maxA2: cadena20;
    maxM1, maxM2: cadena50;
begin
    cant2012I:=0; max1:=999;
    while(l<> nil) do begin
        writeln('El promedio del alumno ', l^.datos.nombre,'es: ',promedio(l^.datos.notas):0:2); {inciso 2,a}
        if(cumple2012Impar(l^.datos.nroAlumno, l^.datos.anioIn)) then cant2012I:= cant2012I +1; {inciso 2,b}
        cantAnios:= l^.datos.anioEg - l^.datos.anioIn;
        maximos(max1,max2,maxN1,maxN2,maxA1,maxA2,maxM1,maxM2,cantAnios,l^.datos.nombre,l^.datos.apellido,l^.datos.mail);
        l:= l^.sig;
    end;
    writeln(cant2012I,' es la cantidad de alumnos ingresantes en el a�o 2012 con su numero compuesto solo de impares.');
    writeln('El alumno: ',maxN1,' ', maxA1,' con mail: ', maxM1,' fue el que termino la carrer en menos tiempo.');
    writeln('El alumno: ',maxN2,' ', maxA2,' con mail: ', maxM2,' fue el segundo que termino la carrer en menos tiempo.');
end;

{inciso 3}
Procedure BorrarElemento (var pri:lista; nro: integer; var exito: boolean);
var ant, act: lista;
begin 
exito := false;
act := pri;
{Recorro mientras no se termine la lista y no encuentre el elemento}
while  (act <> NIL)  and (act^.datos.nroAlumno <> nro) do begin
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

var l:lista;
    nro: integer;
    exito: boolean;
begin
    l:= nil;
    CrearLista(l);
    //imprimir(l);
    informar(l);
    writeln('Ingrese el numero de alumno que desee eliminar:');
    readln(nro);
    BorrarElemento(l, nro, exito);
    if exito then writeln('El alumno se elimin�.')
            else  writeln('No existe el alumno.');
end.
