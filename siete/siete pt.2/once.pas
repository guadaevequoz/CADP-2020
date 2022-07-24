{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les entregará
el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido, y el promedio obtenido
durante toda su carrera.
Implementar un programa que:
1. Lea la información de los todos egresados, hasta ingresar el código 0, el cual no debe procesarse.
2. Una vez ingresada la información de los egresados, se debe informar el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del
egresado (de mayor a menor):}

program once;

type
    alumno = record
        cod: integer;
        apellido: string;
        prom: real;
    end;
    
    lista = ^nodo;
    nodo = record
        datos: alumno;
        sig: lista;
    end;

{InsertarElemento}
Procedure InsertarElemento ( var l: lista; a:alumno);
var ant, nue, act: lista;
begin
new (nue);
nue^.datos := a;
act := l;
ant := l;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
while (act<>NIL) and (act^.datos.prom > a.prom) do begin
    ant := act;
    act := act^.sig
end;
if (ant = act)  then l := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
nue^.sig := act ;
end;

procedure CrearLista(var l: lista);
    procedure LeerAlumno(var a:alumno);
    begin
        writeln('Ingrese el codigo del alumno:');
        readln(a.cod);
        if(a.cod <> 0) then begin
            writeln('Ingrese el apellido:');
            readln(a.apellido);
            writeln('Ingrese el promedio:');
            readln(a.prom);
        end;
    end;
var max: real;
a: alumno;
begin
    max:= 0;
    LeerAlumno(a);
    while(a.cod <> 0) do begin
        InsertarElemento(l,a);
        LeerAlumno(a);
    end;
end;

procedure Imprimir(l:lista);
begin
    while(l <> nil) do begin
    writeln('El alumno ',l^.datos.apellido,' con el numero ', l^.datos.cod,' ha entrado al programa.');
    l:=l^.sig;
    end;
end;

var
    l:lista;
begin
    CrearLista(l);
    Imprimir(l);
end.
