{������� ������������ l,r ���������� � ������� summas 
� ����������� �� ��� ��������� k,n}
Uses Crt;
const n =20;
var A: array [1..n] of integer;
    i,l,r: integer;
    
Function summas(const k,n:integer): longint;
  var i: integer;
    temp: longint;
  begin
    temp:=0;
    for i:=k to n do
      temp:= temp+A[i];
    summas:=temp;
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
  GotoXY (20,5);
  Writeln('��������');
  Printmas;
  GotoXY (3,10);
  Writeln('������� ����� , ����� ������ ������� �������� ������� ��� ������������');
  readln(l,r);
  GotoXY (5,12);
  Writeln('����� ��������� ������� �',l,'��',r,'=', summas(l,r));{����� �������}
  readkey
end.