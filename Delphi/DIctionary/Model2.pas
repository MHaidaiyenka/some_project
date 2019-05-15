unit Model2;

interface
uses Model ;
type
 Dict = class(TObject)
 List: array of TList;

 public
  public constructor Create();
  destructor Destroy() ; override;
  function FHash(x: string):integer;
  function Hash(x : string): integer;
  function Find(x: string) : boolean;
  function Add(x:string): boolean;
  function Remove(x:string):boolean;
  function  GetList(x: string): TList;
  function Scan() : string;
End;

implementation

  constructor Dict.Create;
  var num: integer;
  begin
   SetLength(List, 256);
   for num:= 1 to 256 do
   List[num]:= TList.Create();
  end;

  destructor Dict.Destroy;
  var num: integer;
  begin
   for num:= 1 to 256 do
   List[num].Destroy();
  end;

  function Dict.FHash(x: string): integer ;
  begin
    result:= ord(x[1]) mod 256;
  end;

  function Dict.Hash(x: string): integer ;
  var sum, num: integer;
  begin
    sum:=0;
    for num:= 1 to Length(x)-1 do
     sum:= sum + ord(x[num]);
    result:= sum mod 256;
  end;

  function Dict.Add(x: string): boolean;
  var lst: TList;
  begin
    lst:= GetList(x);
    lst.Add(x);
    result:= Find(x);
  end;

  function Dict.Remove(x: string):boolean;
  var lst: TList;
  begin
    lst:= GetList(x);
    if lst = nil then result:= false;
    lst.Remove(x);
    result:= lst.GetItem(x) = nil;
  end;

  function Dict.GetList(x: string): TList;
  var h: integer;
  begin
    h:= FHash(x);
    result:= List[h];
  end;

  function Dict.Find(x: string):boolean;
  var lst: TList;
  begin
    lst:= GetList(x);
    if lst = nil then result:= false;
    result:= lst.GetItem(x)<> nil;
  end;

  function Dict.Scan () : string;
  var num:integer;
  var txt: string;
  begin
    if List = nil then
    begin
      writeln('Словарь пуст!');
      exit;
    end;
    txt:= '';
    for num:=1 to Length(List)-1 do begin
     if List[num]<>nil then txt := txt + List[num].Scan();
    end;
    result:= txt;
   end;
end.