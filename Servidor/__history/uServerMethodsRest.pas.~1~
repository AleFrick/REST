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
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Teste: String;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils;

function TServerRest.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerRest.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
function TServerRest.Teste: String;
begin
  result := 'alex sandro';
end;

end.

