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
      write('������� ���������? '); readln(n);
      for i:=1 to n do
      begin
        write('������� ��������� �������: ');
        readln(a);
        InsRec(Tree, a)
      end
end;

begin
  WriteLn('  �������� ������ !');
  WriteLn;
  sozd(T);
  WriteLn;
  WriteLn('  ������ ������� !');
  repeat
    Writeln;
    Writeln('�������� �������� :');
    Writeln('1. �������� �������.');
    Writeln('2. ����� ��������.');
    Writeln('3. �����������-������ ����� ������.');
    Writeln('0. ����� �� ���������.');
    Writeln;
    readln(xx);
    case xx of
      1:begin
            write('������� ����� ����� : ');
            readln(rec);
            InsRec(T,rec);
            writeln('������� ��������.');
          end;
      2:begin
            write('������� ������� ����� : ');
            readln(rec);
            if find(T,rec)=True then
              writeln('������� ',rec,' ������.')
            else
              writeln('������� ',rec,' �� ������.');
          end;
      3:begin
            sim_print(T);
          end;
    end;
  until xx=0;
end.
