unit EDImports;

{ See the comments in MAIN.PAS for information about this project }

interface

uses
  SysUtils, Windows, mmsystem, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Dialogs, Forms, StdCtrls, DBGrids, DBCtrls, DBTables, DB,
  Buttons, Grids, DBLookup, ExtCtrls, Mask;

type
  TEdImportForm = class(TForm)
    ModeIndicator: TLabel;
    Speedbar: TPanel;
    DBNavBtns: TDBNavigator;
    DBEditBtns: TDBNavigator;
    PrintBtn: TSpeedButton;
    Bevel1: TBevel;
    DBText1: TDBText;
    ActiveSource: TDataSource;
    DBGrid1: TDBGrid;
    HeaderPanel: TPanel;
    Label2: TLabel;
    Label27: TLabel;
    Label17: TLabel;
    PaymentMethod: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label20: TLabel;
    Tax: TLabel;
    PopupCalBtn: TSpeedButton;
    Image1: TImage;
    CustAdd1Edit: TDBEdit;
    CustAdd2Edit: TDBEdit;
    CustCityEdit: TDBEdit;
    CustStateEdit: TDBEdit;
    POEdit: TDBEdit;
    TermsCombo: TDBComboBox;
    PaymentCombo: TDBComboBox;
    SaleDateEdit: TDBEdit;
    AmountPaidEdit: TDBEdit;
    TotalEdit: TDBEdit;
    TaxTotalEdit: TDBEdit;
    AmountDueEdit: TDBEdit;
    TaxRateEdit: TDBEdit;
    SoldByCombo: TDBLookupComboBox;
    CompanyCombo: TDBLookupComboBox;
    CustNoEdit: TDBEdit;
    ItemsGrid: TDBGrid;
    PostBtn: TSpeedButton;
    CancelBtn: TSpeedButton;
    CloseBtn: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure ItemsGridEnter(Sender: TObject);
    procedure ActiveSourceStateChange(Sender: TObject);
    procedure ItemsGridExit(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure PickPartNo(Sender: TObject);
    procedure PickDate(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure SaleDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure ImportsSourceStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SoldByComboKeyPress(Sender: TObject; var Key: Char);
    procedure CloseBtnClick(Sender: TObject);
    procedure ActiveSourceDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  public
    procedure Enter;
    procedure Edit(ImportNo: Double);
  end;

var
  EdImportForm: TEdImportForm;
  RPoint : String;
  RPoint2 : String;
implementation

uses DataMod, SrchDlg, Pickdate;

{$R *.dfm}

const
  DatasetStates: array[TDataSetState] of string =
    ('Not active', 'Browsing', 'Editing', 'Inserting', '', '', '', '', '', '', '', '','');
  HelpTopicEdit = 2;
  HelpTopicBrowse = 3;


{ ======================= Public Methods ======================= }

procedure TEdImportForm.Enter;
begin
  MastData.ImportsSource.OnStateChange := ImportsSourceStateChange;
  try
    MastData.Imports.Open;
    MastData.Imports.Insert;
    ShowModal;
  finally
    MastData.ImportsSource.OnStateChange := nil;
  end;
end;

procedure TEdImportForm.Edit(ImportNo: Double);
begin
  MastData.ImportsSource.OnStateChange := ImportsSourceStateChange;
  try
    MastData.Imports.Open;
    MastData.Imports.Locate('ImportNo', ImportNo, []);
    ShowModal;
  finally
    MastData.ImportsSource.OnStateChange := nil;
   // ImportsImportNo
  end;
end;

{ ======================  Event Handlers  ====================== }

{ These two methods enable the navigators to service both the Orders
  and Items tables by switching the ActiveSource between them. }

procedure TEdImportForm.ItemsGridEnter(Sender: TObject);
begin
  ActiveSource.Dataset := MastData.SubItems;
end;

procedure TEdImportForm.ItemsGridExit(Sender: TObject);
begin
  ActiveSource.Dataset := MastData.Imports;
end;

{ Update the mode indicator when the state of the "Active" datasource
  (Orders or Items) changes }

procedure TEdImportForm.ActiveSourceStateChange(Sender: TObject);
begin

  //PostBtn.Enabled := MastData.Imports.State in dsEditModes;
  //CancelBtn.Enabled := PostBtn.Enabled;
  //CloseBtn.Enabled := MastData.Imports.State = dsBrowse;

  with ActiveSource do
  begin
    if Dataset <> nil then ModeIndicator.Caption :=
      Format('[%S: %S]', [Dataset.Name, DatasetStates[State]]);
    if State in [dsEdit, dsInsert] then
    begin
      HelpContext := HelpTopicEdit;
      ModeIndicator.Font.Color := clRed;
    end
    else
    begin
      HelpContext := HelpTopicBrowse;
      ModeIndicator.Font.Color := clBlue;
    end;
  end;
end;

{ Enable or disable buttons as needed when the state of the orders table changes}

procedure TEdImportForm.ImportsSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := MastData.Imports.State in dsEditModes;
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBtn.Enabled := MastData.Imports.State = dsBrowse;
end;

{ Browse a calendar to pick an invoice date }

procedure TEdImportForm.PickDate(Sender: TObject);
begin
   if not (MastData.ImportsSaleDate.AsString = '') then
     BrDateForm.Date := MastData.ImportsSaleDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now; 	{ start with current date }

  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Imports.Edit;
    MastData.ImportsSaleDate.Value := BrDateForm.Date;
    SaleDateEdit.SelectAll;
  end;
end;

{ Ctrl+Enter in the SaleDate edit control brings up PickDate dialog }

procedure TEdImportForm.SaleDateEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^J then
  begin
    PickDate(Sender);
    Key := #0;
  end;
end;

{ Clicking on the PartNo button in the grid brings up PickPartNo dialog }

procedure TEdImportForm.PickPartNo(Sender: TObject);
begin
  if ItemsGrid.SelectedField = MastData.SubItemsPartNo then	{ PartNo column only }
  begin
    if MastData.SubItemsPartNo.Value <> '0' then
      SearchDlg.PartNo := MastData.SubItemsPartNo.Value;	{ start with current PartNo }
    if SearchDlg.ShowModalParts = mrOk then
    begin
      MastData.SubItems.Edit;
      MastData.SubItemsPartNo.Value := SearchDlg.PartNo;
    end;
  end;
end;

{ Begins a series of cascading Before and After post events }

procedure TEdImportForm.PostBtnClick(Sender: TObject);
begin
  MastData.Imports.Post;
end;

{ Cancels insert or edit on the Orders table }

procedure TEdImportForm.CancelBtnClick(Sender: TObject);
begin
  MastData.Imports.AfterCancel(MastData.Imports);
end;

{ Prints snapshot of the form. An invoice report is available via the Main window }

procedure TEdImportForm.PrintBtnClick(Sender: TObject);
begin
  if Confirm('Print image of this form window?') then Print;
end;

procedure TEdImportForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MastData.DataSetApplyUpdates(MastData.Imports, ModalResult = mrOK);
end;

procedure TEdImportForm.SoldByComboKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#13, #27]) then
    Key := #0;
end;

procedure TEdImportForm.CloseBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TEdImportForm.ActiveSourceDataChange(Sender: TObject;
  Field: TField);
begin
 PostBtn.Enabled := MastData.Imports.State in dsEditModes;
 CancelBtn.Enabled := PostBtn.Enabled;
 CloseBtn.Enabled := MastData.Imports.State = dsBrowse;
end;

procedure TEdImportForm.SpeedButton9Click(Sender: TObject);
begin
RPoint:=CustNoEdit.Text;
end;

procedure TEdImportForm.SpeedButton1Click(Sender: TObject);
begin
RPoint2:=CustNoEdit.Text;
end;

procedure TEdImportForm.SpeedButton8Click(Sender: TObject);
begin
if not MastData.Imports.locate('ProvNo',RPoint,[])then
    ShowMessage('Sorry.... Maybe You didnt make return point');
end;

procedure TEdImportForm.SpeedButton2Click(Sender: TObject);
begin
if not MastData.Imports.locate('ProvNo',RPoint2,[])then
    ShowMessage('Sorry.... Maybe You didnt make return point');
end;

end.
