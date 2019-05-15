program Pref_postf;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
    Node =^TNode;
    TNode = record
      Data: Char;
      Next: Node;
    end;
Type
    Stack = class(TObject)
      Head: Node;
      Count: Integer;
  public constructor Sozd();
  public destructor Ydal();
  public procedure Sdvig(var val: Char);
  public function Pp(var val: Char): Char;
  public function Pros(): Char;
  end;



constructor Stack.Sozd;
    begin
      Head:=nil;
      Count:= 0;
    end;
destructor Stack.Ydal;
    var n: Node;
    begin
       while Head<> nil do
       begin
         n:= Head;
         Head:= Head^.Next;
         Dispose(n);
       end;
    end;
procedure Stack.Sdvig(var val: Char);
    var n: Node;
    begin
      New(n);
      n^.Data:= val;
      n^.Next:= Head;
      Head:= n;
      Inc(Count);
    end;
function Stack.Pp(var val: Char): Char;
    begin
      val:= Head.Data;
      Head:= Head.Next;
      Dec(Count);
      result:= val;
    end;
function Stack.Pros(): Char;
    begin
       result:= Head.Data;
    end;

 var
 Stack1: Stack;
 Rang: Integer;
 Input, Output: string;

function Prioritet(var val: Char; proverka : boolean): Integer;
var res: Integer;
 begin
    case val of
      '(': res:= 0;
      '+', '-': res:= 2;
      '*', '/': res:= 4;
      '^': res:= 5;
      'a'..'z', 'A'..'Z':  res:= 8;
    end;
    if proverka then result:= res
    else
    begin
      if val = '(' then result:= 9;
      if val = ')' then result:= 0
      else result:= res - 1;
    end;
 end;

 function Swap(var expression:string): string;
 var num: integer;
 var tmp: string;
 begin
  tmp:= '';
  for num:= Length(expression) downto 1 do
    tmp:= tmp + expression[num];
  result:= tmp;
 end;

 function ConvertToPref(expression:string): string;
 var num: Integer;
 var in_op, top_op: Integer;
 var tmp: Char;
 var txt: string;
 begin
  rang:=0;
  num:=1;
  txt:='';
  while num <= Length(expression) do
   begin
    in_op:=  Prioritet(expression[num], false);
    if 0 < Stack1.Count then
    begin
      tmp:= Stack1.Pros();
      top_op:= Prioritet(tmp, true)
    end
    else top_op:= 0;

    if (Stack1.Count = 0) or ( top_op < in_op ) then
    begin
      if expression[num]<> ')' then
        Stack1.Sdvig(expression[num]);
      Inc(num);
    end
    else
    begin
      tmp:= Stack1.Pros();
      tmp:= Stack1.Pp(tmp);
      if tmp <>'(' then
      begin
        txt:= txt + tmp;
        if tmp in ['a'..'z', 'A'..'Z'] then Inc(rang)
        else Dec(rang);
      end;
    end;
  end;

  while Stack1.Count<> 0 do
  begin
    tmp:= Stack1.Pros();
    tmp:= Stack1.Pp(tmp);
    if tmp<>'(' then
      txt:= txt + tmp;
  end;
  result:= txt;
 end;

 begin
   Stack1:= Stack.Sozd;
   WriteLn('Введите выражение, которое требуется преобразовать:');
   Readln(Input);
   Input:= Swap(Input);
   Output:= ConvertToPref(Input);
   WriteLn('Выражение в постфиксной форме:', Output);
   WriteLn('Ранг выражения: ' ,rang);
   Output:= Swap(Output);
   WriteLn('Выражение в префиксной форме:', Output);
   Readln;
   Stack1.Ydal();
 end.
