Uses Crt;
const n =20;
var A: array [1..n] of integer;
    i: integer;
    
Procedure Bubble;
  var i,j,temp: integer;
  begin
    for i:=2 to n do
      for j:=n downto i do
        If A[j-1]>A[j] then
        begin
          temp:=A[j-1];
          A[j-1]:= a[j];
          A[j]:=temp;
        End;
  end;
  
Procedure PrintMas;
  Var i:integer;
    begin
      for i:=1 to n do 
      write(A[i]:4);
      writeln;
    end;

Begin 
  ClrScr;
  for i:=1 to n do
    A[i]:=random(100);
  GotoXY (20,7);
  Writeln('исходный');
  Printmas;
  bubble;
  GotoXY (20,17);
  Writeln('отсортированный');
  printmas;
  readkey
end.