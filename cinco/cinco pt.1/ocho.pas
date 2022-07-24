{8. Realice un programa que lea y almacene el salario de los empleados de una empresa de turismo (a
lo sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o
cuando se completa el vector. Una vez finalizada la carga de datos se pide:
a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello,
implemente un módulo que reciba como parámetro un valor real X, el vector de
valores reales y su dimensión lógica y retorne el mismo vector en el cual cada elemento
fue multiplicado por el valor X.
b. Realizar un modulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.  }

program ocho;
const dimF=300;
type
    rango = 1..300;
    vector = array[rango]of real;

procedure cargar(var v: vector; var dimL: integer);
var sueldo: real;
begin
     dimL:=0;
     writeln('Ingrese el primer sueldo:');
     readln(sueldo);
     while(sueldo <> 0) and (dimL < dimF) do
     begin
          dimL:=dimL+1;
          v[dimL]:=sueldo;
          writeln('Ingrese otro sueldo:');
          readln(sueldo);
     end;
end;
//suelo*1.15
{inciso a}
procedure quince(var v:vector; dimL: integer; x: real);
var i: integer;
begin
     for i:=1 to dimL do v[i]:=v[i]*x;
end;

{inciso b}
function promedio(v:vector; dimL:integer):real;
var i: integer; suma: real;
begin
     for i:=1 to dimL do suma:= suma + v[i];
     promedio:=suma/dimL;
end;

procedure imprimir(v:vector; dimL: integer);
var i: integer;
begin
     for i:=1 to dimL do writeln(i,') ',v[i]:1:2);
end;


var
   v: vector;
   dimL: integer;
   por: real;
begin
     cargar(v, dimL);
     writeln('Ingrese el porcentaje que quiere incrementar en cada salario: ');
     readln(por);
     por:=(por/100)+1;
     quince(v,dimL,por);
     imprimir(v, dimL);
     writeln('El promedio del sueldo de los empleados es: ', promedio(v,dimL):1:2);
     readln;
end.
