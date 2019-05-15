unit DiVM_3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  a,b:real;
  res,d:real;
  c,h,h1,c1,x1,x2,x3,f1,f3,s1,s2:real;
  i,n:integer;
begin
  a:=StrToFloat(Edit6.Text);
  b:=StrToFloat(Edit7.Text);
  c:=sqrt(3/5);
  h1:=(b-a)/2;
  c1:=c*h1;
  x2:=(b+a)/2;
  f1:=1/(x2-c1);
  f3:=1/(x2+c1);
  s1:=h1*(5*f1+8*(1/x2)+5*f3)/9;
  n:=2;
  repeat
    h:=(b-a)/n;
    h1:=h/2;
    c1:=c*h1;
    x2:=a+h1;
    x1:=x2-c1;
    x3:=x2+c1;
    s2:=0;
    for i:=1 to n do
    begin
      s2:=s2+5*(1/x1)+8*(1/x2)+5*(1/x3);
      x1:=x1+h;
      x2:=x2+h;
      x3:=x3+h;
    end;
    s2:=s2*h1/9;
    d:=abs(s1-s2)/63;
    s1:=s2;
    n:=2*n;
   until d<h;
  res:=s2;
  Edit8.Enabled:=True;
  Edit8.Text:=FloatToStrF(res,ffFixed,7,6);
end;

end.
