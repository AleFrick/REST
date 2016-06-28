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
    function Sorteio: String;
  end;
{$METHODINFO OFF}
implementation

{ TPessoas }

uses uConection, uClassTest;

function TPessoas.Hello: string;
var
  a: Integer;
begin
  a := Random(100000);
  if (a > 0) and (a < 48999) then
    Result := 'Numero sorteado: ' + IntToStr(a) + ' Valor pr�mio: 100'
  else if (a > 49000) and (a < 73999) then
      Result := 'Numero sorteado: ' + IntToStr(a) + ' Valor pr�mio: 1000'
  else if (a > 74000) and (a < 88999) then
      Result := 'Numero sorteado: ' + IntToStr(a) + ' Valor pr�mio: 2000'
  else if (a > 89000) and (a < 98999) then
      Result := 'Numero sorteado: ' + IntToStr(a) + ' Valor pr�mio: 3000'
  else if (a > 99000) and (a < 10000) then
      Result := 'Numero sorteado: ' + IntToStr(a) + ' Valor pr�mio: 10000'
  else Result := 'Numero sorteado: 24 Valor pr�mio: 100';


end;

function TPessoas.Sorteio: String;
var
  Conn: TConection;
  SqlConn: TSQLConnection;
  SqlQry: TSQLQuery;
  Provider: TDataSetProvider;
  Cli: TClientDataSet;
  Dtsource: TDataSource;
  aux, val: integer;
begin
// premios 100, 1000, 2000, 3000, 10000
// 100   - 49
// 1000  - 25
// 2000  - 15
// 3000  - 10
// 10000 - 1
  try
    Conn := TConection.Create(Self);
    SqlConn := TSQLConnection.Create(Self);
    SqlQry := TSQLQuery.Create(Self);
    Provider := TDataSetProvider.Create(Self);
    Cli := TClientDataSet.Create(Self);

    if Conn.NewConection('DB Geral',tpSqlite,'D:\Dropbox\TESTES FUNCOES\BD Clientes\Clientes.db', SqlConn) then
      if Conn.NewQuery('MOEDAS',SqlConn, SqlQry) then
        if Conn.NewDtSetProvider(SqlQry, Provider) then
        begin
          SqlQry.Active := true;
          if Conn.NewClientDtSet(Provider, SqlQry ,Cli) then
          begin
            if SqlQry.FieldByName('QNT_CAIXA').AsFloat < 200000 then
              aux := 71000
            else if SqlQry.FieldByName('QNT_CAIXA').AsFloat < 400000 then
              aux := 74000
            else if SqlQry.FieldByName('QNT_CAIXA').AsFloat < 600000 then
              aux := 80000
            else if SqlQry.FieldByName('QNT_CAIXA').AsFloat < 800000 then
              aux := 90000
            else if SqlQry.FieldByName('QNT_CAIXA').AsFloat > 800000 then
              aux := 100000;

            aux := Random(aux);
            if (aux > 0) and (aux < 48999) then
              val := 100
            else if (aux > 49000) and (aux < 73999) then
              val := 1000
            else if (aux > 74000) and (aux < 88999) then
               val := 2000
            else if (aux > 89000) and (aux < 98999) then
              val := 3000
            else if (aux > 99000) and (aux < 10000) then
              val := 10000
            else
            begin
              val := 100;
              aux := 24;
            end;

            //Result := 'Numero sorteado: 24 ... Valor pr�mio: 100';

            SqlQry.Close;
            SqlQry.SQL.Text := 'update moedas set qnt_caixa = qnt_caixa -' + IntToStr(val)+ ' where id_moeda = 1';
            SqlQry.ExecSQL(true);

            SqlQry.Close;
            SqlQry.SQL.Text := 'select * from moedas where id_moeda = 1';
            SqlQry.Open;
            Result := 'Numero sorteado: '+IntToStr(aux)+' ... Valor pr�mio: '+IntToStr(val) + '.... quantidade em caixa: ' + SqlQry.FieldByName('QNT_CAIXA').AsString;
          end;
//            Result := Conn.DataToJson(SqlQry);

        end;

  except

  end;
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
      if Conn.NewQuery('MOEDAS',SqlConn, SqlQry) then
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
