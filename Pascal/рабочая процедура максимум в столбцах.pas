program Ex_1;
type B=array [1..4,1..6] of integer;
var
Mas:B;
i,j,stb,str:integer;
f1,f2:text;

procedure maxvstolbce(m1:b);
var
  i,j,k:integer;
begin
  assign(f2,'C:\f2.dat');
  rewrite(f2);
  close(f2);
      for j:=1 to 6 do 
        begin
        k:=m1[1,j];
          for i:=2 to 4 do
        if m1[i,j]>k then
        begin
          k:=m1[i,j];
          stb:=i;
          str:=j; 
          assign(f2,'C:\f2.dat');
          append(f2);
           if k mod 2 = 0 then
              write(f2,k,'[',stb,',',str,']','четное')
           else
              write(f2,k,'[',stb,',',str,']','нечетное','   ');
           close(f2);
        end;
        end;
        end;

  begin

  assign(f1,'C:\f1.dat');
  reset(f1);
    for i:=1 to 4 do
      for j:=1 to 6 do 
        begin
          read(f1,Mas[i,j]);
          write(Mas[i,j]);
        end;
  close(f1);
  writeln; 
  
  maxvstolbce(mas);
  
end.