program Slovar;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Model2 in 'Model2.pas';

var
TDict : Dict;
num : integer;
rec,word: string;
xx: integer;


procedure Initialize();
begin
  TDict:= Dict.Create;
end;
procedure Add(x: string);
begin
 if TDict.Add(x) = false then
 WriteLn('Элемент не создан!')
end;
procedure Viev();
var txt: string;
begin
 txt:= TDict.Scan;
 WriteLn;
 WriteLn('    Все элементы:');
 Writeln;
 WriteLn(txt);
 WriteLn;
end;
procedure Find(x :string);
begin
  if TDict.Find(x) = false then
  WriteLn('Элемент не найден!')
  else  WriteLn('Элемент найден!')
end;

function RandomWord(): string;
var i,n: integer;
var w: string;
begin
  w:='';
  for i:= 1 to 5 do begin
    n:= 97 + Random(15);
    w:= w + char(n);
  end;
  result:= w;
end;

begin
  Initialize();
  for num:= 1 to 20 do begin
    word:= RandomWord();
    Add(word);
  end;

  repeat
    Writeln;
    Writeln('Выбирите действие :');
    Writeln('1. Добавить элемент.');
    Writeln('2. Удалить элемент.');
    Writeln('3. Показать все элементы.');
    Writeln('4. Поиск элемента.');
    Writeln('0. Выход из программы.');
    Writeln;
    readln(xx);
    case xx of
      1:begin
            writeln('Введите значение : ');
            readln(rec);
            Add(rec);
          end;
      2:begin
            writeln('Введите значение : ');
            readln(rec);
            TDict.Remove(rec);
          end;
      3:begin
            Viev()
          end;
      4:begin
            writeln('Введите значение : ');
            readln(rec);
            Find(rec);
            readln;
          end;
    end;
  until xx=0;
end.
