program ocho;
function doble(n1, n2: integer): boolean;
var
   dob: integer;
begin
     dob:=n1*2;
     if(n2 = dob) then doble:=true
                  else doble:=false;
end;
procedure cantidades(n1, n2: integer; var cant, cantD: integer);
begin
     cant:=cant+1;
     if (doble(n1,n2)) then cantD:= cantD+1;;
end;
procedure leer(var n1, n2: integer);
begin
     readln(n1);
     readln(n2);
end;
var
   num1,num2,c, cD: integer;
begin
     c:=0;
     cD:=0;
     leer(num1, num2);
     while (num1<>0) and (num2<>0) do
     begin
         cantidades(num1, num2, c, cD);
         leer(num1, num2);
     end;
     writeln('La cantidad de pares es de: ', c);
     writeln('La cantidad de pares que el 2 es el doble q 1: ', cD);
     readln;
end.

