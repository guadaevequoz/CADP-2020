{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de los
usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario se
conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de días desde
el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program trece;

type
    roles= 1..4;
    usuario = record {registro de todos los usuarios}
        email: string;
        rol: roles;
        revista: string;
        ultAcceso: integer;
    end;
    lista = ^nodo;
    nodo = record
        datos: usuario;
        sig: lista;
    end;
    
    vector = array[1..3] of usuario; //se dispone
    contador = array[roles] of integer;

{modulos}

{Modulo de insertar elementos ordenados}
Procedure InsertarElemento (var pri: lista; u: usuario);
var ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := u;
    act := pri;
    ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
while (act<>NIL) and (act^.datos.ultAcceso < u.ultAcceso) do begin
    ant := act;
    act := act^.sig
end;
if (ant = act)  then pri := nue   {el dato va al principio}
                else  ant^.sig  := nue; {va entre otros dos o al final}
nue^.sig := act ;
end;

{no se deben realizar pq se dispone, solo se hace para que funcione}
procedure LeerUsuario(var u:usuario);
begin
    writeln('Ingrese el mail');
    readln(u.email);
    writeln('Ingrese el rol:');
    readln(u.rol);
    writeln('Ingrese la revista:');
    readln(u.revista);
    writeln('Ingrese su ultimo acceso:');
    readln(u.ultAcceso);
    writeln('____________________');
end;

procedure CargarDatos(var v: vector);
var
    i:integer; u:usuario;
begin
    for i:=1 to 3 do begin
        LeerUsuario(u);
        v[i]:= u;
    end;
end;


{maximos}
procedure maxUltAcceso(var max1,max2: integer; var mail1, mail2: string; mail: string; ult: integer);
begin
    if(ult > max1) then begin
        max2:= max1;
        mail2:= mail1;
        max1:= ult;
        mail1:= mail;
    end
    else begin
        if(ult > max2)then begin
            max2:= ult;
            mail2:= mail;
        end;
    end;
end;

{inciso AyB}
procedure incisoAyB(var l:lista; var vc:contador; v:vector; var e1,e2: string);
var i: integer;
    m1,m2: integer;
begin
    m1:=0; m2:=0;
    for i:=1 to 3 do begin
        if(v[i].revista = 'Economica') then InsertarElemento(l, v[i]);
        vc[v[i].rol]:=vc[v[i].rol] + 1;
        maxUltAcceso(m1,m2,e1,e2,v[i].email, v[i].ultAcceso);
    end;
end;

{imprimir}
Procedure Imprimir(l:lista);
begin
    while(l <> nil) do begin
        writeln('El email es: ', l^.datos.email);
        writeln('La cantidad de dias es: ', l^.datos.ultAcceso);
        l:= l^.sig;
    end;
end;

{inicializar vector}
    procedure inicializar(var v:contador);
    var i: roles;
    begin
        for i:=1 to 4 do begin
            v[i]:= 0;
        end;
    end;
    
var
    L:lista;
    v:vector;
    vc: contador;
    m1,m2: string;
    i: integer;
begin
    l:=nil; 
    inicializar(vc);
    CargarDatos(v);
    incisoAyB(L,vc,v,m1,m2);
    Imprimir(L);
    for i:=1 to 4 do writeln('Para el rol ',i,' la cantida de usuarios es de: ', vc[i]);
    writeln(m1,' es el mail del usuario que hace mas tiempo no se conecta y ', m2,' es el del segundo.');
    readln;
end.
