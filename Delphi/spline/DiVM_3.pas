unit DiVM_3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  a,b,x:real;
  n:integer;
  y_1,y_2:real;
  h,h1,h2,aa:real;
  i:integer;
  y:array[0..1000] of real;
begin
  a:=StrToFloat(Edit1.Text); {Ââîä èñõîäíûõ äàííûõ}
  b:=StrToFloat(Edit2.Text);
  n:=1000;
  x:=(a+b)/2;
  h:=(b-a)/n;
  aa:=a;
  for i:=0 to n-2 do {Äèôôåğåíöèğîâàíèå}
  begin
    y[i]:=aa*cos(aa);
    aa:=aa+h;
  end;
  i:=trunc((x-a)/h+h/2);
  h1:=2*h;
  h2:=h*h;
  if i=0 then
  begin
    y_1:=(-3*y[0]+4*y[1]-y[2])/h1;
    y_2:=(2*y[0]-5*y[1]+4*y[2]-y[3])/h2;
  end;
  if ((i>0)and(i<n)) then
  begin
    y_1:=(-y[i-1]+y[i+1])/h1;
    y_2:=(y[i-1]-2*y[i]+y[i+1])/h2;
  end;
  if i=n then
  begin
    y_1:=(y[n-2]-4*y[n-1]+3*y[n])/h1;
    y_2:=(-y[n-3]+4*y[n-2]-5*y[n-1]+2*y[n])/h2;
  end;
  Edit3.Enabled:=True; {Âûâîä ğåçóëüòàòîâ}
  Edit4.Enabled:=True;
  Edit5.Enabled:=True;
  Edit3.Text:=FloatToStrF(x,ffFixed,7,6);
  Edit4.Text:=FloatToStrF(y_1,ffFixed,7,6);
  Edit5.Text:=FloatToStrF(y_2,ffFixed,7,6);
end;

end.
