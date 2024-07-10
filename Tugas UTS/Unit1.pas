unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    dbgrd1: TDBGrid;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    procedure posisiawal;
    procedure bersih;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.bersih;
begin
edt1.Clear;
edt2.Clear;
end;

procedure TForm1.posisiawal;
begin
  bersih;
  btn1.Enabled:=True;
  btn2.Enabled:=False;
  btn3.Enabled:=False;
  btn4.Enabled:=False;
  edt1.Enabled:=false;
  edt2.Enabled:=False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
  ShowMessage('Nama Satuan tidak boleh kosong!');
  Exit;
  end else
  if DataModule2.zqry1.Locate('nama', edt1.Text,[])then
  begin
    ShowMessage('Nama Satuan'+edt1.Text+' sudah ada didalam sistem');
    end;
  if edt2.Text = '' then
  begin
    ShowMessage('Diskripsi tidak boleh kosong!');
    exit;
  end;
    begin // simpan
    with DataModule2.zqry1 do
    begin
      SQL.Clear;
      SQL.Add('insert into satuan values(null,"'+edt1.Text+'","'+edt2.Text+'")');
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
  ShowMessage('Nama Satuan tidak boleh kosong!');
  end else
  if edt1.Text = DataModule2.zqry1.Fields[1].AsString then
  begin
    ShowMessage('Nama satuan'+edt1.text+'Tidak ada Perubahan');
  end else
  begin
    with DataModule2.zqry1 do
    begin
      SQL.Clear;
      SQL.Add('update satuan set nama="'+edt1.Text+'", diskripsi="'+edt2.Text+'" where id = "'+a+'"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil diubah');
end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
  with DataModule2.zqry1 do
  begin
    SQL.Clear;
    SQL.Add('delete from satuan where id = "'+a+'"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from satuan');
    Open;
  end;
  ShowMessage('Data berhasil dihapus');
end else
begin
  ShowMessage('Data berhasil dihapus!');
end;

end;

procedure TForm1.btn4Click(Sender: TObject);
begin
edt1.clear;
edt2.clear;
end;

end.
