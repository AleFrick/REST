unit uConnection;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Data.DB, Data.SqlExpr,
     Data.DbxSqlite, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, System.IOUtils, Json, Dialogs;

type
  TTpDataBases = (tpSqlite, tpASA, tpESE, tpDataSnap, tpDB2, tpFirebird, tpIBLite,
                   tpInformix, tpInterbase, tpMSSQL, tpMySQL, tpOdbc, tpOracle);


type
  tTconnection = class(Tcomponent)
    private
    {private methods}
      function GetTypeDb(TypeDb: TTpDataBases): String;
    protected
    {protected methods}
    public
    {public methods}
     /// pensar no create
      function NewConnection(ConnectionName: String; pDriverName: TTpDataBases;
                             WayToDb: String; out SqlConnection: TSQLConnection): Boolean;
      function NewSqlQry(out SqlQry: TSQLQuery): Boolean;
//      function NewSqlDtSet(out SqlDtSet:  ): Boolean;
      function NewProvoider(out Provoider: TDataSetProvider): Boolean;
      function NewClientDtSet(out ClientDtSet: TClientDataSet): Boolean;
      function NewDtSourcer(out DtSource: TDataSource):Boolean;
  end;

implementation

{ tTconnection }

function tTconnection.GetTypeDb(TypeDb: TTpDataBases): String;
begin
  case TypeDb of
    tpSqlite:    Result := 'Sqlite';
    tpASA:       Result := 'ASA';
    tpESE:       Result := 'ESE';
    tpDataSnap:  Result := 'DataSnap';
    tpDB2:       Result := 'DB2';
    tpFirebird:  Result := 'Firebird';
    tpIBLite:    Result := 'IBLite';
    tpInformix:  Result := 'Informix';
    tpInterbase: Result := 'Interbase';
    tpMSSQL:     Result := 'MSSQL';
    tpMySQL:     Result := 'MySQL';
    tpOdbc:      Result := 'Odbc';
    tpOracle:    Result := 'Oracle';
  end;
end;

function tTconnection.NewClientDtSet(out ClientDtSet: TClientDataSet): Boolean;
begin
  try
    if ClientDtSet = nil then
      ClientDtSet := TClientDataSet.Create(Self);
      {

      }
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message: '+ E.Message);
  end;
end;


function tTconnection.NewConnection(ConnectionName: String;
                                    pDriverName: TTpDataBases; WayToDb: String;
                                    out SqlConnection: TSQLConnection): Boolean;
begin
  try
    if SqlConnection = nil then
      SqlConnection := TSQLConnection.Create(self);
   with SqlConnection do
   begin
      Params.Add('DriverName='+ GetTypeDB(pDriverName)); // rever
      Params.Add('DriverUnit=Data.DbxSqlite'); // rever
      Params.Add('DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver200.bp'); // rever
      Params.Add('l');
      Params.Add('MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite'); // rever
      Params.Add('Driver200.bpl');
      Params.Add('FailIfMissing=false');
      Params.Add('HostName='+ ConnectionName); //
      Params.Add('Database='+WayToDb);
      LoginPrompt := False;
      Connected := True;
      Name := 'Conn';
      Result := True;
   end;
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message: '+ E.Message);
  end;
end;

function tTconnection.NewDtSourcer(out DtSource: TDataSource): Boolean;
begin
  try
    if DtSource = nil then
      DtSource := TDataSource.Create(Self);
      {

      }
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message: '+ E.Message);
  end;
end;

function tTconnection.NewProvoider(out Provoider: TDataSetProvider): Boolean;
begin
  try
    if Provoider = nil then
      Provoider := TDataSetProvider.Create(self);
      {

      }
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message: '+ E.Message);
  end;
end;

function tTconnection.NewSqlQry(out SqlQry: TSQLQuery): Boolean;
begin
  try
    if SqlQry = nil then
      SqlQry := TSQLQuery.Create(self);
      {

      }
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message: '+ E.Message);
  end;
end;

end.
