{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada
día del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza
cuando se lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada
día, y el monto total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.}
program ocho;
const
     mes=31;
var
   diaM, ventM, i, cant_v: integer;
   monto_d, monto_t:real;
begin
   ventM:=0;
   for i:=1 to mes do
   begin
        cant_v:=0;
        {empieza el mes}
        repeat
              writeln('Ingrese el monto del dia: ', i);
              readln(monto_d);
              cant_v:=cant_v+1; {suma las ventas}
              monto_t:=monto_t+monto_d;   {acumula montos}
        until (monto_d = 0);
        { calcula el dia que se realizaron más ventas}
        if (cant_v > ventM) then
        begin
             ventM:=cant_v;
             diaM:= i;
        end;
        writeln('Las ventas del dia ', i,' fueron: ', cant_v);
        writeln('_________________________________________');
   end;
   writeln('El monto total es: ', monto_t:1:2);
   writeln('El dia con más ventas fue: ', diaM);
   readln;
end.
