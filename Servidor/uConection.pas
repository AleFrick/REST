unit uConection;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Data.DB, Data.SqlExpr;

type
  TConection = class(TComponent)
    private

    public
      function NewConection(ConnectionName, DriverName: String; OUT SqlConn: TSQLConnection): Boolean;
      function NewDataSet(NameTable: String; SqlConn: TSQLConnection; OUT SqlDtSet): Boolean;
  end;

implementation

{ TConection }


function TConection.NewConection(ConnectionName, DriverName: String;
  out SqlConn: TSQLConnection): Boolean;
var
  SqlConn1: TSQLConnection;
begin
  try
    SqlConn1 := TSQLConnection.Create(nil);
    with SqlConn do
    begin
      ConnectionName := ConnectionName;   //DB Geral
      DriverName := DriverName;           // Sqlite
      LoginPrompt := False;
      Connected := False;
      SqlConn := SqlConn1;
    end;
  except
    result := False;
  end;
  Result := True;
  FreeAndNil(SqlConn);
end;

function TConection.NewDataSet(NameTable: String; SqlConn: TSQLConnection;
          OUT SqlDtSet): Boolean;
var
  SqlDtSet1: TSQLDataSet;
begin
  try
    SqlDtSet1 := TSQLDataSet.Create(nil);
    SqlDtSet.CommandType := ctTable;
    SqlDtSet.CommandText := NameTable;
    SqlDtSet := SqlDtSet1;
  except
    Result := False;
  end;
  Result := True;;
  FreeAndNil(SqlDtSet);
end;

end.
