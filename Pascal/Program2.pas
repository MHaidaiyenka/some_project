program p_1;
uses crt;
const
  n=30;
var
  sort:boolean;{задача 1}
  s,t_sredn:real; {среднее значение}
  p:integer;{методом пузырька}
  i,t_min,t_max,n_pol,x,candidat:integer;
  M:array[1..n] of integer;
begin
  clrscr;
  writeln('vvedite massiv iz ', n,' elementov');
  for i:=1 to n do 
    {read(M[i]);- ручной ввод}
    M[i]:=random(10)-5;{случайный набор чисел}
    writeln('vvedennie elementi massiva');
    for i:=1 to n do
      write(M[i]:4);
      writeln;
      writeln;
  
      
    {определение T_min}
  t_min:=M[1];
  for i:=2 to n do
    if M[i]<t_min then
    t_min:=M[i];
    
    {определение T_max}
  t_max:=M[1];
  for i:=2 to n do 
    if M[i]>t_max then
    t_max:=M[i];
    
    {определение среднего числа}
  S:=0;
  for i:=1 to n do
    s:=s+M[i];
    t_sredn:=s/n;
    
    {определение количества дней с положительной темпереатурой}
  n_pol:=0;
  for i:=1 to n do 
    if M[i]>0 then 
    n_pol:=n_pol+1;
    
       {вывод инфы}
  writeln('t_min= ',t_min,' t_max= ',t_max,' t_sredn= ',t_sredn,' n_pol= ',n_pol)  ;
  writeln;
    
    {линейная  сортировка массива}
  for i:=1 to n-1 do
    for candidat:=i+1 to n do
      if M[i]>M[candidat] then
        begin
         x:=M[i];
         M[i]:=M[candidat];
         M[candidat]:=x;
        end;
  writeln('lineyniy otsortirovanniy massiv');
        for i:=1 to n do 
          write(M[i]:4);
          writeln;
          writeln;
          
    {сортировка методом пузырька; можно через true false}
  repeat
  p:=0;
  {sort:boolean
    sort:=false}
  for i:=1 to n-1 do
      if M[i]>M[i+1] then
        begin
         x:=M[i];
         M[i]:=M[i+1];
         M[i+1]:=x;
         {sort:=true}
         P:=p+1;
        end;
  until p=0{sort:=false};
  writeln('otsortirovanniy massiv pyzirkom');
        for i:=1 to n do 
          write(M[i]:4);
          writeln;
          writeln;

  readln;
  readln;
end.
    
    
  