object Form2: TForm2
  Left = 0
  Top = 0
  ActiveControl = Button1
  ClientHeight = 382
  ClientWidth = 543
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
  end
  object Edit2: TEdit
    Left = 34
    Top = 89
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 248
    Top = 128
    object ClientDataSet1NOME_PESSOA: TWideStringField
      FieldName = 'NOME_PESSOA'
      Required = True
      Size = 40
    end
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
    Left = 248
    Top = 16
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select nome_pessoa from pessoas')
    SQLConnection = SQLConnection1
    Left = 192
    Top = 72
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 248
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 184
    Top = 136
  end
end
