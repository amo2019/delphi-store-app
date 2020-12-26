unit EdProv;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  TEdProvForm = class(TForm)
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
    CancelButton: TBitBtn;
    PopupCalBtn: TSpeedButton;
    procedure PrintBtnClick(Sender: TObject);
    procedure PickDate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdInvDblClick(Sender: TObject);
    procedure DBEdInvKeyPress(Sender: TObject; var Key: Char);
    procedure PopupCalBtnClick(Sender: TObject);
  public
    procedure Edit(CustNo: Double);
  end;

var
  EdProvForm: TEdProvForm;

implementation

{$R *.dfm}

uses DataMod, Pickdate;

procedure TEdProvForm.Edit(CustNo: Double);
begin
  MastData.Cust.Open;
  MastData.Cust.Locate('CustNo', CustNo, []);
  ShowModal;
end;

{ Browse a calendar to pick an invoice date }

procedure TEdProvForm.PickDate(Sender: TObject);
begin
   if not (MastData.ProviderLastInvoiceDate.AsString = '') then
     BrDateForm.Date := MastData.ProviderLastInvoiceDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Provider.Edit;
    MastData.ProviderLastInvoiceDate.Value := BrDateForm.Date;
    DBEdInv.SelectAll;
  end;
end;

procedure TEdProvForm.PrintBtnClick(Sender: TObject);
begin
  if MessageDlg('   Print this form?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    Print;
end;

procedure TEdProvForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MastData.DataSetApplyUpdates(MastData.Provider, ModalResult = mrOK);
end;

procedure TEdProvForm.DBEdInvDblClick(Sender: TObject);
begin
   if not (MastData.ProviderLastInvoiceDate.AsString = '') then
     BrDateForm.Date := MastData.ProviderLastInvoiceDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Provider.Edit;
    MastData.ProviderLastInvoiceDate.Value := BrDateForm.Date;
    DBEdInv.SelectAll;
  end;
end;

procedure TEdProvForm.DBEdInvKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^J then
  begin
    PickDate(Sender);
    Key := #0;
  end;
end;

procedure TEdProvForm.PopupCalBtnClick(Sender: TObject);
begin
   if not (MastData.ProviderLastInvoiceDate.AsString = '') then
     BrDateForm.Date := MastData.ProviderLastInvoiceDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Provider.Edit;
    MastData.ProviderLastInvoiceDate.Value := BrDateForm.Date;
    DBEdInv.SelectAll;
  end;
end;

end.
