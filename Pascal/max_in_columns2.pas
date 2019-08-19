program Ex_1;
type B=array [1..4,1..6] of integer;
var
Mas:B;
i,j:integer;
f1,f2:text;

procedure OM(m1:b);
var
  i,j,k,x,y:integer;
begin
  assign(f2,'C:\f2.dat');
  rewrite(f2);
  close(f2);      
      for j:=1 to 6 do
        begin
        k:=m1[1,j];
          for i:=1 to 4 do
        if m1[i,j]>k then
        begin
          k:=m1[i,j];
          x:=i;
          y:=j; 
        end;
          assign(f2,'C:\f2.dat');
          append(f2);
          write(f2,k,'[',x,',',y,']','   ');
          close(f2);
        end;

        end;

  begin
  assign(f1,'C:\f1.dat');
  reset(f1);
    for i:=1 to 4 do
      for j:=1 to 6 do 
          read(f1,Mas[i,j]);
  close(f1);
  
  OM(mas);
  
end.