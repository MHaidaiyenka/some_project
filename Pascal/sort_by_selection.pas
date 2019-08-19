Uses Crt;
const n =20;
type TM= array [1..n] of integer;
Var a:TM;
    i: integer;
    
Procedure PrintMas;
  Var i:integer;
    begin
      for i:=1 to n do 
      write(A[i]:4);
      writeln;
    end; 

Procedure swap (var a,b:integer);
  var temp: integer;
  begin
    temp:=a;
    a:=b;
    b:=temp;
  end;
  
procedure select ( var a:tm; const n:integer);
  var i,j,min:integer;
  begin
    for i:=1 to n-1 do
    begin
      min:=i;
      for j:=i+1 to n do
        if a[j]<a[min] then min:=j;
        swap (a[i],a[min]);
    end;
    gotoxy (10,9);
    writeln('Отсортированный массив, вывод из процедуры');
    Printmas;
  end;
Begin
  clrscr;
  for i:=1 to n do
    a[i]:= random(100);
  gotoxy(20,5);
  writeln('исходный массив');
  printmas;
  select (a,n);
  gotoxy (3,13);
  writeln('вывод массива из головной программы после сортировки');
  Printmas;
  readkey;
end.