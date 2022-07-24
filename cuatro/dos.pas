{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos
durante el año 2017. Para ello, cuenta con información de las fechas de todos los casamientos
realizados durante ese año.
A) Analice y defina un tipo de datos adecuado para almacenar la información de la fecha de cada
casamiento.
1
B) Implemente un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo
es el definido en A).
C) Implementar un programa que lea la fecha de todos los casamientos realizados en 2017. La
lectura finaliza al ingresar el año 2018, que no debe procesarse e informe la cantidad de
casamientos realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de
casamientos realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en
B) para la lectura de fecha.
}

program dos;
{inciso A}
type
    dias = 1..31;
    meses = 1..12;
    fechaC = record
           dia: dias;
           mes: meses;
           anio: integer; 
    end;

{inciso B}
procedure leer(var f: fechaC);
begin
     writeln('Ingrese el año del casamiento: ');
     readln(f.anio);
     if (f.anio = 2017) then
     begin
          writeln('Ingrese el dia del casamiento: ');
          readln(f.dia);
          writeln('Ingrese el mes del casamiento: ');
          readln(f.mes);
     end;
end;

var
   fecha: fechaC;
   cantVerano, cant10dias: integer;
begin
     cantVerano:= 0; cant10dias:= 0;
     leer(fecha);
     while (fecha.anio <> 2018) do
     begin
          if ((fecha.mes = 1) or (fecha.mes = 2) or (fecha.mes = 3)) then cantVerano:= cantVerano+1;
          if ((fecha.dia > 0) and (fecha.dia <=10)) then cant10dias:=cant10dias+1;
          leer(fecha);
     end;
     writeln('La cantidad de casamientos realizados en verano fueron: ', cantVerano);
     writeln('La cantidad de casamientos realizados los primeros 10 dias del mes fueron: ', cant10dias);
     readln;
end.

