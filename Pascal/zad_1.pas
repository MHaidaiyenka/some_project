{1.������ , ��������� �� 30 ���������, ��������������� ���,
  ����� ������� ������ ��� ������������� �������� � ������ 0
  � ������� ��������,� ����� ��� ������������� � ������� �����������}
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
    {read(M[i]);- ������ ����}
    M[i]:=random(25)-5;{��������� ����� �����}
    writeln('vvedennie elementi massiva');
    for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;
      
 {���������� �������������/�������������}
  i:=1;
  j:=n;
  while i<j do{������� ������ �� �����}
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
  writeln('������ ����� ��������� ���/���');
  for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;
 {����������� ����� ������������� ��������� }
 n_otr:=0;
 for i:=1 to n do 
  if M[i]<0 then
    n_otr:=n_otr+1;
 writeln('n_otr= ',n_otr);
 writeln;
 writeln;
      
 {�������� ���������� ��������������� ���������
 �� ��������� �� ��������}
 for i:=1 to n-n_otr-1 do 
  for j:=i+1 to n-n_otr-1 do
    if M[i]<M[j] then
    begin
      x:=M[i];
      M[i]:=M[j];
      M[j]:=x;
    end;
 {�������� ���������� ������������� ���������
 �� �����������  �� ��������} 
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
  writeln('������ ����� 2� ����������');
  for i:=1 to n do
      write(M[i]:4);
readln;
readln;

End.