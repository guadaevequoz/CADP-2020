{10. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente información:
título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios.
Realizar un programa que lea y almacene esta información. Una vez finalizada la lectura, el programa
debe procesar los datos e informar:
-Título de la foto más vista (la que posee mayor cantidad de clics)
-Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
-Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
program diez;
const dimF = 3;
type
    str = string[20];
    rango = 1..dimF;

    fotos = record
          titulo:str;
          autor: str;
          mgs: integer;
          clicks: integer;
          com: integer;
    end;

    vector = array[rango] of fotos;

procedure cargar(var v: vector);
procedure leerF(var f: fotos);
begin
     writeln('Ingrese el titulo: ');
     readln(f.titulo);
     writeln('Ingrese el autor: ');
     readln(f.autor);
     writeln('Ingrese cantidad de me gustas: ');
     readln(f.mgs);
     writeln('Ingrese cantidad de clicks: ');
     readln(f.clicks);
     writeln('Ingrese cantidad de comentarios: ');
     readln(f.com);
end;

var i: integer;
begin
    for i:=1 to dimF do
    begin
         leerF(v[i]);
    end;
end;


{título de la foto más vista (la que posee mayor cantidad de clics)}
function masvista(v: vector): str;
var max, i: integer; maxT: str;
begin
     max:=-1;
     for i:=1 to dimF do
     begin
          if(v[i].clicks > max) then
          begin
              max:= v[i].clicks;
              maxT:= v[i].titulo;
          end;
     end;
     masvista:=maxT;
end;

{Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.}
function mgtotal(v: vector): integer;
var i, cantM: integer;
begin
     cantM:=0;
     for i:=1 to dimF do
     begin
          if(v[i].autor = 'Art Vandelay') then cantM:= cantM +  v[i].mgs;
     end;
     mgtotal:= cantM;
end;

{Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
function totalcom(v: vector): integer;
var i, cant: integer;
begin
    cant:=0;
    for i:=1 to dimF do cant:=cant+v[i].com;
    totalcom:=cant;
end;

var
   v: vector;
begin
     cargar(v);
     writeln('___________________________');
     writeln('La foto mas vista es: ',masvista(v));
     writeln('___________________________');
     writeln('El total de mgs del autor Art Vandelay es de: ',mgtotal(v));
     writeln('___________________________');
     writeln('El total de comentarios es de: ',totalcom(v));
     readln;
end.
