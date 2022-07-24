{14. Realizar una solución modularizada para el ejercicio 6 de la práctica 2 que plantea lo siguiente: Realizar un
programa que lea información de 200 productos de un supermercado. De cada producto se lee código y precio
(cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program catorce;
const  max=5;

type
    codig= 1..200;

procedure leerdatos(var cod: codig; var prec: real);
begin
     write('Ingrese el codigo: ');
     readln(cod);
     write('Ingrese el precio: ');
     readln(prec);
end;

procedure masbaratos(coda: codig; var pm1, pm2: real; prec: real; var min1, min2: codig);
begin
     if(prec < pm1) then
          begin
               pm2:=pm1;
               min2:=min1;
               pm1:=prec;
               min1:= coda;
          end
          else begin
              if(prec < pm2) then
              begin
                   pm2:=prec;
                   min2:=coda;
              end;
          end;
end;
procedure cantidad16par(precio: real; cod: codig; var cant:integer);
begin
     if (cod mod 2 = 0) and (precio > 16) then cant:=cant+1;
end;

var
   codigo, cm1, cm2: codig;
   precio, pm1, pm2: real;
   c, i: integer;
begin
     pm1:= 9999;
     pm2:= 9999;
     for i:=1 to max do
     begin
          leerdatos(codigo, precio);
          masbaratos(codigo, pm1, pm2, precio, cm1, cm2);
          cantidad16par(precio, codigo, c);
     end;
     writeln(cm1 ,' es el producto más barato y el segundo es: ', cm2);
     writeln('La cantidad de productos de más de 16 pesos con código par es: ', c);
     readln;
end.
