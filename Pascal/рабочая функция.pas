program Ex_1;
type B=array [1..4,1..6] of integer;
var
Mas:B;
max,i,j,x,y:integer;
f1,f2:text;

function NM(m:b;var x,y:integer):integer;
var
  i,j,max:integer;
begin
  max:=m[1,1];
  for i:=2 to 4 do
      for j:=2 to 6 do
       if m[i,j]>max then
        begin
          max:=m[i,j];
          x:=i;
          y:=j; 
        end;
   NM:=max;
end;

  begin
  assign(f1,'C:\f1.dat');
  reset(f1);
    for i:=1 to 4 do
      for j:=1 to 6 do 
        begin
          read(f1,Mas[i,j]);
        end;
  close(f1);
  writeln; 

  assign(f2,'C:\f2.dat');
  rewrite(f2);
  max:=NM(mas,x,y);
    if max mod 2 = 0 then
      write(f2,max,'[',x,',',y,']',' - четное')
    else 
      write(f2,max,'[',x,',',y,']',' - нечетное');
  close(f2);
end.