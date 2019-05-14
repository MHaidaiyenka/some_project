{    8. Информация о сотрудниках предприятия содержит ФИО, номер отдела,
должность, дату начала работы. Вывести список сотрудников заданного отдела,
проработавших на предприятии более 20 лет.
    В программе предусмотреть сохранение вводимых данных в типизированный файл 
 и возможность чтения из ранее сохраненного типизированного файла.
 Результаты выводить на экран и в текстовый файл.
}
Program KR_2_1;
Uses crt;
Type Anketa=Record
     FIO:string[30];
     God_prin:string[5];
     Dolj:string[15];
     Otdel:string[10];
     End;
Var f:file of Anketa;
    sotrudn:array[1..20] of anketa;
    f1:Anketa;
    n,x,i:integer;
    nf:string;
    
      procedure stag;
  var 
       otbor: text;
       sotr : Anketa;
       god, errcode, k : integer;
  begin
    assign(f,'C:\Anketa.dat');{открываю файл для записи}
    reset(f);
    assign(otbor,'C:\vivod_stag.dat');{создаю и закрываю файл}
    rewrite(otbor);
    close(otbor);
    writeln('вывод сотрудников со стажем больше 20 лет');
    writeln;
    while not eof (f) do begin {считываение данных}
         Read(f, sotr);
         val(sotr.God_prin, god, errcode);
         if errcode<>0 then WriteLn('Ошибка в записи года принятия сотрудника ',sotr.FIO)
         else begin {отбор нужных}
             k:=2018-god;
            if k>=20 then
            begin
                   writeln;
                   writeln (sotr.FIO,' ....стаж: ',k);
                   writeln;
                   assign(otbor,'C:\vivod_stag.dat');{открываю и дописываю  в файл
                   , после закрываю}
                   append(otbor);
                   writeln(otbor,sotr.FIO);
                   close(otbor); 
            end;  
         end;
      end;
      close(f)
   end;
    
Procedure Zapoln(n:integer); {запись сотрудников в файл}
Var i:integer;
Begin
  Assign(f,'C:\Anketa.dat');
  Rewrite(f);
    For i:=1 to n do 
    Begin
      WitH sotrudn[i] do
      Begin
        write('‚Введите Ф.И.О  [',i,'] -го сотрудника : ');readln(FIO);
        write('‚Введите год принятия[',i,'] -го сотрудника : ');readln(God_prin);
        write('‚Введите должность [',i,']-го сотрудника: ');readln(Dolj);
        write('‚Введите отдел [',i,'] -го сотрудника :');readln(Otdel);
      End;
    write(f,sotrudn[i]);
    End;
End;

Begin {основная программа, выбор действий}
    clrscr;
    Repeat
    Writeln('1: Заполнение анкет сотрудников, если запускается первый раз');
    Writeln('2: Просмотр анкет сотрудников');
    Writeln('3: Добавление новых анкет сотрудников, если запускается не первый раз');
    Writeln('4: Вывод сотрудников со стажем больше 20 лет ');
    Writeln('5: Выход');
    Write('‚Введите число 1-5: ');readln(x);
    Case x of
      1:Begin
        clrscr;
        Write('‚Введите количество сотрудников: ');readln(n);Zapoln(n);End;
      2:Begin  
          clrscr;
          if (FileExists('C:\Anketa.dat')=false) then
          begin
           writeln;
           writeln('         ФАЙЛА НЕ СУЩЕСТВУЕТ ! НАЖМИТЕ 1  ДЛЯ СОЗДАНИЯ     !');
           writeln;
          end
          else 

          begin
          assign (f,'C:\Anketa.dat');
            reset(f);
            Writeln('‘Список анкет сотрудников :');
            while not eof(f) do {вывод внесенных сотрудников}
              begin
                read (f,f1);
                writeln;
                Writeln ('ФИО         :',f1.FIO,' ');
                Writeln ('Год принятия:',f1.God_prin,' ' );
                Writeln ('Должность   :',f1.Dolj,' ');
                Writeln ('Отдел       :',f1.Otdel,' ');
                writeln;
              end;
           end
         end;
      3:Begin
          clrscr;
          if (FileExists('C:\Anketa.dat')=false) then
          begin
           writeln;
           writeln('      ФАЙЛА НЕ СУЩЕСТВУЕТ ! НАЖМИТЕ 1  ДЛЯ СОЗДАНИЯ     !');
           writeln;
          end
          else 
         begin
          assign (f,'C:\Anketa.dat');
          reset(f);
          seek (f,filesize(f)); {дописывание в файл}
            WitH f1 do 
            Begin
              write('‚Введите Ф.И.О сотрудника :');readln(FIO);
              write('‚Введите год принятия сотрудника : ');readln(God_prin);
              write('‚Введите должность сотрудника : ');readln(Dolj);
              write('‚Введите отдел сотрудника :');readln(Otdel);
            End;
          write(f,f1);
          end;
        End;
      4:begin
      clrscr;
      if (FileExists('C:\Anketa.dat')=false) then
          begin
           writeln;
           writeln('       ФАЙЛА НЕ СУЩЕСТВУЕТ ! НАЖМИТЕ 1  ДЛЯ СОЗДАНИЯ     !');
           writeln;
          end
          else 
          begin 
          stag;
          end;
        end;
    End;
    Until x=5;
End.