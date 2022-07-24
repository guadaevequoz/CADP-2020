{13. Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su perímetro.
a. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenidas
del Telescopio Espacial Kepler. De cada planeta se lee nombre, su radio (medido en kilómetros) y la
distancia (medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no
debe procesarse. Informar:
- Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra
(12.700 km) y mayor o igual que el de Marte (6.780 km).
- Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km)}

program trece;
const
     pi= 3.14;

procedure leerdatos(var nombre: string; var radio: real);
begin
     write('Ingrese el nombre del planeta: ');
     readln(nombre);
     write('Ingrese el radio del planeta: ');
     readln(radio);
end;
procedure dyp(r: real; var diametro, perimetro: real);
begin
    diametro:= r*2;
    perimetro:= 2 * (pi*r);
end;

var
   nom: string;
   dis, dia, r, p: real;
   c: integer;
begin
     leerdatos(nom,r);
     while(r <> 0) do
     begin
          write('Ingrese la distancia a la Tierra: ');
          readln(dis);
         dyp(r, dia, p);
         if((dia <= 12700) and (dia >= 6780)) then writeln('El planeta: ', nom, ' tiene una distancia de: ', dis:1:2,'km');
         if(p > 439264) then c:=c+1;
         leerdatos(nom,r);
     end;
     writeln(c, ' son la cantidad de planetas con perimetro mayor al de Jupiter.');
     readln;
end.
