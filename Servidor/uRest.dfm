object Form2: TForm2
  Left = 0
  Top = 0
  ClientHeight = 176
  ClientWidth = 191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 21
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 34
    Top = 70
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 34
    Top = 116
    Width = 75
    Height = 25
    Caption = 'Ligar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 34
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 34
    Top = 89
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DB Geral'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver200.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver200.bpl'
      'FailIfMissing=false'
      'HostName=DB Geral'
      'Database=D:\Dropbox\TESTES FUNCOES\BD Clientes\Clientes.db')
    Connected = True
    Left = 104
    Top = 8
  end
  object SQLDataSet1: TSQLDataSet
    Active = True
    CommandText = 'PESSOAS'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 104
    Top = 56
    object SQLDataSet1ID_PESSOA: TLargeintField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object SQLDataSet1NOME_PESSOA: TWideStringField
      FieldName = 'NOME_PESSOA'
      Required = True
      Size = 40
    end
  end
end
