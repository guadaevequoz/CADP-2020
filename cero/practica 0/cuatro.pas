program uno;

const
     pi=3.14;
var
   radio,diametro,per,area:real;
begin
   writeln('Ingrese el diametro:');
   readln(diametro);
   radio:=diametro/2;
   area:=(radio*radio)*pi;
   per:=diametro*pi;
   writeln('El radio es:', radio);
   writeln('El area es:', area:3:2, ' y el perimetro: ', per:3:2);
   readln;
end.
