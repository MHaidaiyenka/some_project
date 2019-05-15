calculation of matrix using the Gauss method

Program Gauss;
uses crt;
Type
MasA = Array [1..100,1..100] of real;
VecB = Array [1..100] of real;
var
n,K: byte;
A: MasA;
B: VecB;

Procedure Vvod;
var
i,j: byte;
begin
  write('Введите количество уравнений n: ');
  read(n);
  writeln('Введите матрицу А(',n,'x',n,')');
  for i:=1 to n do
    for j:=1 to n do
      begin
        write('а(',i,',',j,')=');
        read(a[i,j]);
      end;
  writeln('Введите  В(',n,')');
  for i:=1 to n do
    begin
      write('b(',i,')=');
      read(b[i]);
    end;
end;

Procedure SIMQ(Nn:byte; var Aa:MasA; var Bb:VecB; var Ks: byte);
Label M1;
const
Eps = 1e-21;
var
i,j,K1,l: byte;
Max,U,V: real;
begin
  for i:=1 to Nn do
    Aa[i,Nn+1]:=Bb[i];
  for i:=1 to Nn do
    begin
      Max:=abs(Aa[i,i]);
      K1:=i;
        for l:=i+1 to Nn do
          if (abs(A[l,i])>Max) then
            begin
              Max:=abs(Aa[l,i]);
              K1:=l;
            end;
          if (Max<Eps) then
            begin
              Ks:=1;
              writeln('Данная система уравнений имеет больше одного решения');
              Goto M1;
            end
          else
            Ks:=0;
          if K1 <> i then
        for j:=1 to Nn+1 do
          begin
            U:=Aa[i,j];
            Aa[i,j]:=Aa[K1,j];
            Aa[K1,j]:=U;
          end;
    V:=Aa[i,i];
    for j:=i to Nn+1 do
      Aa[i,j]:=Aa[i,j]/V;
    for l:=i+1 to Nn do
      begin
        V:=Aa[l,i];
          for j:=i+1 to Nn+1 do
            A[l,j]:=Aa[l,j]-Aa[i,j]*V;
      end;
    end;
  Bb[Nn]:=Aa[Nn,Nn+1];
  for i:=Nn-1 downto 1 do
    begin
      Bb[i]:=Aa[i,Nn+1];
        for j:=i+1 to Nn do
          Bb[i]:=Bb[i]-Aa[i,j]*Bb[j];
    end;
    for i:=1 to Nn do
      writeln('x(',i,')=', Bb[i]);
      writeln('Признак правильности решения K=',Ks);
  M1: end;

begin
  K:=0;
  Vvod;
  SIMQ(n, A, B, K);
end.