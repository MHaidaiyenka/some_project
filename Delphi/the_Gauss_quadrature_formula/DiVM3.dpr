program DiVM3;

uses
  Forms,
  DiVM_3 in 'DiVM_3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
