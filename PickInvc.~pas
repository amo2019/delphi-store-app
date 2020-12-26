unit PickInvc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons;

type
  TPickOrderNoDlg = class(TForm)
    DBLookupListBox1: TDBLookupListBox;
    Label1: TLabel;
    CancelButton: TBitBtn;
    OKButton: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PickOrderNoDlg: TPickOrderNoDlg;

implementation

uses DataMod;

{$R *.dfm}

procedure TPickOrderNoDlg.FormShow(Sender: TObject);
begin
  MastData.Orders.Open;
end;

end.
