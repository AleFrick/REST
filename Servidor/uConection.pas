unit uConection;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Data.DB, Data.SqlExpr,
     Data.DbxSqlite, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, System.IOUtils, Json;

type
  TConection = class(TComponent)
    private

    public
      function NewConection(ConnectionName, DriverName: String; OUT SqlConn: TSQLConnection): Boolean;
      function NewQuery(NameTable: String; SqlConn: TSQLConnection; OUT SqlQry: TSQLQuery): Boolean;
      function NewDtSetProvider(DtSet: TDataSet; out dtSetProvider: TDataSetProvider): Boolean;
      function NewClientDtSet(ProviderName: TDataSetProvider; DtSet: TDataSet; out CliDtSet: TClientDataSet): Boolean;
      function NewDtSource(DtSet: TDataSet; out DtSource: TDataSource): Boolean;
      function DataToJson(DtSet: TDataSet): TJSONArray;
  end;

implementation
{  ** novos componentes **
  SqlConnection -ok
  SqlQuery   -ok
  DataSetProvider
  ClientDataSet
}
{ TConection }
{ ************** ESQUEMA
    	  sqlcoonection
      	      |
        /-DataSetProvoider
  Qry__/      |
        /-ClientDataSet
Source_/      |
}

// ClientDataSet
function TConection.DataToJson(DtSet: TDataSet): TJSONArray;
var
  jsnObj: TJSONObject;
  i: Integer;
begin
  Result := TJSONArray.Create;

  while not DtSet.Eof do
  begin
    jsnObj := TJSONObject.Create;

    for i := 0 to DtSet.FieldCount - 1 do
      jsnObj.AddPair(TJSONPair.Create(DtSet.Fields[i].FieldName, DtSet.Fields[i].AsString));

    Result.AddElement(jsnObj);
    DtSet.Next;
  end;
end;

function TConection.NewClientDtSet(ProviderName: TDataSetProvider; DtSet: TDataSet;
  out CliDtSet: TClientDataSet): Boolean;
var
  i: Integer;
  Campo: TField;
  a: String;
begin
  try
    CliDtSet.ProviderName := ProviderName.Name;
 //   CliDtSet.Fields.Clear;
    for i := 0 to DtSet.FieldCount-1 do
    begin
    {
      TField('TESTE[') := TField.Create(Self);
      TField('TESTE').Name := 'TESTE';

      Campo := TField.Create(CliDtSet);
      Campo.SetFieldType(ftVariant);
      Campo.Name := DtSet.Fields[i].FieldName;

      CliDtSet.Fields.Add(Campo);       }
      CliDtSet.FieldDefs.Add(DtSet.Fields[i].FieldName, ftString , 40,false);
    end;
    CliDtSet.CreateDataSet;
    CliDtSet.Active := True;
    Result := True;
  except
    Result := False;
  end;
end;

// SqlConnection
function TConection.NewConection(ConnectionName, DriverName: String;
  out SqlConn: TSQLConnection): Boolean;
var
  SqlConn1: TSQLConnection;
begin
  try
    with SqlConn do
    begin
      ConnectionName := 'DB Geral';//ConnectionName;  revisar para ficar generico
      DriverName := 'Sqlite';//DriverName;           revisar para ficar generico
      Params.Add('DriverName=Sqlite');
      Params.Add('DriverUnit=Data.DbxSqlite');
      Params.Add('DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver200.bp');
      Params.Add('l');
      Params.Add('MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite');
      Params.Add('Driver200.bpl');
      Params.Add('FailIfMissing=false');
      Params.Add('HostName=DB Geral');
      Params.Add('Database=D:\Dropbox\TESTES FUNCOES\BD Clientes\Clientes.db');
      LoginPrompt := False;
      Connected := True;
      Name := 'Conn';
      Result := True;
    end;
  except
    result := False;
  end;
end;

// DataSet - Query
function TConection.NewQuery(NameTable: String; SqlConn: TSQLConnection;
          OUT SqlQry: TSQLQuery): Boolean;
var
  SqlQry1: TSQLQuery;
begin
  try
    with SqlQry do
    begin
      Close;
      MaxBlobSize := -1;
      SQL.Clear;
      SQL.Text := 'select * from pessoas';
      SQLConnection := SqlConn;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

// DataSetProvider
function TConection.NewDtSetProvider(DtSet: TDataSet;
  out dtSetProvider: TDataSetProvider): Boolean;
begin
  try
    with dtSetProvider do
    begin
      DataSet := DtSet;
      Constraints := True;
      Name := 'Provoider';
    end;
    Result := True;
  except
    // erro
    Result := False;
  end;
end;

function TConection.NewDtSource(DtSet: TDataSet;
  out DtSource: TDataSource): Boolean;
begin
  try
    DtSource.DataSet := DtSet;
  except
    Result := False;
  end;
end;

end.
