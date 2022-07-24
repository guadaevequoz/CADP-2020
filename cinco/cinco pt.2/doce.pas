{12. La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata.
Para ello, debe realizar un programa que lea y almacene información sobre las computadoras con este sistema operativo
(a lo sumo 10.000). De cada computadora se conoce la versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.),
 la cantidad de paquetes instalados y la cantidad de cuentas de usuario que poseen. La lectura finaliza
 al ingresar la versión 4.10, que no debe procesarse. Una vez almacenados todos los datos, informar:
 - cantidad de computadoras que utilizan las versiones 18.04 o 16.04
 - promedio de cuentas de usuario por computadora
 - versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados }

 program doce;
 const dimF = 10000;
 type
     compu = record
           version: real;
           paquetes: integer;
           cuentas: integer;
     end;

     rango = 1..dimF;
     vector = array[rango] of compu;

procedure leer(var a: compu);
  begin
       writeln('Ingrese la version: ');
       readln(a.version);
       if(a.version <> 4) then
       begin
            writeln('Ingresar cantidad de paquetes instalados:');
            readln(a.paquetes);
            writeln('Ingrese la cantidad de cuentas: ');
            readln(a.cuentas);
       end;
  end;

procedure leerycargar(var v: vector; var dimL: integer);
var c: compu;
begin
     dimL:=0;
     leer(c);
     while(c.version <> 4) and (dimL < dimF) do
     begin
          dimL:= dimL +1;
          v[dimL]:=c;
          leer(c);
     end;
end;

procedure todo(v:vector; dimL:integer; var versiones: integer; var prom, versionU: real);
var i,cant,con, maxP:integer; maxV: real;
begin
     cant:=0;
     maxP:=-1;
     for i:=1 to dimL do
     begin
          if(v[i].version = 18) or (v[i].version = 16) then cant:=cant+1;

          con:=con+v[i].cuentas;

          if(v[i].paquetes > maxP) then
          begin
               maxP:= v[i].paquetes;
               maxV:= v[i].version;
          end;
     end;
     versiones:=cant;
     if(dimL<> 0) then prom:=con/dimL //promedio de cuentas de usuario por computadora
               else prom:=0;
     versionU:=maxV; //versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados
end;

var
   v: vector;
   dimL, ver: integer;
   prom,verU: real;
begin
     leerycargar(v,dimL);
     todo(v,dimL,ver,prom,verU);
     writeln('La cantidad de computadoras que utilizan las versiones 18.04 o 16.04 son: ', ver);
     writeln('El promedio de cuentas de usuario por computadora es de: ', prom:1:2);
     writeln('La versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados es: ', verU:1:2);
     readln;
end.
