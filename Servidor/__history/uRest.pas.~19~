unit uRest;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  IPPeerServer,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Data.SqlExpr, Data.DbxSqlite, Data.FMTBcd;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1ID_PESSOA: TLargeintField;
    SQLDataSet1NOME_PESSOA: TWideStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses uServerMethodsRest, Unit1, uServerContainerRest, uPessoas;

procedure TForm2.Button1Click(Sender: TObject);
begin

  with uServerContainerRest.ServerContainer1 do
  begin
    if Button1.Caption = 'Ligar' then
    begin
      {
        REVER DESLIGAMENTO SERVIDOR
      }

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

end.

