{
      **************************
      *                        *
      *  Mother class in test  *
      *                        *
      **************************
}
unit uBasicClass;

interface

Uses
     System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Data.DB, Data.SqlExpr,
     Data.DbxSqlite, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, System.IOUtils, Json;

type
  TTpDataBases = (tpSqlite, tpASA, tpESE, tpDataSnap, tpDB2, tpFirebird, tpIBLite,
                   tpInformix, tpInterbase, tpMSSQL, tpMySQL, tpOdbc, tpOracle);

type
{$METHODINFO ON}
  TBasicClass = class(TComponent)
  private
    // private method
    vSqlConn: TSQLConnection;
    vSqlQry: TSQLQuery;
    vSqlDtSet: TSQLDataSet;
    vProv: TDataSetProvider;
    vCli: TClientDataSet;
    vDtSource: TDataSource;

    property SqlConn: TSQLConnection read vSqlConn write vSqlConn;
    property SqlQry: TSQLQuery read vSqlQry write vSqlQry;
    property SqlDtSet: TSQLDataSet read vSqlDtSet write vSqlDtSet;
    property Provider: TDataSetProvider read vProv write vProv;
    property Client: TClientDataSet read vCli write vCli;
    property DtSource: TDataSource read vDtSource write vDtSource;
  protected
    // protected method
  public
    // public method
{    constructor Create(pSqlConn: TSQLConnection; pSqlQry: TSQLQuery;
                       pSqlDataSet: TSQLDataSet; pProvoider: TDataSetProvider;
                       pCli: TClientDataSet; pDtSource: TDataSource); overload;}
    {}
    // nao sei o que usar de parametro
    function {create} Post(pTable: string; pColum, pValue: OleVariant): String;
    function {read}   Get(pTable: String; pColum, pValue: Olevariant): String;
    function {update} Put(pTable: String; pColum, pValue: Olevariant): String;
    function {delete} Delete(pTable: String; pColum, pValue: Olevariant):String;
    function ppost(Value: String): String;

  end;
{$METHODINFO OFF}
  // classe nao registrada
  TFunctionClass = class(TComponent)
    private

    protected

    public
      function StrToJson(Value: String): TJSONArray;
  end;
Const
  db = 'D:\Dropbox\TESTES FUNCOES\BD Clientes\Clientes.db';

implementation

uses uConection;

{ TBasicClass }
// drivename, connectionname, way to db
{constructor TBasicClass.Create(pSqlConn: TSQLConnection; pSqlQry: TSQLQuery;
                       pSqlDataSet: TSQLDataSet; pProvoider: TDataSetProvider;
                       pCli: TClientDataSet; pDtSource: TDataSource);
var
  con: TConection;
begin
  try

  except
    // erro
  end;
end;
 }
function TBasicClass.Delete(pTable: String; pColum,
  pValue: Olevariant): String;
var
  I: Integer;
begin
// del
//  High(pColum);
end;

function TBasicClass.Get(pTable: String; pColum,
  pValue: Olevariant): String;
begin
 //
end;

function TBasicClass.Post(pTable: string; pColum,
  pValue: OleVariant): String;
begin
// post
end;

function TBasicClass.ppost(Value: String): String;
begin
  Result := Value;
end;

function TBasicClass.Put(pTable: String; pColum,
  pValue: Olevariant): String;
begin
// put
end;

{ TFunctionClass }

function TFunctionClass.StrToJson(Value: String): TJSONArray;
var
  StrJson: TJSONObject;
begin
   Result := TJSONArray.Create;
  try
    StrJson.AddPair(TJSONPair.Create(Value,'') );
    Result.AddElement(StrJson);
  except
    StrJson.AddPair(TJSONPair.Create('Nada feito','') );
    Result.AddElement(StrJson);
  end;
end;

end.
