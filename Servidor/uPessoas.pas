unit uPessoas;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth;

type
  TPessoas = class(TComponent)
  private

  public
    function Teste: string;
  end;

implementation

{ TPessoas }

function TPessoas.Teste: string;
begin
  Result := 'bombio';
end;

end.
