{Un local de ropa desea analizar las ventas realizadas en el �ltimo mes. Para ello se lee por cada
d�a del mes, los montos de las ventas realizadas. La lectura de montos para cada d�a finaliza
cuando se lee el monto 0. Se asume un mes de 31 d�as. Informar la cantidad de ventas por cada
d�a, y el monto total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que adem�s informe el d�a en el que se realiz� la
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
        { calcula el dia que se realizaron m�s ventas}
        if (cant_v > ventM) then
        begin
             ventM:=cant_v;
             diaM:= i;
        end;
        writeln('Las ventas del dia ', i,' fueron: ', cant_v);
        writeln('_________________________________________');
   end;
   writeln('El monto total es: ', monto_t:1:2);
   writeln('El dia con m�s ventas fue: ', diaM);
   readln;
end.
