{. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de
los autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program siete;
const
     max=5;
var
   nombre, nMax1, nMax2, nMin1, nMin2: string[20];
   tiempo, tMax1, tMax2, tMin1, tMin2: real;
   i:integer;
begin
   tMax1:=0;
   tMax2:=0;
   tMin1:=1000000;
   tMin2:=1000000;
   for i:=1 to max do
   begin
        writeln('Ingrese el nombre del conductor y su tiempo.');
        readln(nombre);
        readln(tiempo);
        {comparacion menor}
        if(tiempo<tMin1) then
        begin
             tMin2:=tMin1;
             nMin2:=nMin1;
             tMin1:=tiempo;
             nMin1:=nombre;
        end
        else begin
             if(tiempo<tMin2) then
             begin
                  tMin2:=tiempo;
                  nMin2:=nombre;
             end;
        end;

        {comparacion mayor}
        if(tiempo>tMax1) then
        begin
             tMax2:=tMax1;
             nMax2:=nMax1;
             tMax1:=tiempo;
             nMax1:=nombre;
        end
        else begin
             if(tiempo>tMax2) then
             begin
                  tMax2:=tiempo;
                  nMax2:=nombre;
             end;
        end;
   end;
   writeln(nMax1,' es el piloto con el ultimo puesto y ', nMax2, ' con el anteultimo.');
   writeln(nMin1,' es el piloto con el primer puesto y ', nMin2, ' con el segumdo.');
   readln;
end.
