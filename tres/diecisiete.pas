{17. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
Tipo de zona Rendimiento por ha
1 6 toneladas por ha
2 2,6 toneladas por ha
3 1,4 toneladas por ha
}
program diecisiete;
procedure leerdatos(var ha:integer; var tipoSiembra: char; var precio: real);
begin
    writeln('Ingrese la cantidad de hectáreas');
    readln(ha);
    writeln('Ingrese el numero del tipo de zona de siembra: 1: zona muy fertil, 2: zona estandar, 3: zona arida');
    readln(tipoSiembra);
    writeln('Ingrese el precio en U$S de la tonelada de soja');
    readln(precio);
end;

function rendimientoeco(ha: integer; tipoSiembra: char; precio: real): real;
var
    aux: real;
begin
    case tipoSiembra of
        '1': aux:= ha * 6 * precio;
        '2': aux:= ha * 2.6 * precio;
        '3': aux:= ha * 1.4 * precio;
    end;
    rendimientoeco:= aux;
end;

var
    ha: integer;
    tipoSiembra: char;
    precio: real;
begin
    leerdatos(ha,tipoSiembra,precio);
    writeln('El rendimiento economico es:', rendimientoeco(ha,tipoSiembra,precio):1:2);
    readln;
end.

