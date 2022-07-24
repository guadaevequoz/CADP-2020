{4. Una compa��a de telefon�a celular debe realizar la facturaci�n mensual de sus 9300 clientes con
planes de consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce
su c�digo de cliente y cantidad de l�neas a su nombre. De cada l�nea se tiene el n�mero de tel�fono,
la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes.
Se pide implementar un programa que lea los datos de los clientes de la compa��a e informe el
monto total a facturar para cada uno. Para ello se requiere:
A) Realizar un m�dulo que lea la informaci�n de una l�nea de tel�fono
B) Realizar un m�dulo que reciba los datos de un cliente, lea la informaci�n de todas sus l�neas
(utilizando el m�dulo desarrollado en A) y retorne la cantidad total de minutos y la cantidad total
de MB a facturar del cliente.
Nota: para realizar los c�lculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido
cuesta $1,35.}

program cuatro;
const
     max = 5; //cantidad de clientes q lee
     min = 3.40;
     mb = 1.35;
type
    cadena15=string[15];
    cliente = record
            cod_cli: integer;
            cantL: integer;
    end;
    lineas = record
           numTel: cadena15;
           cantMin: real;
           cantMB: real;
    end;

procedure leerlinea(var l:lineas);
begin
     writeln('Ingresar el numero de telefono: ');
     readln(l.numTel);
     writeln('Ingresar la cantidad de minutos: ');
     readln(l.cantMin);
     writeln('Ingresar la cantidad de MB: ');
     readln(l.cantMB);
end;
procedure leer(var c: cliente; var l: lineas; var cantTM, cantTMB: real);
var
   j: integer;
begin
     {ingresa datos del cliente}
     cantTM:=0;
     cantTMB:=0;
     writeln('Ingresar codigo de cliente: ');
     readln(c.cod_cli);
     writeln('Ingresar la cantidad de lineas: ');
     readln(c.cantL);
     for j:=1 to c.cantL do begin
           leerlinea(l);   //lee datos de la linea
           cantTM:= cantTM + (l.cantMin * min); //acumula el precio por la cantidad de minutos
           cantTMB:= cantTMB + (l.cantMB * MB);  // acumula la precio por la cantidad de MB
     end;

end;

var
    i: integer;
    cli: cliente;
    linea: lineas;
    cantTM, cantTMB:real;
begin
     for i:=1 to max do
     begin
          leer(cli, linea, cantTM, cantTMB);
          writeln('El total a pagar de todas las lineas del cliente ', cli.cod_cli,' es: ', cantTM:1:2,' pesos por los minutos y ', cantTMB:1:2,' por los MB');
          readln();
          writeln('___________________________________');
     end;
     readln;
end.
