{Realizar un programa que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program seis;
const
     max=5;
type
    cod=1..200;
var
   codigo, min1, min2: cod;
   precio, pm1, pm2: real;
   cant16p, i: integer;
begin
     pm1:=1000;
     pm2:=1000;
     for i:=1 to max do
     begin
          write('Ingrese el codigo: ');
          readln(codigo);
          write('Ingrese el precio: ');
          readln(precio);
          {minimos}
          if(precio < pm1) then
          begin
               pm2:=pm1;
               min2:=min1;
               pm1:=precio;
               min1:= codigo;
          end
          else begin
              if(precio < pm2) and (precio > pm1) then
              begin
                   pm2:=precio;
                   min2:=codigo;
              end;
          end;
          {mas de 16 pesos con cddigo par}
          if (codigo mod 2 = 0) and (precio > 16) then cant16p:=cant16p+1;
     end;
     writeln(min1 ,' es el producto más barato y el segundo es: ', min2);
     writeln('La cantidad de productos de más de 16 pesos con código par es: ', cant16p);
     readln;
end.
