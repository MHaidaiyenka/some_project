unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    PDF1: TMenuItem;
    RTF1: TMenuItem;
    HTML1: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure RTF1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4, Unit5, Unit6;

procedure TForm2.Edit1Change(Sender: TObject);
Var
  h1,h2:string;
begin
  h1:='%'+Form2.Edit1.Text+'%';
    h2:=QuotedStr(h1);
    With form2.ADOQuery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Baza where day like'+h2+' or discipline like'+h2+' or teacher like'+h2+' or type like'+h2+' or studyroom like'+h2+'order by day');
      open;
    end;
end;

procedure TForm2.HTML1Click(Sender: TObject);
begin
    form6.frxReport1.ShowReport();
   Form6.frxReport1.Export(Form6.frxHTMLExport1) ;
end;

procedure TForm2.N10Click(Sender: TObject);
begin
   form6.frxReport1.ShowReport();
   Form6.frxReport1.Print ;
end;

procedure TForm2.N11Click(Sender: TObject);
begin
  form2.Edit1.Clear;
  Form2.Close;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
 form3.Show;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
  form2.Close;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
Form2.ADOQuery1.Append;
Form4.Show;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
  form6.Show;
  form6.frxReport1.ShowReport();
end;

procedure TForm2.PDF1Click(Sender: TObject);
begin
   form6.frxReport1.ShowReport();
   Form6.frxReport1.Export(Form6.frxPDFExport1) ;
end;

procedure TForm2.RTF1Click(Sender: TObject);
begin
  Form6.frxReport1.ShowReport();
  Form6.frxReport1.Export(Form6.frxRTFExport1) ;
end;

end.
