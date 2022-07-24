program uno;

var
   cant_d:integer;
   valor_d, total, porce: real;
   porc:integer;
begin
   writeln('Ingrese cantidad de dolares:');
   readln(cant_d);
   writeln('Ingrese el valor actual');
   readln(valor_d);
   writeln('Ingrese el porcentaje de la comision:');
   readln(porc);
   porce:= (porc/100)+1;
   total:=cant_d * valor_d * porce;
   writeln('El total es:', total:1:2);
   readln;
end.
