Uses Crt;
const n =20;
var A: array [1..n] of integer;
    i: integer;
    
Procedure Bubble;
  var i,j,temp: integer;
  Procedure exchange (k,l:integer);
    var temp: integer;
    begin
      temp:=A[k];
      A[k]:=A[l];
      A[l]:=temp;
    end;
  begin
    for i:=2 to n do
      for j:=n downto i do
        If A[j-1]>A[j] then
       exchange (j-1, j);
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
  Writeln('��������');
  Printmas;
  bubble;
  GotoXY (20,17);
  Writeln('���������������');
  printmas;
  readkey
end.