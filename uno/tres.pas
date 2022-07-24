program tres;
var
  n1,n2,n3:Integer;
begin
  ReadLn(n1);
  ReadLn(n2);
  ReadLn(n3);
  if (n1>n2) and (n1>n3) then begin
    if(n2>n3) then begin
      WriteLn(n1, n2, n3);
    end
    else begin
      WriteLn(n1, n3, n2);
    end;
  end;
  if (n2>n1) and (n2>n3) then begin
    if(n1>n3) then begin
      WriteLn(n2, n1, n3);
    end
    else begin
      WriteLn(n2, n3, n1);
    end;
  end;
  if (n3>n1) and (n3>n2) then begin
    if(n1>n2) then begin
      WriteLn(n3, n1, n2);
    end
    else begin
      WriteLn(n3, n2, n1);
    end;
  end;
  readln;
end.
