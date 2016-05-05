unit Unit1;

interface

uses Classes, DSServer, DSReflect, DSCommonServer, DSNames, DataBkr, uServerContainerRest, DSProviderDataModuleAdapter;
type

  TSimpleServerClass = class(TDSServerClass)
  private
    FPersistentClass: TPersistentClass;
    FExposeProvider : Boolean;

  protected
    function GetDSClass: TDSClass; override;
  public
    constructor Create(AOwner: TComponent; AServer: TDSCustomServer;
         AClass: TPersistentClass; ExposeProvider: Boolean; ALifeCycle: String);
         reintroduce; overload;
  end;

procedure RegisterServerClasses(AOwner: TComponent; AServer: TDSServer);
implementation

uses uPessoas;

constructor TSimpleServerClass.Create(AOwner: TComponent; AServer: TDSCustomServer; AClass: TPersistentClass; ExposeProvider: Boolean;
  ALifeCycle: String);
var
 i: Integer;
begin
  inherited Create(nil);
  FPersistentClass := AClass;
  FExposeProvider  := ExposeProvider;
  Self.Server := AServer;

  Self.LifeCycle := ALifeCycle;
end;

function TSimpleServerClass.GetDSClass: TDSClass;
var
  isAdapted : Boolean;
begin
  isAdapted := FPersistentClass.InheritsFrom(TProviderDataModule);
  Result := TDSClass.Create(FPersistentClass, isAdapted);
  if FExposeProvider and (isAdapted) then
     Result := TDSClass.Create(TDSProviderDataModuleAdapter, Result);
end;
procedure RegisterServerClasses(AOwner: TComponent; AServer: TDSServer);
begin
  Assert(AServer.Started = False, 'N�o � poss�vel adicionar classes com o servidor ativo');
  TSimpleServerClass.Create(AOwner, AServer, TPessoas   , False, TDSLifeCycle.Session);
end;
end.
