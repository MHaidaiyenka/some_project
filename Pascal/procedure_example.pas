program Ex_1;
type B=array [1..4,1..6] of integer;
var
Mas:B;
i,j,maxim,stb,str:integer;
f1,f2:text;

procedure max(m1:b);
var
  i,j,k:integer;
begin
  k:=m1[1,1];
  for i:=2 to 4 do
      for j:=2 to 6 do
       if m1[i,j]>k then
        begin
          k:=m1[i,j];
          stb:=i;
          str:=j; {выяснить строка столбец}
        end;
  writeln(k); 
  writeln('кооординаты  [',stb,',',str,']');
  if k mod 2 = 0 then 
     write('максимальное число четное')
  else
     write('максимальное число нечетное');
   maxim:=k
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
  
  max(mas);
  writeln;
  writeln('вывели число для записи = ',maxim);

  assign(f2,'C:\f2.dat');
  rewrite(f2);
  write(f2,maxim,'[',stb,',',str,']');
  close(f2);
  writeln;
  writeln('число сохранено');

end.