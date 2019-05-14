unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Image1: TImage;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.Show;
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

procedure TForm1.FormCreate(Sender: TObject);
var
  ptemp:prasp;
  i:integer;
  today,f:string;
  begin
  stringgrid1.Cells[0,0]:='День' ;
  stringgrid1.Cells[1,0]:='Предмет' ;
  stringgrid1.Cells[2,0]:='Преподаватель' ;
  stringgrid1.Cells[3,0]:='Тип пары' ;
  stringgrid1.Cells[4,0]:='Кабинет' ;

    loadfromfile(pnote);
    today:=FormatDateTime('DDDD',Now);
    ptemp:=pnote;
    i:=1;
    while (ptemp<>nil) do
      begin
        if ptemp^.day=today then
          begin
           form1.StringGrid1.RowCount:=form1.StringGrid1.RowCount+1;
           form1.StringGrid1.Cells[0,i]:=ptemp^.day;
           form1.StringGrid1.Cells[1,i]:=ptemp^.pred;
           form1.StringGrid1.Cells[2,i]:=ptemp^.prep;
           form1.StringGrid1.Cells[3,i]:=ptemp^.tip;
           form1.StringGrid1.Cells[4,i]:=ptemp^.cab;
           i:=i+1;
          end;
        ptemp:=ptemp^.next;
      end;
  end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  label1.Caption:=TimeToStr(GetTime);
  label2.Caption:=DateToStr(Date);
  label4.Caption:=FormatDateTime('DDDD',Now);
end;

end.
