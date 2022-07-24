{17. 
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo
de zona (1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe
procesarse. El precio de la soja es de U$S320 por ha. Informar:
- La cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000.
- La localidad del campo con mayor rendimiento económico esperado
- La localidad del campo con menor rendimiento económico esperado

}
program diecisiete;
const 
    precio= 320; {precio por ha}
    
{lee los datos de los campos}    
procedure leerdatos(var localidad: string; var ha:integer; var tipoSiembra: char);
begin
    writeln('Ingrese la localidad');
    readln(localidad);
    writeln('Ingrese la cantidad de hectáreas');
    readln(ha);
    writeln('Ingrese el numero del tipo de zona de siembra: 1: zona muy fertil, 2: zona estandar, 3: zona arida');
    readln(tipoSiembra);
end;

function rendimientoeco(ha: integer; tipoSiembra: char): real;
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
    ha, cant: integer;
    tipoSiembra: char;
    rendimiento, min, max: real;
    localidad, lMax, lMin: string;
begin
    cant:= 0; 
    min:= 9999; max:= -1;
    repeat 
        leerdatos(localidad,ha,tipoSiembra);
        rendimiento:= rendimientoeco(ha,tipoSiembra); {saca el rendimiento} 
        if(rendimiento > 10000) and (localidad = 'Tres de Febrero') then cant:=cant+1; {si el rencimiento es mayor a 10.000 cuenta 1}
        if (rendimiento > max) then
        begin
            max:=rendimiento;
            lMax:= localidad;
        end;
        if(rendimiento < min) then
        begin
            min:=rendimiento;
            lMin:= localidad;
        end;
    until (localidad = 'Saladillo') and (ha = 900);
    writeln(cant, ' son los campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000.');
    writeln(lMax, ' es la localidad del campo con mayor rendimiento económico esperado');
    writeln(lMin, ' es la localidad del campo con menor rendimiento económico esperado');
    readln;
end.

