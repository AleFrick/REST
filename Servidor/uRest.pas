  unit uRest;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  IPPeerServer,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Data.SqlExpr, Data.DbxSqlite, Data.FMTBcd,  System.IOUtils,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ClientDataSet1: TClientDataSet;
    SQLConnection1: TSQLConnection;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ClientDataSet1NOME_PESSOA: TWideStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses uServerMethodsRest, Unit1, uServerContainerRest, uPessoas, uConection;

procedure TForm2.Button1Click(Sender: TObject);
begin

  with uServerContainerRest.ServerContainer1 do
  begin
    if Button1.Caption = 'Ligar' then
    begin
      {        REVER DESLIGAMENTO SERVIDOR      }
      try
        RegisterServerClasses(TComponent(uServerMethodsRest.TPessoas) , DSServer1);
        DSServer1.Start;
        Button1.Caption := 'Desligar';
      except
        DSServer1.Stop;
        Button1.Caption := 'Ligar';
      end;

    end else
    begin
      DSServer1.Stop;
      Button1.Caption := 'Ligar';
    end;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Conn: TConection;
  SqlConn: TSQLConnection;
  SqlQry: TSQLQuery;
  Provider: TDataSetProvider;
  Cli: TClientDataSet;
  Dtsource: TDataSource;
  a: String;
begin

  {
  FreeAndNil(Conn);
  FreeAndNil(SqlConn);
  FreeAndNil(SqlQry);
  FreeAndNil(Provider);
  FreeAndNil(Cli);
  FreeAndNil(Dtsource);}
end;

end.

