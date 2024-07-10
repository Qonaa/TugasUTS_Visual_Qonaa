object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 152
  Height = 193
  Width = 250
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Program Files (x86)\Borland\Delphi7\Folder Baru\libmysql.dll'
    Left = 24
    Top = 48
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `satuan`')
    Params = <>
    Left = 96
    Top = 48
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 176
    Top = 48
  end
end
