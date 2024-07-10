unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cbb1: TComboBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    lbl7: TLabel;
    edt6: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.btn2Click(Sender: TObject);
begin
 if edt1.Text = '' then
  begin
    ShowMessage('Nik Tidak Boleh Kosong!');
  end else
  if DataModule2.zqry2.Locate('nik', edt1.Text, []) then
  begin
    ShowMessage('Nik ' + edt1.Text + ' Sudah Ada Didalam Sistem');
  end else
  begin
    // Simpan
    with DataModule2.zqry2 do
    begin
      SQL.Clear;
      SQL.Add('insert into kustomer (nik, nama, telp, email, alamat, member) values(:nik, :nama, :telp, :email, :alamat, :member)');
      ParamByName('nik').AsString := edt1.Text;
      ParamByName('nama').AsString := edt2.Text;
      ParamByName('telp').AsString := edt3.Text;
      ParamByName('email').AsString := edt4.Text;
      ParamByName('alamat').AsString := edt5.Text;
      ParamByName('member').AsString := cbb1.Text; // Assuming cbMember is a ComboBox
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from kustomer');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');
end;
end;

end.
