unit Model;

interface
uses System.SysUtils, Vcl.Dialogs;
type
   Node = ^TNode;
   TNode = record
      Value: string;
      Next : Node;
      Prev: Node;
   end;
type
  TList = class
   private first, last : Node;
   private counter: integer;
  public constructor Create();
  destructor Destroy() ; override;

  public function GetItem(var x: string):Node;
  public procedure Remove(var x: string);
  public procedure Add(var x: string);
  public function Scan():string;
  public function GetHashSymb(x: char): integer;
  public function GetHashWord(x: string): integer;

  private function  NewItem(x:string): Node;
  private procedure AddLast(var last: Node; x: string);
  private procedure AddFirst(var first: Node;x: string);
  private procedure AddPerFirst(var first: Node;x: string);
  private procedure RemoveFirst(var first,last:Node);
  private procedure RemoveLast(var first, last:node);
  private procedure RemoveEl(pnode:Node);
  private procedure InsertPrev(pnode:Node;x:string);
  private procedure InsertNext(pnode:Node;x:string);
  private procedure AddNext(x: string);
  private procedure Clear();

  end;

implementation
  constructor TList.Create;
  begin
   first:= nil;
   last:= nil;
   counter:= 0;
  end;
  destructor TList.Destroy;
  begin
   Clear;
  end;
  function TList.GetHashSymb(x: char): integer;
  var sum, num: integer;
  begin
    result:= ord(x);
  end;
  function TList.GetHashWord(x: string): integer;
  var sum, num: integer;
  begin
    sum:=0;
    for num:= 1 to Length(x)-1 do
     sum:= sum + ord(x[num]);
    result:= sum mod counter ;
  end;

  procedure TList.Add(var x: string);
  var p: Node;
  var h1,h2, num : integer;
  begin
    if first = nil then begin
     AddFirst(first,x);
     Inc(counter);
    end
   else AddNext(x);
  end;
  procedure TList.AddNext(x:string);
  var num,h,h1, symb:integer;
  var p: Node;
  begin
    if Length(x)< Length(first.Value) then begin
      AddPerFirst(first, x);
      exit;
    end;
    for num:= 1 to Length(x) do begin
      h:= GetHashSymb(x[num]);
      p:=first;
      while p<>nil do begin
        h1:=  GetHashSymb(p.Value[num]);
        if h = h1 then p:= p^.Next;
        if h1 < h then p:= p^.Next;
        if (h1 = 0)and (Length(p.Value)< Length(x))then begin
          AddLast(last, x);
          Inc(counter);
          exit;
        end;
        if h < h1 then begin
          if p.Prev <> nil then begin
            InsertPrev(p, x);
            Inc(counter);
            exit;
          end
          else begin
            AddPerFirst(first, x);
            Inc(counter);
            exit;
          end;
          if p.Next<> nil then begin
            InsertNext(p,x);
            Inc(counter);
            exit;
          end
          else begin
            AddLast(last,x);
            Inc(counter);
            exit;
          end;
        end;
      end;
    end;
  end;

  procedure TList.Remove(var x: string);
  var rec: Node;
  begin
    rec:= GetItem(x);
    if rec = nil then exit;
    if (rec^.Prev = first^.Prev) and (rec^.Next = first^.Next) then begin
     RemoveFirst(first, last);
     exit;
    end;
    if (rec^.Prev = last^.Prev) and (rec^.Next = last^.Next) then begin
     RemoveLast(first, last);
    end
    else RemoveEl(rec);
  end;

  procedure TList.Clear();
  var p: Node;
  begin
   if first = nil then exit;
   while first<>nil do begin
     p:= first;
     first:= first^.next;
     dispose(p);
   end;
   last:=nil;
  end;

  function TList.GetItem(var x: string):Node;
  var p:Node;
  begin
   p:= first;
   while (p<>nil) and (p^.Value<> x) do
     p:= p^.next;
   result:= p;
  end;

  function TList.Scan : string;
  var txt: string;
  var p: Node;
  begin
    p:= first;
    txt:='';
    while p<>nil do begin
      txt:= txt +p.Value + '|';
      p:=p^.Next;
    end;
    result:= txt;
  end;


  procedure TList.AddLast(var last: Node ;x: string);
  begin
    New(last^.Next);
    last^.Next^.Value:=x;
    last^.Next^.Prev:=last;
    last^.Next^.Next:=nil;
    last:=last^.Next;
  end;
  procedure TList.AddFirst(var first: Node ;x: string);
  var p:Node;
  begin
    New(p);
    p^.Value:=x;
    p^.Prev:= nil;
    p^.Next:= first;
    if first <> nil then first^.Prev := p
    else last:= p;
    first:= p;
  end;
  procedure TList.AddPerFirst(var first: Node; x: string);
  begin
    New(first^.Prev);
    first^.Prev^.Value:=x;
    first^.Prev^.Prev:=nil;
    first^.Prev^.Next:= first;
    first:=first^.Prev;
  end;

  function TList.NewItem(x: string): Node;
  var p: Node;
  begin
    New(Node);
    p^.Prev:= nil;
    p^.Next:= nil;
    p^.Value:= x;
    result:= p;
  end;
  procedure TList.RemoveFirst(var first,last:Node);
  begin
    if first = last then begin
      dispose(first);
      first:=nil;
      last:=nil;
    end
    else begin
      first:=first^.Next;
      dispose(first^.Prev);
      first^.Prev:=nil;
    end;
  end;
  procedure TList.RemoveLast(var first, last:node);
  begin
    if first=last then begin
      dispose(first);
      first:=nil;
      last:=nil;
    end
    else begin
      last:=Last^.Prev;
      dispose(last^.Next);
      last^.Next:=nil;
    end;
  end;
  procedure TList.RemoveEl(pnode:Node);
  begin
    pnode^.Next^.Prev:=pnode^.Prev;
    pnode^.Prev^.Next:=pnode^.Next;
    dispose(pnode);
  end;

  procedure TList.InsertNext(pnode:Node;x:string);
  begin
    new (pnode^.Next^.Prev);
    pnode^.Next^.Prev^.Value:=x;
    pnode^.Next^.Prev^.Prev:=pnode;
    pnode^.Next^.Prev^.Next:=pnode^.Next;
    pnode^.Next:=pnode^.Next^.Prev;
  end;
  procedure TList.InsertPrev(pnode:Node;x:string);
  begin
    new (pnode^.Prev^.Next);
    pnode^.Prev^.Next^.Value:=x;
    pnode^.Prev^.Next^.Prev:=pnode^.Prev;
    pnode^.Prev^.Next^.Next:=pnode;
    pnode^.Prev:=pnode^.Prev^.Next;
  end;

end.
