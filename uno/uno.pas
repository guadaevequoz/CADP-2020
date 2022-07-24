program uno;

var
  num1, num2: integer;
begin
  readln(num1);
  readln(num2);
  if(num1>num2) then
  begin
       writeln('El primer numero es mayor');
  end
  else
  begin
       if(num1<num2) then
       begin
            writeln('El segundo es mayor');
       end
       else
       begin
            writeln('Son iguales');
       end;
  end;
  readln;
end.
