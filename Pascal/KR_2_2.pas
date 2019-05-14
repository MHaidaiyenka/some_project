{Создать однонаправленную очередь с числами в диапазоне от –50 до +50.
После создания очереди выполнить индивидуальное задание. В конце работы
все очереди должны быть удалены.
8. Поместить максимальный элемент очереди на первую позицию.
}
program Ochered2_2;
uses crt;
type
  Element = Integer; {Тип основных данных.}
  T_adres = ^TElem;  {Тип указателя на элемент очереди.}
  TElem = record     {Тип элемента очереди.}
    Data : Element;   {Основные данные.}
    P_Sled : T_adres; {Указатель на следующий элемент очереди.}
          end;
  {Тип, определяющий очередь.}
  Ochered = record
    P_perv, P_posl : T_adres; {Указатели на первый и на последний 
    элементы очереди.}
           end;
 
{Начальная инициализация очереди.  Эту процедуру можно выполнять
только в отношении пустой очереди. Иначе будут утечки памяти.}
procedure Inicializacia(var z : ochered);
  begin
    z.P_perv := nil;
    z.P_posl := nil;
  end;
 
{Добавление элемента в конец очереди.}
procedure Dobavlenie (var z : ochered; const znach1 : Element);
var
  D_Elem : T_adres;
  begin
    New(D_Elem);           {Выделение памяти для элемента.}
    D_Elem^.Data := znach1; {Записываем основные данные.}
    D_Elem^.P_Sled := nil;  {Т. к., элемент добавляется в конец очереди,
    то указатель на следующий элемент = NIL.}
    if z.P_perv = nil then {Если очередь пуста, то новый элемент становится 
    первым элементом очереди.}
    z.P_perv := D_Elem
  else                    {Если очередь непустая, то новый элемент 
  прикрепляем к последнему элементу очереди.}
    z.P_posl^.P_Sled := D_Elem;
    z.P_posl := D_Elem; {Добавленный элемент становится последним 
    элементом очереди.}
  end;
 
{Изъятие элемента из начала очереди}
function Ubrat(var z : ochered; var aData : Element) : Boolean;
  var
  U_Elem : T_adres;
  begin
  Result := False;
    U_Elem := z.P_perv;
    if U_Elem <> nil then
      begin
        aData := U_Elem^.Data;      {Читаем данные первого элемента очереди.}
        z.P_perv := U_Elem^.P_Sled; {Первым элементом очереди становится 
        тот элемент,который раньше был вторым.}
      if z.P_perv = nil then    {Если очередь оказалась пустой, 
      то инициализируем её.}
        Inicializacia(z);
      Dispose(U_Elem); {Освобождаем память, занятую для элемента.}
      Result := True;
      end;
  end;
 
{очистка очереди}
procedure ochistka(var z : ochered);
var
  Data : Element;
begin
  while Ubrat(z, Data) do;
end;
 
{Распечатка очереди в направлении: начало - конец.}
procedure Pechat(const z: ochered);
var
  P_Elem : T_adres;
begin
  P_Elem := z.P_perv;
  if P_Elem <> nil then
  repeat
    if P_Elem <> z.P_perv then {Если это не первый элемент очереди,
    то ставим перед ним запятую.}
      Write(', ');
    Write(P_Elem^.Data);    {Распечатка основных данных элемента.}
    P_Elem := P_Elem^.P_Sled; {Указатель на следующий элемент.}
  until P_Elem = nil
  else
    Write('Очередь пуста.');
  Writeln;
end;
 
{основная программа}
var
  p_max,k:t_adres;
  och1: ochered;
  Data, DFind, DNew : Element;
  i,M,l : Integer;
  S : String;
begin
  Write('Введите количество элементов очереди :    ');
  Read(M);
  Writeln;
  {Начальная инициализация очереди.}
  Inicializacia(och1);
 
  repeat
    {Добавление элементов в очередь.}
    Randomize;
    for i := 1 to M do
      Dobavlenie(och1, Random(101)-50); {Целые числа из диапазона -50..50.}
    Writeln('Составлена исходная очередь (начало - конец):');
    Pechat(och1);
    writeln;
    
    {находим максимальный элемент}
    if och1.P_perv<>nil then
    begin
      p_max:=och1.P_perv;
      k :=  och1.P_perv;
      while k<>nil do
        begin
          if k^.data>p_max^.data then p_max := k;
          k:=k^.P_Sled; {Указатель на следующий элемент.}
        end;
      writeln ('максимальный элемент = ', p_max^.data);
      writeln;
      writeln;
      writeln;

      {меняем местами данные первого и наибольшего}
      if p_max <> och1.P_perv then begin
        l := p_max^.data;
        p_max^.data := och1.P_perv^.data ;
        och1.P_perv^.data := l
      end;

      Writeln('Очередь после замены максимального на первый (начало - конец):');
      Pechat(och1);
      writeln;
      writeln;
      
    end
   else
     WriteLn('Очередь Пуста!');

    {Освобождение памяти, выделенной для элементов очередей.}
    ochistka(och1);
    Writeln('Память, выделенная для очередей, освобождена.');
    writeln;
 
    Writeln('Повторить - Enter, выход - любой символ + Enter.');
    readln;
    Readln(S);
  until S <> '';
end.
