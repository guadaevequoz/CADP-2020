{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que
no debe procesarse) e informe:
- la cantidad de ocurrencias de cada dígito procesado.
- el dígito más leído
- los dígitos que no tuvieron ocurrencias.
}

program siete;
const dimF = 9;
type
    rango = 0..dimF;
    vectorN = array[rango] of integer;

procedure inicializar(var v:vectorN);
var i: integer;
begin
     for i:=0 to dimF do v[i]:=0;
end;

procedure imprimir(v:vectorN);
var i: integer;
begin
     for i:=0 to dimF do writeln(i,') ',v[i]);
end;

function maximo(v:vectorN):integer;
var max,i, pos: integer;
begin
     max:=-1;
     for i:=0 to dimF do
     begin
          if(v[i] > max) then begin
                  max:=v[i];
                  pos:=i;
          end;
     end;
     maximo:=pos;
end;

procedure cero(v:vectorN);
var i: integer;
begin
     for i:=0 to dimF do
     begin
          if(v[i] = 0) then writeln('El elemento ',v[i],' de la posicion ', i,' es cero.');
     end;
end;

var
   v: vectorN;
   num, resto: integer;
begin
     writeln('Ingrese un numero: ');
     readln(num);
     inicializar(v);
     while(num <> -1)  do
     begin
          while(num <> 0) do
          begin
               resto:= num MOD 10;
               v[resto]:= v[resto]+1;
               num:=num DIV 10;
          end;
          writeln('Ingrese un numero: ');
          readln(num);
     end;
     imprimir(v);
     writeln('El digito mas repetido es: ', maximo(v));
     cero(v);
     readln;
end.
