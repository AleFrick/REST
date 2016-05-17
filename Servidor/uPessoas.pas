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

uses uConection, uClassTest;

function TPessoas.Hello: string;
var
  a: tTestClass;
  Conn: TConection;
  SqlConn: TSQLConnection;
  SqlQry: TSQLQuery;
  SqlDtSet: TSQLDataSet;
  Provider: TDataSetProvider;
  Cli: TClientDataSet;
  Dtsource: TDataSource;
begin
  Result := 'Hello bro, how are you?';

//  a := tTestClass.Create(SqlConn, SqlQry, SqlDtSet, Provider, Cli,Dtsource);
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

    if Conn.NewConection('DB Geral',tpSqlite,'D:\Dropbox\TESTES FUNCOES\BD Clientes\Clientes.db', SqlConn) then
      if Conn.NewQuery('PESSOAS',SqlConn, SqlQry) then
        if Conn.NewDtSetProvider(SqlQry, Provider) then
        begin
          SqlQry.Active := true;
          if Conn.NewClientDtSet(Provider, SqlQry ,Cli) then
            Result := Conn.DataToJson(SqlQry);
        end;
  except
     on E: Exception do    // nao ta funcionando ... VERIFICAR
       Result := Conn.StrToJson( E.ClassName+' error raised, with message :' + E.Message);
  end;
  FreeAndNil(Conn);
  FreeAndNil(SqlConn);
  FreeAndNil(SqlQry);
  FreeAndNil(Provider);
  FreeAndNil(Cli);
end;

end.
