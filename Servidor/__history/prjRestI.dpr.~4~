program prjRestI;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uRest in 'uRest.pas' {Form2},
  uServerMethodsRest in 'uServerMethodsRest.pas',
  uServerContainerRest in 'uServerContainerRest.pas' {ServerContainer1: TDataModule},
  uPessoas in 'uPessoas.pas',
  Unit1 in 'Unit1.pas',
  uConection in 'uConection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

