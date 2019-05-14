uses crt;
const
  fName = 'tree.dat';
 
{ Создание файла (ибо у меня небыло начальных данных ;-)}
procedure createFile;
begin
  randomize;
  var f : Text;
  Rewrite(f, fName);
  for var i := 1 to 100 do WriteLn(f, Random(-100, +100));
  Close(f);
end;
  
type
  tTree = class
    V : Integer;
    L, R : tTree;
    
    constructor (V : Integer);
    begin
      Self.V := V; L := nil; R := nil;
    end;
    
    procedure Add(V : Integer);
    begin
      if V < Self.V then
        if L = nil then L := New tTree(V) else L.Add(V)
      else if V > Self.V then
        if R = nil then R := New tTree(V) else R.Add(V);
    end;
    
    function Count : Integer := 1 + (L = nil ? 0 : L.Count) + (R = nil ? 0 : R.Count);
    
    function Width := 1 + max(L = nil ? 0 : L.Count, R = nil ? 0 : R.Count);
    
    function Get(var k : Integer) : integer;
    begin
      k -= 1;
      if k = 0 then Result := V
      else
        begin
          if L <> nil then Result := L.Get(k);
          if (k > 0) and (R <> nil) then Result := R.Get(k);
        end;
    end;
    
    function inTree(V : Integer) : Boolean;
    begin
      case Sign(V - Self.V) of
        -1 : Result := L <> nil ? L.inTree(V) : False;
         0 : Result := True;
        +1 : Result := R <> nil ? R.inTree(V) : False;
      end;
    end;
    
  end; // tTree
 
/// Создание бинарного дерева из файла
function createTree : tTree;
begin
  Result := nil;
  var v : Integer;
  foreach var s in ReadLines(fName) do
    begin
      if TryStrToInt(s, v) then
        if Result = nil then
          Result := New tTree(v)
        else
          Result.Add(v);
    end;
end;
 
function almostEqual(Tree : tTree) : Integer;
begin
  var L := (Tree.L = nil ? 0 : Tree.L.Count);
  var R := (Tree.R = nil ? 0 : Tree.R.Count);
  Result := (Abs(L - R) = 1 ? 1 : 0);
  if Tree.L <> nil then Result += almostEqual(Tree.L);
  if Tree.R <> nil then Result += almostEqual(Tree.R);
end;
 
function searchSheet(k : Integer; Tree : tTree) : String;
begin
  if k < 1 then Result := 'номер листа - это натуральное число!'
  else if k > Tree.Count then Result := 'количество листов в дереве меньше заданного значения!'
  else Result := Tree.Get(k).ToString;
end;
 
begin
  {раскомментировать для того, чтобы создать файл с высотой дерева не более 500} 
  repeat
    createFile;
  until createTree.Width < 500;
  
  var Tree := createTree;
  WriteLn('Дерево сформировано. Общее количество элементов = ', Tree.Count);
  WriteLn;
  WriteLn('Количество вершин, у которых количество потомков в левом поддереве');
  WriteLn(' отличается от количества потомков в правом поддереве на единицу = ', almostEqual(Tree));
  WriteLn;
  WriteLn('Высота дерева = ', Tree.Width);
  WriteLn;
  WriteLn('Значение искомого листа = ', searchSheet(ReadInteger('Номер искомого листа: k ='), Tree));
end.