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
    constructor Create(pSqlConn: TSQLConnection; pSqlQry: TSQLQuery; pSqlDataSet: TSQLDataSet;
                       pProvoider: TDataSetProvider; pCli: TClientDataSet;
                       pDtSource: TDataSource); overload;
    // nao sei o que usar de parametro
    function {create} Post(pTable: string; pColum, pValue: OleVariant): TJSONString;
    function {read}   Get(pTable: String; pColum, pValue: Olevariant): TJSONString;
    function {update} Put(pTable: String; pColum, pValue: Olevariant): TJSONString;
    function {delete} Delete(pTable: String; pColum, pValue: Olevariant):TJSONString;
  end;

implementation

uses uConection;

{ TBasicClass }

constructor TBasicClass.Create(pSqlConn: TSQLConnection; pSqlQry: TSQLQuery;
                               pSqlDataSet: TSQLDataSet; pProvoider: TDataSetProvider;
                               pCli: TClientDataSet; pDtSource: TDataSource);
begin
  try
  if (pSqlConn is nil) then
    if not pSqlDataSet = nil then
      if not pProvoider = nil then
        if not pcli = nil then
          if not pDtSource = nil then
          begin
            SqlConn := pSqlConn;
            SqlQry := pSqlQry;
            SqlDtSet := pSqlDataSet;
            Provider := pProvoider;
            Client := pCli;
            DtSource := pDtSource;
          end;
  except

  end;
end;

function TBasicClass.Delete(pTable: String; pColum,
  pValue: Olevariant): TJSONString;
var
  I: Integer;
begin
// del
  High(pColum);
end;

function TBasicClass.Get(pTable: String; pColum,
  pValue: Olevariant): TJSONString;
begin
// get
end;

function TBasicClass.Post(pTable: string; pColum,
  pValue: OleVariant): TJSONString;
begin
// post
end;

function TBasicClass.Put(pTable: String; pColum,
  pValue: Olevariant): TJSONString;
begin
// put
end;

end.
