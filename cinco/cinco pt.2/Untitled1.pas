program ejer1;
var
  a, b, c: integer;
procedure prueba (var a:integer; var b:integer; c:integer);
  begin
    b:= a  - 11;
    c:= b + 10;
    a:= a + c + 5;
    writeln('a: ', a , ' b: ',  b, ' c: ', c);      {2}
  end;
Begin {programa principal}
  a:= 3;
  b:= 10;
  writeln ('a: ', a , ' b: ',  b, ' c: ', c);      {1}
  prueba (b, c, a);
  writeln ('a: ', a , ' b: ',  b, ' c: ', c);     {3}
  readln;
End.
