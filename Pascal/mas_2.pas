program mas_2;
uses crt;
const
  m=5;
  n=5;
var
  P:integer;{произведение диагонали}
  n_sort,candidat:integer;{сортировка по возрастанию или убыванию}
  max,st_max,cl_max:integer;{определение максимального числа}
  i,j:integer;
  Mas:array[1..m,1..n]of integer;
begin
  {ввод данных}
  for i:=1 to m do
    begin
    for j:=1 to n do
     mas[i,j]:=random (25)-3
     {read(Mas[i,j]);
     readln; - ручной ввод}
     end;
     
  {вывод данных}
  for i:=1 to m do
    begin
    for j:=1 to n do
    write(Mas[i,j]:4);
    writeln;
    end;
    
   {максимальное число в матрице и его координаты}
  max:=Mas[1,1];
  for i:=1 to m do
    begin
    for j:=1 to n do
    if Mas[i,j]>max
    then
      begin
        max:=mas[i,j];
        st_max:=i;
        cl_max:=j;
      end;
    end;
  writeln('число = ',max,'   координаты = ',[st_max,cl_max] );
  
  {произведение дигонали}
  P:=1;
  for i:=1 to m do
    {for j:=1 to n do
      if i=j then - можно убрать т.к. i=j} P:=P*Mas[i,j];
  writeln('proivedenie = ',P:5);
     
  {сортировка по возрастанию или убыванию}
  
   
readln;
end.
  
  