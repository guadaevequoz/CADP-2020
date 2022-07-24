program cinco;

const
     precio=1.60;
var
   caramelos, clientes, c_cli, resto:integer;
   cobro:real;
begin
   writeln('Ingrese cantidad de caramelos del kiosquero:');
   readln(caramelos);
   writeln('Ingrese cantidad de clientes:');
   readln(clientes);
   c_cli:=caramelos div clientes;
   resto:=caramelos mod clientes;
   writeln('A cada cliente le corresponden: ', c_cli, ' caramelos');
   writeln('Al kiosquero le corresponden: ', resto, ' caramelos');
   cobro:= c_cli*clientes*precio;
   writeln('El kiosquero debera cobrar $', cobro);
   readln;
end.
