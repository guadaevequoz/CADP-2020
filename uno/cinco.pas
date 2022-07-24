program cinco;
var
  num, doble:real;
  cant: integer;
begin
  cant:=0;
  write('Ingrese un numero: ');
  readln(num);
  doble:= 2*num;
  while(num<>doble) and (cant < 10) do
  begin
      write('Ingrese un numero: ');
      readln(num);
      cant:=cant+1;
  end;
  if (num=doble) then
  begin
       writeln('El doble es:', num:1:2);
  end
  else begin
       writeln('No se ha encontrado el doble.');
  end;
  readln;
end.
