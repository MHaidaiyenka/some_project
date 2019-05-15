program P_Graf;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const R=9; max=100;

type
  mas2=array[1..R] of integer;

const GRAF: array[1..R, 1..R] of integer=(
                  (0,2,0,4,0,0,0,9,0),
                  (0,0,2,0,3,0,0,0,0),
                  (0,2,0,0,0,3,0,0,0),
                  (4,0,0,0,5,0,6,0,0),
                  (0,3,0,0,0,0,0,0,0),
                  (0,0,0,5,0,0,0,0,3),
                  (0,0,0,0,0,0,0,0,4),
                  (9,0,0,0,0,0,0,0,7),
                  (0,0,0,0,8,3,0,0,0));

var
  vvod, col, row: integer;


procedure Deikstra(vvod1: integer);
var
  i, m, n, min,count, index: integer;
  rasst: mas2;
  mas: array[1..R] of boolean;
begin
  m:=vvod1;
  writeln;
  for i:=1 to R do
    begin
      rasst[i]:=max; mas[i]:=false;
    end;
  rasst [vvod1]:=0;
  for count:=1 to R-1 do
    begin
      min:=max;
      for i:=1 to R do
        if (not mas[i]) and (rasst[i]<=min) then
          begin
            min:=rasst[i]; index:=i;
          end;
      m:=index;
      mas[m]:=true;
      for i:=1 to R do
        if (not mas[i])
          and (GRAF[m, i]<>0)
          and (rasst[m]<>max)
          and (rasst[m]+GRAF[m, i]<rasst[i])
          then rasst[i]:=rasst[m]+GRAF[m, i];
    end;
  writeln;
  write('Стоимость пути от вершины ',vvod,' до всех вершин по алгоритму Дейкстры:');
  writeln;
  writeln;
    for i:=1 to R do
      if rasst[i]<>max then
        writeln(vvod:4,' до ', i,' = ', rasst[i])
      else writeln(vvod:4,' до ', i,' = ', 'вершина недоступна');
end;


Procedure Floid();
var
  k,i,j: integer;
  mas: array[1..R, 1..R] of integer;
begin
 for row:=1 to R do
  for col:=1 to R do
    mas[row,col]:= GRAF[row, col];
    for i:=1 to R do mas[i, i]:=0;
    for k:=1 to R do
    for i:=1 to R do
    for j:=1 to R do
  if (mas[i, k]<>0) and (mas[k, j]<>0) and (i<>j) then
  if (mas[i, k]+mas[k, j]<mas[i, j]) or (mas[i, j]=0) then
      mas[i, j]:=mas[i, k]+mas[k, j];
  WriteLn('Кратчайший путь до каждой вершины по алгоритму Флойда:');
  for i:=1 to R do
    begin
      for j:=1 to R do
        write(mas[i, j]:4);
        writeln; ;
    end;
end;


begin
writeln('Изначачальный граф:':23);
for row:=1 to R do
  begin
    for col:=1 to R do
      Write('[':2, GRAF[row][col],']');
    WriteLn;
  end;
Writeln;
Floid();
Writeln;
WriteLn('Задайте первую вершину для алгоритма Дейстры: ');
Readln(vvod);
Deikstra(vvod);
writeln;
ReadLn;
end.
