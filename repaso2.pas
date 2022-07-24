program practica;

const max = 10;
type
    codigo = 1..max;
    categorias = 1..4;
    pelicula = record
        titulo: string;
        duracion: integer; 
        categoria: categorias;
    end;
    vectorP = array[codigo] of pelicula;
    
    espectadores = record
        dni:integer;
        apeYNom: string;
        codP: codigo;
    end;
    lista = ^nodo;
    nodo = record
        datos: espectadores;
        sig: lista;
    end;
    contador = array[categorias] of integer;
    
    lista2 = ^nodo2;
    nodo2 = record
        datos: string;
        sig: lista2;
    end;

procedure CrearVector(var v: vectorP);
begin
    v[1].titulo:= 'Lo que el viento se llevo';
    v[1].duracion:= 90;
    v[1].categoria:= 1;
    v[2].titulo:= 'Avatar';
    v[2].duracion:= 120;
    v[2].categoria:= 3;
    v[3].titulo:= 'Los tres chiflados';
    v[3].duracion:= 85;
    v[3].categoria:= 2;
end;

procedure InsertarUltimo(var l,ult: lista; e: espectadores);
  var nue: lista;
  begin
    new(nue);
    nue^.datos:= e;
    nue^.sig:= nil;
    if(l <> nil) then ult^.sig:= nue
                else l:= nue;
    ult:= nue;
  end;
  
  procedure LeerDatos(var e:espectadores);
  begin
    writeln('DNI: '); readln(e.dni);
    if(e.dni <> -1) then begin
        writeln('Apellido y nombre: '); readln(e.apeYNom);
        writeln('Codigo de pelicula: '); readln(e.codP);
    end;
  end;
  
  
procedure CargarLista(var l: lista);
var e: espectadores;
    ult: lista;
begin
    ult:= nil;
    LeerDatos(e);
    while(e.dni <> -1) do begin
        InsertarUltimo(l,ult,e);
        LeerDatos(e);
    end;
end;

{MODULOS}
procedure IniCon(var c: contador);
var i: categorias;
begin
    for i:=1 to 4 do c[i]:= 0;    
end;

procedure maximos(var max1, max2: integer; var maxC1, maxC2: categorias;
                    cant: integer; cat: categorias);
begin
    if(cant > max1) then begin
        max2:= max1;
        maxC2:= maxC1;
        max1:= cant;
        maxC1:= cat;
    end
    else begin
        if(cant > max2) then begin
            max2:= cant;
            maxC2:= cat;
        end;
    end;
end;
procedure RecorroContador(c: contador; var maxC1, maxC2: categorias);
var i: categorias;
    max1, max2: integer;
begin
    max1:= -1;
    for i:=1 to 4 do maximos(max1,max2,maxC1,maxC2,c[i], i);
end;

function SoloPares(num: integer): boolean;
var aux, cantI, cantP: integer;
begin
    cantP:= 0; cantI:= 0;
    SoloPares:= false;
    while(num <> 0) do begin
        aux:= num MOD 10;
        if(aux MOD 2 = 0) then cantP:= cantP+1
            else cantI:= cantI +1;
        num:= num DIV 10;
    end;
    if(cantP > 0) and (cantI = 0) then SoloPares:= true
        else SoloPares:= false;
end;

procedure AgregarAdelante(var l:lista2; elem: string);
var nue: lista2;
begin
    new(nue);
    nue^.datos:= elem;
    nue^.sig:= l;
    l:= nue;
end;

procedure Informar(cantE: integer; cat1, cat2: categorias);
begin
    writeln(cantE,' es la cantidad de espectadores que miraron peliculas de al menos 90 minuts.');
    writeln(cat1,' es la categoria mas vista y ', cat2,' es la segunda mas vista.');
end;

procedure RecorrerLista(l:lista; v:vectorP; var l2: lista2);
var cantEspectadores: integer;
    c: contador;
    maxC1, maxC2: categorias;
begin
    IniCon(c);
    cantEspectadores:= 0;
    while(l <> nil) do begin
        if (v[l^.datos.codP].duracion >= 90) then cantEspectadores:= cantEspectadores+1; 
        c[v[l^.datos.codP].categoria]:= c[v[l^.datos.codP].categoria]+1;
        if(SoloPares(l^.datos.dni)) then AgregarAdelante(l2,l^.datos.apeYNom);
        l:= l^.sig;
    end;
    RecorroContador(c, maxC1,maxC2);
    Informar(cantEspectadores,maxC1,maxC2);
end;

{inciso c}
procedure Borrar(var l:lista; dni: integer; var exito: boolean);
var act, ant: lista;
begin
    exito:= false;
    act:= l;
    while(act <> nil) and (act^.datos.dni <> dni) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil)then begin
        exito:= true;
        if(ant = act) then l:= act^.sig
                    else ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

var 
    P: vectorP;
    L:lista;
    L2: lista2;
    exito: boolean;
    dni: integer;
begin
    CrearVector(P); {se dispone}
    L:= nil; L2:= nil;
    CargarLista(L); //inciso a
    RecorrerLista(L, P, L2); //inciso b
    writeln('Ingrese el DNI del espectador que desea eliminar: '); readln(dni);
    Borrar(L, dni, exito);
    if exito then writeln('Se elimino.')
        else writeln('No esta en la lista.');
end.