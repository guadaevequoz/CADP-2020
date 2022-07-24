program uno;

var
  num, valorabs: integer;
begin
  readln(num);
  if(num>=0) then
  begin
      valorabs:= num;
  end
  else
  begin
      valorabs:=num*(-1);
  end;
  writeln('El valor absluto es: ', valorabs);
  readln;
end.
