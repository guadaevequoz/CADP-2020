{5. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a
intendente de la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del
candidato, cantidad de votos obtenidos, y cantidad de votantes de la localidad. La lectura finaliza al
leer la localidad ‘Zárate’, que debe procesarse. Informar:
? el intendente que obtuvo la mayor cantidad de votos en la elección.
? el intendente que obtuvo el mayor porcentaje de votos de la elección.   cantidaddevotantes
}

program cinco;
type
    candidato = record
              localidad: string[20];
              apellido: string[20];
              cantVotos: integer;
              cantVotantes: integer;
     end;

procedure leer(var c:candidato);
begin
     writeln('Ingrese la localidad: ');
     readln(c.localidad);
     if(c.localidad <> 'Zarate') then
     begin
          writeln('Ingrese el apellido del candidato: ');
          readln(c.apellido);
          writeln('Ingrese la cantidad de votos: ');
          readln(c.cantVotos);
          writeln('Ingrese la cantidad de votantes: ');
          readln(c.cantVotantes);
     end;
end;
var
   can: candidato;
   maxV: integer;
   maxVN, maxPN: string[20];
   porcentaje, maxP: real;
begin
     maxV:=0;
     leer(can);
     while (can.localidad <> 'Zarate') do
     begin
          if (can.cantVotos > maxV) then begin
             maxV:= can.cantVotos;
             maxVN:= can.apellido;
          end;
          porcentaje:= (can.cantVotos / can.cantVotantes)*100;
          if( porcentaje > maxP) then
          begin
             maxP:= porcentaje;
             maxPN:= can.apellido;
          end;
          leer(can);
     end;
     writeln('El intendente ', maxVN,' fue el que junto más votos.');
     writeln('El intendente ', maxPN,' fue el que tuvo un mayor porcentaje de votos.');
     readln;
end.
