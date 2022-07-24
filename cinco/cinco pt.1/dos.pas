program dos;
const
 cant_datos = 5;
type
 vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var num: real; i: integer;
begin
     dimL:=0;
     readln(num);
     while(num <> 0) and (dimL < cant_datos) do
     begin
          dimL:=dimL+1;
          v[dimL]:= num;
          readln(num);
     end;
end;
procedure modificarVectorySumar(var v:vdatos; dimL : integer; num: real; var suma: real);
var i: integer;
begin
   for i:=1 to dimL do
   begin
        v[i]:= v[i] + num;
        writeln(v[i]:1:2);
        suma:=suma + v[i];
   end;
end;
{ programa principal }
var
 datos : vdatos;
 dim : integer;
 num, sumaTotal : real;
begin
 sumaTotal := 0;
 cargarVector(datos,dim); { completar }
 writeln('Ingrese un valor a sumar');
 readln(num);
 modificarVectorySumar(datos, dim, num, sumaTotal);{completar}
 writeln('La suma de los valores es: ', sumaTotal:1:2);
 writeln('Se procesaron: ',dim, ' números');
 readln;
 end.
