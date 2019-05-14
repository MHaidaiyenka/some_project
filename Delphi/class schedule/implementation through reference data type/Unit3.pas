unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unit2;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    zap1:zap;


end;


var
  Form3: TForm3;

implementation

{$R *.dfm}






procedure TForm3.Button1Click(Sender: TObject);
begin
if Length(edit2.Text)=0 then
  begin
      showmessage('Заполните поле предмет!');
      exit;
  end;
zap1.day:=edit1.Text;
zap1.pred:=edit2.Text;
zap1.prep:=edit3.Text;
zap1.tip:=edit4.Text;
zap1.cab:=edit5.Text;
Close;
 Form2.Show;
 edit1.Text:='';
 edit2.Text:='';
 edit3.Text:='';
 edit4.Text:='';
 edit5.Text:='';
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 form3.Close;
 Form2.Show;
end;

end.
