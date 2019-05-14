program Ex_1;
type B=array [1..4,1..6] of integer;
var
Mas:B;
i,j,max,str,stb:integer;
f1:text;
  begin
    for i:=1 to 4 do
      for j:=1 to 6 do
        begin
          Mas[i,j]:= random(100);
          write (Mas[i,j]) ;
        end;
  assign(f1,'C:\f1.dat');
  rewrite(f1);
    for i:=1 to 4 do
      for j:=1 to 6 do
        writeln(f1,Mas[i,j]);
        writeln;
  close(f1);

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
  
  
  max:=Mas[1,1];
  for i:=2 to 4 do
      for j:=2 to 6 do
       if Mas[i,j]>max then
        begin
          max:=Mas[i,j];
          stb:=i;
          str:=j; {выяснить строка столбец}
        end;
  writeln(max); 
  writeln('кооординаты  [',stb,',',str,']');
  if max mod 2 = 0 then 
     write('максимальное число четное')
  else
     write('максимальное число нечетное');
       
  end.