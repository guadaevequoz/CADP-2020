program uno;

var
   num1, num2, divi:real;
begin
   writeln('Ingrese un numero:');
   readln(num1);
   writeln('Ingrese otro numero:');
   readln(num2);
   divi:=num1/num2;
   writeln('Los division de: ', num2:1:2,' y ', num1:1:2, ' es:', divi:1:2);
   readln;
end.
