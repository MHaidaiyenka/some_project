{1.массив , состоящий из 30 элементов, переформировать так,
  чтобы вначале стояли все положительные элементы и равные 0
  в порядке убывания,а затем все отрицательные в порядке возрастания}
program zad_1;
uses crt;
const
  n=30;
var
  n_otr:integer;
  sort:boolean;
  i,j,x:integer;
  M:array[1..n] of integer;
begin
  clrscr;
  writeln('vvedite massiv iz ', n,' elementov');
  for i:=1 to n do 
    {read(M[i]);- ручной ввод}
    M[i]:=random(25)-5;{случайный набор чисел}
    writeln('vvedennie elementi massiva');
    for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;
      
 {сортировка положительные/отрицательные}
  i:=1;
  j:=n;
  while i<j do{условие выхода из цикла}
    if M[i]<0 then
      if M[j]>0 then
        begin
         x:=M[i];
         M[i]:=M[j];
         M[j]:=x;
         i:=i+1;
         j:=j-1;
         sort:=true;
        end
      else j:=j-1
    else i:=i+1;
  writeln('массив после сортироки пол/отр');
  for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;
 {определение числа отрицательных элементов }
 n_otr:=0;
 for i:=1 to n do 
  if M[i]<0 then
    n_otr:=n_otr+1;
 writeln('n_otr= ',n_otr);
 writeln;
 writeln;
      
 {линейная сортировка неотрицательных элементов
 по убыыванию их значения}
 for i:=1 to n-n_otr-1 do 
  for j:=i+1 to n-n_otr-1 do
    if M[i]<M[j] then
    begin
      x:=M[i];
      M[i]:=M[j];
      M[j]:=x;
    end;
 {линейная сортировка отрицательных элементов
 по возрастанию  их значения} 
  sort:=true;
  while sort=true do
  begin
    sort:=false;
    for i:=n-n_otr+1 to n-1 do 
      if M[i]>M[i+1] then
      begin
         x:=M[i];
         M[i]:=M[i+1];
         M[i+1]:=x;
         sort:=true
      end;
  end;
  writeln('массив после 2х сортировок');
  for i:=1 to n do
      write(M[i]:4);
readln;
readln;

End.