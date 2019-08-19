{п.1. – Напечатать слова, отличные от последнего слова, 
если они удовлетворяют следующему условию: слово совпадает 
с начальным отрезком латинского алфавита (a, ab, abc и т.д.); 
учесть, что в диапазоне 'a' .. 'z' могут быть литеры, 
отличные от латинских букв.
 п.2. - Напечатать слова, отличные от последнего слова, 
перенося последнюю букву в начало слова.
}
program ipr2;
uses crt;
const Sabc='abcdefghijklmnopqrstuvwxyz';
var S,S1,S2,Svrem,Sposl :string;
i:integer;
flag:boolean;

{Ввод строки и проверка присутствия ошибочных символов}
begin
  while 1=1 do 
  begin
    flag:=false;
    writeln('vvod stroki simvolov: ');
    readln(S);
      for i:=1 to length(S) do 
      begin
        case S[i] of 'a'..'z',' ':flag:=true; else 
          begin
          write('Nepravelniy vvod , ');
          flag:=false;
          break;
          end;
        end;
      end;
    if flag=true then break;
  end;

{Удаление ненужных пробелов в конце строки}
  while S[length(S)]=' ' do delete(S,length(S),1);

{Нахождение последнего слова}
  while S[length(S)]<>' ' do 
  begin
      insert(S[length(S)],Sposl,1);
      delete(S,length(S),1);
  end;

{Находение слов и распределение их по строкам}
i:=1;
  repeat if S[i]<>' ' then Svrem:=concat(Svrem,S[i]) else
    begin
      if Svrem<>Sposl then 
        begin
          if Svrem=copy(Sabc,1,length(Svrem)) then S1:=concat(S1,Svrem,' ');
          S2:=S2+copy(Svrem,length(Svrem),1)+copy(Svrem,1,length(Svrem)-1)+' ';
          Svrem:='';
        end
      else Svrem:='';
    end; 
  inc(i);
  until i=length(S)+1;

  {Вывод результатов}
  writeln('S1: ',S1);
  Writeln('S2: ',S2);
  repeat until keypressed;

end.
