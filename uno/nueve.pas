program nueve;
{Realizar un programa que lea un car�cter, que puede ser �+� (suma) o �-� (resta); si se ingresa
otro car�cter, debe informar un error y finalizar. Una vez le�do el car�cter de suma o resta, deber�
leerse una secuencia de n�meros enteros que finaliza con 0. El programa deber� aplicar la
operaci�n le�da con la secuencia de n�meros, e imprimir el resultado final. Por ejemplo:
? Si se le� el car�cter �-� y la secuencia 4 3 5 -6 0 , deber� imprimir: 2 (4 � 3 � 5 - (-6) )
? Si se le� el car�cter �+� y la secuencia -10 5 6 -1 0, deber� imprimir 0 ( -10 + 5 + 6 + (-1)}
var
   car:char;
   num, op: integer;
begin
   write('Ingrese un caracter + o - : ');
   readln(car);
   if(car<>'+') and (car<>'-') then
   begin
        writeln('ocurrio un error');
   end
   else begin
        write('Ingrese un numero: ');
        readln(num);
        while (num<>0) do
        begin
             if (car = '+') then
             begin
                  op:=op+num;
             end
             else begin
                  op:=op-num;
             end;
             write('Ingrese un numero: ');
             readln(num);
        end;
        writeln('La ', car,' de los numeros es: ', op);
        readln;
   end;
end.
