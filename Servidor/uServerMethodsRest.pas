unit uServerMethodsRest;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth;

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

implementation


uses System.StrUtils;


{ TServerRest }

function TServerRest.Alo: String;   // teste server
begin
  Result := 'Cambio, to na escuta.';
end;

end.

