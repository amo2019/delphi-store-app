unit BrMastStore;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TBrMStoresForm = class(TForm)
    CtrlsPanel: TPanel;
    Navigator: TDBNavigator;
    BtnPanel: TPanel;
    DefineBtn: TSpeedButton;
    CustPanel: TPanel;
    PartsGrid: TDBGrid;
    OrdersPanel: TPanel;
    Bevel1: TBevel;
    ItemsGrid: TDBGrid;
    SItemsGrid: TDBGrid;
    ModeIndicator: TLabel;
    SubIT: TTable;
    PartsT: TTable;
    SubSrc: TDataSource;
    PartSrc: TDataSource;
    ItemsT: TTable;
    ItemSrc: TDataSource;
    ActiveSource: TDataSource;
    ActivateBtn: TSpeedButton;
    EditBtn: TSpeedButton;
    CloseBtn: TSpeedButton;
    procedure PartsGridEnter(Sender: TObject);
    procedure SetQuery(Sender: TObject);
    procedure ActivateQuery(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure PickPartNo(Sender: TObject);
    procedure ItemsGridEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ItemSrcStateChange(Sender: TObject);
    procedure SItemsGridEnter(Sender: TObject);
    procedure SItemsGridDblClick(Sender: TObject);
    procedure ItemsGridDblClick(Sender: TObject);
  private
    FActiveSource: TDataSource;
    function GetCustNo: Double;
    function GetOrderNo: Double;
    procedure SetActiveSource(DataSource: TDataSource);
    procedure SetCustNo(NewCustNo: Double);
    procedure SetOrderNo(NewOrderNo: Double);
  public
    property CustNo: Double read GetCustNo write SetCustNo;
    property OrderNo: Double read GetOrderNo write SetOrderNo;
  end;

var
  BrMStoresForm: TBrMStoresForm;

implementation

uses QryCust, EdCust, EdOrders, Main, DataMod, SrchDlg;

{$R *.dfm}

const
  DatasetStates: array[TDataSetState] of string =
    ('Not active', 'Browsing', 'Editing', 'Inserting', '', '', '', '', '', '', '', '','');
  HelpTopicEdit = 2;
  HelpTopicBrowse = 3;

{ Retrieve from active customer table or query--whichever is active }

function TBrMStoresForm.GetCustNo: Double;
begin
  Result := MastData.CustMasterSrc.Dataset.Fields[0].AsFloat;
end;

procedure TBrMStoresForm.SetCustNo(NewCustNo: Double);
begin
  MastData.CustMasterSrc.Dataset := MastData.Cust;
  MastData.Cust.Locate('CustNo', NewCustNo, []);
end;

function TBrMStoresForm.GetOrderNo: Double;
begin
  Result := MastData.OrdByCustOrderNo.Value;
end;

procedure TBrMStoresForm.SetOrderNo(NewOrderNo: Double);
begin
  MastData.OrdByCust.Locate('OrderNo', NewOrderNo, []);
end;


procedure TBrMStoresForm.SetActiveSource(DataSource: TDataSource);
begin
  FActiveSource := DataSource;
  Navigator.DataSource := FActiveSource;
end;


procedure TBrMStoresForm.PartsGridEnter(Sender: TObject);
begin
  ActiveSource := PartSrc;
end;

procedure TBrMStoresForm.ItemsGridEnter(Sender: TObject);
begin
  ActiveSource := ItemSrc;
end;

procedure TBrMStoresForm.SetQuery(Sender: TObject);
begin
  if QueryCustDlg.ShowModal = mrOK then
    ActivateQuery(Self);
end;

procedure TBrMStoresForm.ActivateQuery(Sender: TObject);
begin
  if not ActivateBtn.Down then
    MastData.CustMasterSrc.Dataset := MastData.Cust
  else
    with MastData.CustQuery do
    try
      Close;
      Params[0].AsDatetime := QueryCustDlg.FromDate;
      Params[1].AsDatetime := QueryCustDlg.ToDate;
      Open;
      { Any records in the result set? }
      if BOF and EOF then Abort;
      MastData.CustMasterSrc.Dataset := MastData.CustQuery;
    except
      MastData.CustMasterSrc.Dataset := MastData.Cust;
      ActivateBtn.Down := false;
      ShowMessage('No matching records in the specified date range.');
    end;
end;


procedure TBrMStoresForm.PickPartNo(Sender: TObject);
begin
 if PartsGrid.SelectedField = MastData.PartsPartNo then	{ PartNo column only }
  begin
    if MastData.PartsPartNo.Value <> '0' then
      SearchDlg.PartNo := MastData.PartsPartNo.Value;	{ start with current PartNo }
    if SearchDlg.ShowModalParts = mrOk then
    begin
      MastData.Parts.Edit;
      MastData.PartsPartNo.Value := SearchDlg.PartNo;
    end;
  end;
end;


procedure TBrMStoresForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBrMStoresForm.FormShow(Sender: TObject);
begin
  MastData.Cust.Open;
  MastData.Cust.First;
end;

procedure TBrMStoresForm.ItemSrcStateChange(Sender: TObject);
begin
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

procedure TBrMStoresForm.SItemsGridEnter(Sender: TObject);
begin
 ActiveSource := SubSrc;
end;

procedure TBrMStoresForm.SItemsGridDblClick(Sender: TObject);
begin
ActiveSource := SubSrc;
end;

procedure TBrMStoresForm.ItemsGridDblClick(Sender: TObject);
begin
ActiveSource := ItemSrc;
end;

end.
