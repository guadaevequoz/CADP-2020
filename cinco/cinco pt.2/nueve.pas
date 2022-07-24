program nueve;
const dimF = 500;
type
    rango = 1..500;
    nombres = string[15];
    vectorA = array[rango] of nombres;

procedure cargar(var v:vectorA; var dimL: integer);
var nombre: nombres;
begin
     dimL:=0;
     writeln('Ingrese el nombre de un alumno: ');
     readln(nombre);
     while(nombre <> 'ZZZ') and (dimL < dimF) do
     begin
          dimL:=dimL+1;
          v[dimL]:=nombre;
          writeln('Ingrese otro nombre de un alumno: ');
          readln(nombre);
     end;
end;
//borrar

procedure borrar(var v:vectorA; var dimL:integer; elem: nombres; var exito:boolean);
var i: integer;
begin
    i:=0;
    exito:=false;
    while(i < dimL) and (not exito)  do
    begin
         i:=i+1;
         if(v[i] = elem) then
         begin
              exito:=true;
              for i:=i+1 to dimL do v[i-1]:= v[i];
              dimL:=dimL-1;
         end
         else exito:=false;
    end;
end;

//insertar
procedure insertar(var v:vectorA; var dimL:integer; elem: nombres; pos: integer; var exito: boolean);
var i: integer;
begin
     exito:=false;
     if(dimL < dimF) and ((pos>=1) and (pos <= dimL)) then
     begin
          exito:=true;
          for i:=dimL downto pos do v[i + 1] := v[i];
          v[pos]:=elem;
          dimL:=dimL+1;
     end;
end;

//agregar
procedure agregar(var v:vectorA; var dimL: integer; elem: nombres; var exito:boolean);
begin
     exito:=false;
     if(dimL < dimF) then
     begin
          exito:=true;
          v[dimL+1]:= elem;
          dimL:=dimL+1;
     end;
end;
//imprimir
procedure imprimir(v:vectorA; dimL: integer);
var i: integer;
begin
     for i:=1 to dimL do writeln(i,') ',v[i]);
end;

var
   v: vectorA;
   dimL: integer;
   nom: nombres;
   exito: boolean;
begin
     cargar(v,dimL);
     writeln('_________________________');
     imprimir(v,dimL);
     writeln('_________________________');
     writeln('Ingrese un nombre que quiera eliminar:');
     readln(nom);
     borrar(v, dimL, nom, exito);
     if(exito) then writeln('Se ha borrado el nombre.')
               else writeln('No se ha borrado el nombre.');
     imprimir(v,dimL);
     writeln('_________________________');
     writeln('Ingrese un nombre para insertar en la posicion 4:');
     readln(nom);
     insertar(v, dimL, nom, 4, exito);
     if(exito) then writeln('Se ha insertado el nombre.')
               else writeln('No se ha insertado el nombre.');
     imprimir(v,dimL);
     writeln('_________________________');
     writeln('Ingrese un nombre para insertar:');
     readln(nom);
     agregar(v,dimL,nom,exito);
     if(exito) then writeln('Se ha insertado el nombre.')
               else writeln('No se ha insertado el nombre.');
     imprimir(v,dimL);
     readln;
end.
