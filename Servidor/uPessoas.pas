unit uPessoas;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Data.DB, Data.SqlExpr,
     Data.DbxSqlite, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, Json;

type
{$METHODINFO ON}
  TPessoas = class(TComponent)
  private

  public
    function Hello: string;
    function TesteBD: TJSONArray;
  end;
{$METHODINFO OFF}
implementation

{ TPessoas }

uses uConection;

function TPessoas.Hello: string;
begin
  Result := 'Hello bro, how are you?';
end;

function TPessoas.TesteBD: TJSONArray;
var
  Conn: TConection;
  SqlConn: TSQLConnection;
  SqlQry: TSQLQuery;
  Provider: TDataSetProvider;
  Cli: TClientDataSet;
  Dtsource: TDataSource;
begin
  try
    Conn := TConection.Create(Self);
    SqlConn := TSQLConnection.Create(Self);
    SqlQry := TSQLQuery.Create(Self);
    Provider := TDataSetProvider.Create(Self);
    Cli := TClientDataSet.Create(Self);

    if Conn.NewConection('DB Geral','Sqlite', SqlConn) then
      if Conn.NewQuery('PESSOAS',SqlConn, SqlQry) then
        if Conn.NewDtSetProvider(SqlQry, Provider) then
        begin
          SqlQry.Active := true;
//          Result := SqlQry.FieldByName('ID_PESSOA').AsString;
          if Conn.NewClientDtSet(Provider, SqlQry ,Cli) then
            Result := Conn.DataToJson(SqlQry);
        end;
  except
     // error
  end;
  // criar sql conn
  // criar dtset
  // criar dtsource
  FreeAndNil(Conn);
  FreeAndNil(SqlConn);
  FreeAndNil(SqlQry);
  FreeAndNil(Provider);
  FreeAndNil(Cli);
end;

end.
