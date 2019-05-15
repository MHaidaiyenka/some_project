calculation of matrices using the  Cholesky method

Program Holeckiy;
uses crt;
Type
  MA=Array [1..100,1..100] of Real;
  VB=Array [1..100] of Real;
var
A: MA;
B: VB;
n,z,p: byte;

Procedure Vvod(var a: MA; var b: VB);
var
i,j: byte;
begin
  writeln('Введите матрицу А(',n,'x',n,')');
  for i:=1 to n do
    for j:=1 to n do
      begin
        write('а(',i,',',j,')=');
        read(a[i,j]);
      end;
  writeln('Введите вектор В(',n,')');
  for i:=1 to n do
    begin
      write('b(',i,')=');
      read(b[i]);
    end;
end;

Procedure Prov(var a: MA; var b: VB);
var
at, asim: MA;
i,j,k: byte;
begin
  for i:=1 to n-1 do
    begin
      for j:=i+1 to n do
        if a[i,j]<>a[j,i] then
          begin
            writeln('Матрица А - несимметричная.');
            break;
          end
        else
          begin
          writeln('Матрица А - симметричная.');
          exit
          end;
      break;
    end;
  for i:=1 to n do
    a[i,n+1]:=b[i];
  for i:=1 to n do
    for j:=1 to n+1 do
      at[j,i]:=a[i,j];
  for i:=1 to n+1 do
    for j:=1 to n+1 do
      asim[i,j]:=0;
  for i:=1 to n+1 do
    for j:=1 to n+1 do
      for k:=1 to n do
        asim[i,j]:=asim[i,j]+at[i,k]*a[k,j];
  for i:=1 to n do
    begin
      for j:=1 to n do
        a[i,j]:=asim[i,j];
      b[i]:=asim[i,n+1];
    end;
end;

Procedure Holet(var a: MA; var b: VB; var ex: byte);
var
L: MA;
y,x: VB;
k,l2,l3: byte;
l1: real;
begin
  for k:=1 to n do
    if a[k,k]=0 then
      begin
        writeln('Главная диагональ содержит ноль.');
        ex:=0;
        exit;
      end;
  for k:=1 to n do
    begin
      l1:=0;
        for l3:=1 to k-1 do
          l1:=l1+sqr(L[k,l3]);
      L[k,k]:=sqrt(a[k,k]-l1);
      l1:=0;
        for l3:=k+1 to n do
          begin
            for l2:=1 to k-1 do
              l1:=l1+L[l3,l2]*L[k,l2];
            L[l3,k]:=(a[l3,k]-l1)/L[k,k];
          end;
    end;
  for k:=1 to n do
    begin
      l1:=0;
        for l3:=1 to k-1 do
          l1:=l1+L[k,l3]*y[l3];
      y[k]:=(b[k]-l1)/L[k,k];
    end;
  for k:=n downto 1 do
    begin
      l1:=0;
        for l3:=n downto k do
          l1:=l1+L[l3,k]*x[l3];
      x[k]:=(y[k]-l1)/L[k,k];
    end;
  for k:=1 to n do
    b[k]:=x[k];
  ex:=2*n*n;
end;

begin
  write('Введите количество уравнений n:');
  read(n);
  Vvod(A,B);
  Prov(A,B);
  Holet(A,B,p);
    for z:=1 to n do
      writeln('x(',z,')=',B[z]);
  writeln('Кличество операций p=',p);
end.