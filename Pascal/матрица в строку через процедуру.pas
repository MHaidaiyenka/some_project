type  B=array [1..4,1..6] of integer;
var
  mas:b;
  x,i,j:integer;
  A:array [1..24]of integer;
  f1,f2:text;

Procedure OM(M:B);
  var
    x,i,j:integer;
    begin
      assign (f2,'C:\f2.dat');
      rewrite (f2);
      close(f2);
    for i:=1 to 4 do
      for j:=1 to 6 do
       begin
        if M[i,j]<0 then
          M[i,j]:=0;
        x:=1;
        A[x]:=M[i,j];
        assign (f2,'C:\f2.dat');
        append(f2);
        write(f2,A[x]:2);
        close(f2);
       end;
     end;

begin
  assign (f1,'C:\f1.dat');
  reset (f1);
  for i:=1 to 4 do
    for j:=1 to 6 do
      read(f1,Mas[i,j]);
  close(f1);

  OM(Mas);

end.