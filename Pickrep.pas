unit Pickrep;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TPickRpt = class(TForm)
    ReportType: TRadioGroup;
    ViewBtn: TBitBtn;
    OKBtn: TBitBtn;
    CloseBtn: TBitBtn;
    procedure OKBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
  public  
    Preview : Boolean;
  end;

var
  PickRpt: TPickRpt;

implementation

{$R *.dfm}

procedure TPickRpt.OKBtnClick(Sender: TObject);
begin
  Preview := False;
end;

procedure TPickRpt.ViewBtnClick(Sender: TObject);
begin
  Preview := True;
end;

end.
