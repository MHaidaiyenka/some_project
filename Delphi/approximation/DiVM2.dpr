program DiVM2;

uses
  Forms,
  DiVM_2 in 'DiVM_2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
