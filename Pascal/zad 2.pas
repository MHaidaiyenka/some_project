{2.задан массив м , состоящий из n элементов  
определите суммы S_1 i S_2 соответственно с 
четными и нечетными номерами. если S_1>S_2 
то поменяйте местами каждую соседню пару,
если S_1<S_2 , то поменяйте местами первый с последнимб
второй с предпоследним}
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
    {read(M[i]);- ручной ввод}
    M[i]:=random(25)-5;{случайный набор чисел}
    writeln('vvedennie elementi massiva');
    for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;

{Оnределение значений S1 и 52}
  S1:= 0; s2:= 0;
  for i:= 1 to n do 
    if M[i]> 0 then
      if Odd(i) then {возвращает true
      если аргумент нечетный,и false в противном случае}
      s2:= s2 + M[i]
    else
      s1:= S1 + M[i];
    Writeln('S1= ',S1, 's2= ',S2);
    
{Перестановки массива М} 
  if s1> s2 then 
    begin
    if Odd(n){Ecли длина массива нечетная} then
      n_ch:= n-1 else
      n_ch:= n;
      for i:= 1 to n_ch-1 do 
        begin 
          x:=M[ i];
          M[i]:= M[i+1];
          M[i+1]:=x;
        if i< n-1 {Исключаем выход за верхнюю границу цикла} then
          
        end; 
    end;
  
    for i:= 1 to trunc(n/2) do 
    begin
      x:= M[i]; 
      M[i]:=M[n-(i-1)];
      M[n+1-i]:= x; 
    end; 
  Writeln ('Результаты обработки массива М: ') ;
  for i:= 1 to n do 
  Write(M[i]:6); 
  Readln; 
end.
