{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre,
apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La
maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program cuatro;
const dimF = 42;
type
    semanas = array[1..dimF] of real;
    embarazada = record
        nombre: string;
        apellido: string;
        dimL: integer;
        peso: semanas;
    end;
    lista = ^nodo;
    nodo = record
        datos: embarazada;
        sig: lista;
    end;
{modulos}
procedure maxSemana(peso: real; semana: integer; var max: real; var maxS: integer);
begin
    if(peso > max) then begin
        max:= peso;
        maxS:= semana;
    end;
end;

procedure IncisoA(l:lista);
var 
    max, pesoTotal: real; 
    maxS: integer;
begin
    while (l <> nil) do begin
        max:= 0;
        pesoTotal:= 0;
        for i:=1 to l^.datos.dimL do begin
            maxSemana(v[i],i,max,maxS);
            pesoTotal:= pesoTotal + v[i];
        end;
        writeln('La semana con mayor aumento de peso es: ', maxS);
        writeln('El aumento de peso total de la embarazada es de: ', pesoTotal / l^.datos.dimL);
        l:= l^.sig;
    end;
end;

var 
    L: lista;
begin
    L:= nil;
    CrearLista(L);
    IncisoAyB(L);
end.
