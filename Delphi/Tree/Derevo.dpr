program Derevo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  BT=LongInt;
  U = ^BinTree;
  BinTree = Record
     Inf : BT;
     L, R : U
  End;

Var
T:U;
xx, rec:integer;

Procedure InsRec(Var Tree : U; x : BT);
Begin
   If Tree = Nil
   Then Begin
	    New(Tree);
	    Tree^.L := Nil;
	    Tree^.R := Nil;
	    Tree^.Inf := x
	End
   Else If x < Tree^.inf
	Then InsRec(Tree^.L, x)
	Else InsRec(Tree^.R, x)
End;

Procedure sim_print(var x: U);
begin
  if x<>nil then
  begin
    sim_print(x^.L);
    write(x^.Inf,'  ');
    sim_print(x^.R);
  end;
end;

function find(Tree : U; x : BT) : boolean;
begin
  if Tree=nil then find := false
  else if Tree^.inf=x then Find := True
  else if x < Tree^.inf
        then Find := Find(Tree^.L, x)
  else Find := Find(Tree^.R, x)
end;

procedure sozd(var Tree: U);
var i, n: integer; a: bt;
begin
      Tree := nil;
      write('Сколько элементов? '); readln(n);
      for i:=1 to n do
      begin
        write('Введите очередной элемент: ');
        readln(a);
        InsRec(Tree, a)
      end
end;

begin
  WriteLn('  Создайте дерево !');
  WriteLn;
  sozd(T);
  WriteLn;
  WriteLn('  Дерево создано !');
  repeat
    Writeln;
    Writeln('Выберите действие :');
    Writeln('1. Добавить элемент.');
    Writeln('2. Поиск элемента.');
    Writeln('3. Симметрично-правый обход дерева.');
    Writeln('0. Выход из программы.');
    Writeln;
    readln(xx);
    case xx of
      1:begin
            write('Введите целое число : ');
            readln(rec);
            InsRec(T,rec);
            writeln('Элемент добавлен.');
          end;
      2:begin
            write('Введите искомое число : ');
            readln(rec);
            if find(T,rec)=True then
              writeln('Элемент ',rec,' найден.')
            else
              writeln('Элемент ',rec,' не найден.');
          end;
      3:begin
            sim_print(T);
          end;
    end;
  until xx=0;
end.
