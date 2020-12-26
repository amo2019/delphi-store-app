unit Edcust;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  TEdCustForm = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdCustNo: TDBEdit;
    DBEdName: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdInv: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Panel: TPanel;
    DBNavigator: TDBNavigator;
    PrintBtn: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label10: TLabel;
    Panel1: TPanel;
    OKButton: TBitBtn;
    BitBtn1: TBitBtn;
    PopupCalBtn: TSpeedButton;
    procedure PrintBtnClick(Sender: TObject);
    procedure PickDate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdInvKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdInvDblClick(Sender: TObject);
    procedure PopupCalBtnClick(Sender: TObject);
  public
    procedure Edit(CustNo: Double);
  end;

var
  EdCustForm: TEdCustForm;

implementation

{$R *.dfm}

uses DataMod, Pickdate;

procedure TEdCustForm.Edit(CustNo: Double);
begin
  MastData.Cust.Open;
  MastData.Cust.Locate('CustNo', CustNo, []);
  ShowModal;
end;

{ Browse a calendar to pick an invoice date }

procedure TEdCustForm.PickDate(Sender: TObject);
begin
   if not (MastData.CustLastInvoiceDate.AsString = '') then
     BrDateForm.Date := MastData.CustLastInvoiceDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Cust.Edit;
    MastData.CustLastInvoiceDate.Value := BrDateForm.Date;
    DBEdInv.SelectAll;
  end;
end;

procedure TEdCustForm.PrintBtnClick(Sender: TObject);
begin
  if MessageDlg('   Print this form?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    Print;
end;

procedure TEdCustForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MastData.DataSetApplyUpdates(MastData.Cust, ModalResult = mrOK);
end;

procedure TEdCustForm.DBEdInvKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^J then
  begin
    PickDate(Sender);
    Key := #0;
  end;
end;

procedure TEdCustForm.DBEdInvDblClick(Sender: TObject);
begin
   if not (MastData.CustLastInvoiceDate.AsString = '') then
     BrDateForm.Date := MastData.CustLastInvoiceDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Cust.Edit;
    MastData.CustLastInvoiceDate.Value := BrDateForm.Date;
    DBEdInv.SelectAll;
  end;
end;

procedure TEdCustForm.PopupCalBtnClick(Sender: TObject);
begin
   if not (MastData.CustLastInvoiceDate.AsString = '') then
     BrDateForm.Date := MastData.CustLastInvoiceDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Cust.Edit;
    MastData.CustLastInvoiceDate.Value := BrDateForm.Date;
    DBEdInv.SelectAll;
  end;
end;

end.
