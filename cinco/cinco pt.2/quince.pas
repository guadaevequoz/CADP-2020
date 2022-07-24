{Código Rol Del Desarrollador Valor/hora (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Realizar un programa que procese la información de los desarrolladores que participaron en los
1000 proyectos de software más activos durante el año 2017. De cada participante se conoce su
país de residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol
que cumplió en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al
ingresar el código de proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe
informar:
a. El monto total invertido en desarrolladores con residencia en Argentina
b. La cantidad total de horas trabajadas por Administradores de bases de datos
c. El código del proyecto con mayor monto invertido
d. La cantidad de Arquitectos de software de cada proyecto.}

program quince;
const maxP = 1000;
type
     //codigo = 1..100;
     rolP = 1..5;
     str = string[20];

     participante = record
                  pais: str;
                  cod: integer;
                  nombreP: str;
                  rol: rolP;
                  cantH: integer;
     end;

     rango = 1..maxP;
     vector = array[rango] of participante;


{modulos}
procedure leer(var p: participante);
begin
     writeln('Ingrese el codigo de proyecto: ');
     readln(p.cod);
     if (p.cod <> -1) then
     begin
          writeln('Ingrese el pais: ');
          readln(p.pais);
          writeln('Igrese el nombre del proyecto: ');
          readln(p.nombreP);
          writeln('Ingrese el rol: ');
          readln(p.rol);
          writeln('Ingrese la cantidad de horas invertidas: ');
          readln(p.cantH);
     end;
end;

procedure cargar(var v: vector; var dimL: integer);
var part:participante;
begin
     dimL:=0;
     leer(part);
     while(part.cod <> -1) and (dimL < maxP) do
     begin
          dimL:= dimL + 1;
          v[dimL]:= part;
          leer(part);
     end;
end;

{inciso a y b}
procedure abcd(v: vector; dimL: integer; var monto: real; var horas: integer; var cod: integer);
var i: integer;
    sumaM, montoC, max: real;
    sumaH, cod_a, contA: integer;
begin
     sumaM:=0;
     sumaH:=0;
     max:=0;
     cod_a:=0;
     for i:=1 to dimL do
     begin
          {El monto total invertido en desarrolladores con residencia en Argentina}
          if(v[i].pais = 'Argentina')then
          begin
               if(v[i].rol = 1) then sumaM:= sumaM + (v[i].cantH * 35.20);
               if(v[i].rol = 2) then sumaM:= sumaM + (v[i].cantH * 27.45);
               if(v[i].rol = 3) then sumaM:= sumaM + (v[i].cantH * 31.03);
               if(v[i].rol = 4) then sumaM:= sumaM + (v[i].cantH * 44.28);
               if(v[i].rol = 5) then sumaM:= sumaM + (v[i].cantH * 39.87);
          end;

          {La cantidad total de horas trabajadas por Administradores de bases de datos}
          if(v[i].rol = 3) then sumaH:= sumaH + (v[i].cantH);

          {El código del proyecto con mayor monto invertido}
          montoC:=0;
          contA:= 0;
          cod_a:= v[i].cod;
          if(cod_a = v[i].cod) then begin
               if(v[i].rol = 1) then montoC:= montoC + (v[i].cantH * 35.20);
               if(v[i].rol = 2) then montoC:= montoC + (v[i].cantH * 27.45);
               if(v[i].rol = 3) then montoC:= montoC + (v[i].cantH * 31.03);
               {La cantidad de Arquitectos de software de cada proyecto.}
               if(v[i].rol = 4) then begin
                             montoC:= montoC + (v[i].cantH * 44.28);
                             contA:= contA + 1;
                           end;
               if(v[i].rol = 5) then montoC:= montoC + (v[i].cantH * 39.87);
          end;
          writeln('La cantidad de arquitectos de software del proyecto ', cod_a,' es de: ', contA);
          if(montoC > max) then
          begin
               max:= montoC;
               cod:= cod_a;
          end;

     end;
     monto:= sumaM;
     horas:= sumaH;
end;

var
   vec: vector;
   dimL, horas3, maxC: integer;
   montoT: real;
begin
     cargar(vec, dimL);
     abcd(vec, dimL, montoT, horas3, maxC);
     writeln('El monto total invertido en desarrolladores de Argentina es: ', montoT:0:2);
     writeln('La cantidad total de horas trabajadas por Administradores de bases de datos es de: ', horas3);
     writeln('El código del proyecto con mayor monto invertido: ', maxC);
     readln;
end.
