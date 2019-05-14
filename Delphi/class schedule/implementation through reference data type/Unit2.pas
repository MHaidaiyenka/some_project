unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, frxOLE,comObj, frxClass;
const fname:string='input.dat';
type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StringGrid1: TStringGrid;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    SaveDialog1: TSaveDialog;
    N4: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  word:variant;

Type
  prasp=^raspisanie;
  raspisanie = record
      day:string[15];
      pred:string[30];
      prep:string[30];
      tip:string[20];
      cab:string[5];
  next:prasp;
  end;
type
  zap=record
     day:string[15];
     pred:string[30];
     prep:string[30];
     tip:string[20];
     cab:string[5];
  end;

Var
  pnote:prasp;
  zapfile: file of zap;
  i:integer;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4;

procedure ClearStringGrid();
var
  i,j:integer;
  begin
    for i := 0 to form2.StringGrid1.ColCount-1 do
      for j := 1 to form2.StringGrid1.RowCount-1 do
        form2.StringGrid1.Cells[i,j]:='';
          form2.StringGrid1.RowCount:=1;
  end;

procedure showlist(pnote:prasp);
var
  k:integer;ptemp:prasp;
  begin
    k:=1;
    ClearStringGrid;
    if (pnote<>nil) then
      begin
        ptemp:=pnote;
        while ptemp<>nil do
          begin
            form2.StringGrid1.RowCount:=form2.StringGrid1.RowCount+1;
            form2.StringGrid1.Cells[0,k]:=ptemp^.day;
            form2.StringGrid1.Cells[1,k]:=ptemp^.pred;
            form2.StringGrid1.Cells[2,k]:=ptemp^.prep;
            form2.StringGrid1.Cells[3,k]:=ptemp^.tip;
            form2.StringGrid1.Cells[4,k]:=ptemp^.cab;
            ptemp:=ptemp^.next;
            k:=k+1;
          end;
      end;
  end;

procedure addtolist(var pnote:prasp; zap2:zap);
var
  ptemp:prasp;
  pnew:prasp;
  begin
    new (pnew);
    pnew^.day:=zap2.day;
    pnew^.pred:=zap2.pred;
    pnew^.prep:=zap2.prep;
    pnew^.tip:=zap2.tip;
    pnew^.cab:=zap2.cab;
    pnew^.next:=nil;
     if (pnote=nil) then pnote:=pnew
     else
      begin
        ptemp:=pnote;
        while ptemp^.next<>nil do
          ptemp:=ptemp^.next;
          ptemp^.next:=pnew;
      end;
  end;

Procedure removefromlist(var pnote:prasp;k:integer);
var
  ptemp:prasp;
  i:integer;
  pdel:prasp;
  begin
    if (k=1) then
      begin
        pdel:=pnote;
        pnote:=pnote^.next;
      end
    else
      begin
        i:=2;
        ptemp:=pnote;
        while (i<k) do
          begin
            ptemp:=ptemp^.next;
            i:=i+1;
          end;
        pdel:=ptemp^.next;
        ptemp.next:=pdel.next;
      end;
    dispose(pdel);
  end;

procedure loadfromfile(var plist:prasp);
var
  zap3:zap;
  begin
    i:=0;
    plist:=nil;
    assignfile(zapfile,fname);
    reset(zapfile);
    while not eof(zapfile) do
      begin
        read(zapfile,zap3);
        addtolist(plist,zap3);
        i:=i+1;
      end;
    closefile(zapfile);
  end;

Procedure savetofile(pnote:prasp);
var
  zap3:zap;
  begin
    assignfile(zapfile,fname);
    rewrite(zapfile);
    while pnote<>nil do
      begin
        zap3.day:=pnote.day;
        zap3.pred:=pnote.pred;
        zap3.prep:=pnote.prep;
        zap3.tip:=pnote.tip;
        zap3.cab:=pnote.cab;
        write(zapfile,zap3);
        pnote:=pnote.next;
      end;
     closefile(zapfile);
  end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 Form2.Close;
 Form3.Showmodal;
 if Length(form3.zap1.pred)>0 then
  begin
      i:=i+1;
      addtolist(pnote,form3.zap1);
      savetofile(pnote);
      showlist(pnote);
  end
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  removefromlist(pnote,form2.StringGrid1.Row);
  i:=i-1;
  showlist(pnote);
  savetofile(pnote);
end;

procedure TForm2.Button3Click(Sender: TObject);
Var
  ptemp:prasp;
  i,k:integer;
begin
  i:=1;
  k:=form2.StringGrid1.Row;
  ptemp:=pnote;
    while (i<k) do
      begin
        ptemp:=ptemp^.next;
        i:=i+1;
      end;
  form3.zap1.day:=ptemp^.day;
  form3.zap1.pred:=ptemp^.pred;
  form3.zap1.prep:=ptemp^.prep;
  form3.zap1.tip:=ptemp^.tip;
  form3.zap1.cab:=ptemp^.cab;
  form3.ShowModal;
  if Length(form3.zap1.pred)>0 then
     begin
        ptemp^.day:=form3.zap1.day;
        ptemp^.pred:=form3.zap1.pred;
        ptemp^.prep:=form3.zap1.prep;
        ptemp^.tip:=form3.zap1.tip;
        ptemp^.cab:=form3.zap1.cab;
        savetofile(pnote);
        showlist(pnote);
     end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  form2.Close;
end;

procedure TForm2.Button5Click(Sender: TObject);
var
  ptemp:prasp;
  k:integer;
  begin
    i:=1;
    ptemp:=pnote;
    clearstringgrid;
    while (ptemp<>nil) do
      begin
        if (pos(form2.Edit1.Text,ptemp^.day)>0)
        or (pos(form2.Edit1.Text,ptemp^.pred)>0)
        or (pos(form2.Edit1.Text,ptemp^.prep)>0)
        or (pos(form2.Edit1.Text,ptemp^.tip)>0)
        or (pos(form2.Edit1.Text,ptemp^.cab)>0) then
          begin
           form2.StringGrid1.RowCount:=form2.StringGrid1.RowCount+1;
           form2.StringGrid1.Cells[0,i]:=ptemp^.day;
           form2.StringGrid1.Cells[1,i]:=ptemp^.pred;
           form2.StringGrid1.Cells[2,i]:=ptemp^.prep;
           form2.StringGrid1.Cells[3,i]:=ptemp^.tip;
           form2.StringGrid1.Cells[4,i]:=ptemp^.cab;
           i:=i+1;
          end;
      ptemp:=ptemp^.next;
      end;
  end;


procedure TForm2.Button6Click(Sender: TObject);
begin
  loadfromfile(pnote);
  Showlist(pnote);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='День' ;
  stringgrid1.Cells[1,0]:='Предмет' ;
  stringgrid1.Cells[2,0]:='Преподаватель' ;
  stringgrid1.Cells[3,0]:='Тип пары' ;
  stringgrid1.Cells[4,0]:='Кабинет' ;
  loadfromfile(pnote);
  showlist(pnote);

end;

procedure TForm2.N2Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 form2.Close;
 form1.Close;
end;

function CreateWord:boolean;
begin
  CreateWord := true;
   try
    Word := CreateOleObject('Word.Application');
   except
    CreateWord := False;
   end;
end;

function VisibleWord(Visible:boolean):boolean;
begin
  VisibleWord := True;
   try
    Word.Visible := Visible;
   except
    VisibleWord := False;
   end;
end;



procedure TForm2.N4Click(Sender: TObject);
var
  i, j:Integer;
begin
 CreateWord;
 word.Documents.add('');
 word.ActiveDocument.Tables.add(Range:=word.ActiveDocument.Range,NumRows:=StringGrid1.RowCount,NumColumns:=StringGrid1.ColCount);
   for i:=1 to StringGrid1.RowCount do
    for j:=1 to StringGrid1.ColCount do
      word.ActiveDocument.Tables.Item(1).Cell(i, j).Range.InsertBefore(StringGrid1.Cells[j-1, i-1]);
 ViSibleWord(True);
end;

end.
