unit uServerMethodsRest;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, uPessoas;

type
{$METHODINFO ON}
  TServerRest = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function Alo: String;
  end;
{$METHODINFO OFF}
type
  TPessoas = class(TComponent)
    private

    public
      function Teste: String;
  end;
implementation


uses System.StrUtils;


{ TServerRest }

function TServerRest.Alo: String;   // teste server
begin
  Result := 'Cambio, to na escuta.';
end;

{ TPessoas }

function TPessoas.Teste: String;
begin
  Result := 'açex';
end;

end.

