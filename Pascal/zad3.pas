{�. ���� ��� ������� M_l � �_2, ��������� �������������� 
�� n_l= 15 � �_2= 10 ������������� ���������. � ������ �_� 
�������� �� �������� �������n M_l � �_2, ������� ������� � 
������ �� ���, � � ������ �_ 4 ���������� ��������, ������� 
��������� ���� � M_l, ���� � �_2. }
program zad_3;
uses crt;
const
  n_1=15;
  n_2=10;
type
  n_0=0..n_1+n_2;
  mas=array[n_0] of integer;
var
  n_otr:integer;
  bool:boolean;
  i,j,k,r:integer;
  M1:array[1..n_1] of integer;
  M2:array[1..n_2] of integer;
  M3,M4:mas ;
   
begin
  clrscr;
  writeln('vvedite massiv m1 iz ', n_1,' elementov');
  for i:=1 to n_1 do 
    {read(M[i]);- ������ ����}
    M1[i]:=random(25)-5;{��������� ����� �����}
    writeln('vvedennie elementi massiva');
    for i:=1 to n_1 do
      write(M1[i]:4);
      writeln;
      writeln;
 writeln('vvedite massiv m2 iz ', n_2,' elementov');
  for i:=1 to n_2 do 
    {read(M[i]);- ������ ����}
    M2[i]:=random(25)-5;{��������� ����� �����}
    writeln('vvedennie elementi massiva');
    for i:=1 to n_2 do
      write(M2[i]:4);
      writeln;
      writeln;
{������������ �������� �� � �4}
  k:= 0; 
  r:= 0;
  for i:= 1 to n_1 do
  begin 
    Bool:= false; 
    for j:= 1 to n_2 do
      if M1[i] = M2[j] then;
        Bool:= true; 
        if Bool= true then
          begin
            k:= k+1; 
            M3[k]:= M1[i] 
          end
        else 
          begin
          r:= r+1; 
          M4[r]:= M1[i] 
          end;
  end;
  Writeln('Macc�� �� �� ',k,' ���������:'); 
  for i:= 1 to k do
    Write(M3[i] :4); 
  Writeln; 
  Writeln ('������ �4 �� ', r,' ���������: '); 
    for i := 1 to r do
    Write(M4[i] :4);
  
end.

