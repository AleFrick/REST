unit uPessoas;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth;

type
{$METHODINFO ON}
  TPessoas = class(TComponent)
  private

  public
    function Hello: string;
  end;
{$METHODINFO OFF}
implementation

{ TPessoas }

function TPessoas.Hello: string;
begin
  Result := 'Hello bro, how are you?';
end;

end.
