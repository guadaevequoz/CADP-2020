{ Realizar un programa que lea datos de 100 productos de una tienda de ropa. Para cada producto debe leer el
precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
- El código del producto más barato.
- El código del producto de tipo “pantalón” más caro.}
program nueve;
const
     cantP=3; {son 100 pero le puse 3 para probar}

{proceso que lee datos}
procedure leedatos(var precio: real; var codigo: integer; var tipo:string);
begin
     readln(precio);
     readln(codigo);
     readln(tipo);
end;
{codigo defuncion que devuelve el codigo de la prenda mas barata}
procedure comparaC(precio: real; codigo: integer; var minP: real; var codigomin: integer);
begin
     if (precio < minP) then
     begin
          minP:= precio;
          codigomin:= codigo;
     end;
end;
{codigo de la funcion qu devuelve el producto del tipo pantalon mas caro}
procedure comparaT(precio: real; tipo:string; codigo:integer; var maxp: real; var codigomaxP:integer);
begin
     if (tipo = 'pantalon') then
     begin
          if(precio > maxP) then
          begin
               maxP:= precio;
               codigomaxP:=codigo;
          end;
     end;
end;
var
   precio, minPrecio, maxPrecio: real;
   codigo, i, codMin, codMax: integer;
   tipo: string;
begin
     minPrecio:=999999;
     maxPrecio:=0;
     codMin:= 0;
     codMax:= 0;
     for i:=1 to cantP do
     begin
          leedatos(precio, codigo, tipo);
          comparaC(precio, codigo, minPrecio, codMin);
          comparaT(precio, tipo, codigo, maxPrecio, codMax);
     end;
     writeln('El codigo de la prenda mas barata es: ', codMin);
     writeln('El codigo del producto de tipo “pantalon” mas caro: ', codMax);
     readln;
end.
