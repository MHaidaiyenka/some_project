{2.����� ������ � , ��������� �� n ���������  
���������� ����� S_1 i S_2 �������������� � 
������� � ��������� ��������. ���� S_1>S_2 
�� ��������� ������� ������ ������� ����,
���� S_1<S_2 , �� ��������� ������� ������ � ����������
������ � �������������}
program zad_1;
uses crt;
const
  n=30;
var
  n_ch:integer;
  s1,s2,x,i:integer;
  M:array[1..n] of integer;
begin
  clrscr;
  writeln('vvedite massiv iz ', n,' elementov');
  for i:=1 to n do 
    {read(M[i]);- ������ ����}
    M[i]:=random(25)-5;{��������� ����� �����}
    writeln('vvedennie elementi massiva');
    for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;

{�n��������� �������� S1 � 52}
  S1:= 0; s2:= 0;
  for i:= 1 to n do 
    if M[i]> 0 then
      if Odd(i) then {���������� true
      ���� �������� ��������,� false � ��������� ������}
      s2:= s2 + M[i]
    else
      s1:= S1 + M[i];
    Writeln('S1= ',S1, 's2= ',S2);
    
{������������ ������� �} 
  if s1> s2 then 
    begin
    if Odd(n){Ec�� ����� ������� ��������} then
      n_ch:= n-1 else
      n_ch:= n;
      for i:= 1 to n_ch-1 do 
        begin 
          x:=M[ i];
          M[i]:= M[i+1];
          M[i+1]:=x;
        if i< n-1 {��������� ����� �� ������� ������� �����} then
          
        end; 
    end;
  
    for i:= 1 to trunc(n/2) do 
    begin
      x:= M[i]; 
      M[i]:=M[n-(i-1)];
      M[n+1-i]:= x; 
    end; 
  Writeln ('���������� ��������� ������� �: ') ;
  for i:= 1 to n do 
  Write(M[i]:6); 
  Readln; 
end.
