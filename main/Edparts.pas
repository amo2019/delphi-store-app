unit Edparts;

interface

uses

  SysUtils, Windows , mmsystem, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Mask, DBCtrls, DBLookup,
  Buttons, Grids, DBGrids;
  //, Variants, VarUtils

type
  TEdPartsForm = class(TForm)
    Panel1: TPanel;
    Navigator: TDBNavigator;
    Panel2: TPanel;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdPartNo: TDBEdit;
    PrintBtn: TSpeedButton;
    Bevel1: TBevel;
    PartsSource1: TDataSource;
    Label9: TLabel;
    Label10: TLabel;
    ExpDateEdit: TDBEdit;
    PopupCalBtn: TSpeedButton;
    InStores: TLabel;
    DBEdit6: TDBEdit;
    CancelButton: TBitBtn;
    OKButton: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox2: TDBComboBox;
    SpeedButton1: TSpeedButton;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBEdit3: TDBEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DExpDateEdit: TDBEdit;
    Label15: TLabel;
    DupCalBtn: TSpeedButton;
    Label16: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox7: TDBComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label3: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    procedure PrintBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PopupCalBtnClick(Sender: TObject);
    procedure ExpDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DupCalBtnClick(Sender: TObject);
    procedure DExpDateEditDblClick(Sender: TObject);
  private
     FCbActive: TDBComboBox;
     //FDataSet: TDBDataSet;
    procedure SetCbActive(cb: TDBComboBox);

    //procedure DeleteAt(idx: Integer);
    procedure AddAt(idx: Integer; s: string);

    function FindString(s: string): Integer;

    property CbActive: TDBComboBox read FCbActive write SetCbActive;
    //----------------------------------------
    function Execute: Boolean;
    //----------------------------------------

  public
    procedure Edit(PartNo: String);
    function GetString(prompt: string; var s: string): Boolean;
    function GetInteger(prompt: string; var i: Integer): Boolean;
  end;

var
  EdPartsForm: TEdPartsForm;
  Var X : Integer;
implementation

{$R *.dfm}

uses DataMod, Pickdate;


procedure TEdPartsForm.Edit(PartNo: String);
begin
  MastData.Parts.Open;
  MastData.Parts.Locate('PartNo', PartNo, []);
  ShowModal;
end;

procedure TEdPartsForm.PrintBtnClick(Sender: TObject);
begin
  if MessageDlg('   Print this form?', mtConfirmation, [mbYes,mbNo], 0)
    = mrYes then Print;
end;

procedure TEdPartsForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MastData.DataSetApplyUpdates(MastData.Parts, ModalResult = mrOK);
end;

procedure TEdPartsForm.PopupCalBtnClick(Sender: TObject);
begin
  if not (MastData.PartsExpDate.AsString = '') then
     BrDateForm.Date := MastData.PartsExpDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now;
  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.Parts.Edit;
    MastData.PartsExpDate.Value := BrDateForm.Date;
    ExpDateEdit.SelectAll;
  end;
end;

procedure TEdPartsForm.ExpDateEditKeyPress(Sender: TObject; var Key: Char);
begin
 { if Key = ^J then
  begin
    PickDate(Sender);
    Key := #0;
  end;}
end;

procedure TEdPartsForm.SpeedButton3Click(Sender: TObject);
Var
   S: String;
   PrevRecord: TBookmark;
begin
with MastData do
try
    PrevRecord := Parts.GetBookmark;
    Parts.DisableControls;
    Parts.First;
    //TempTotal := 0;			{ use temp for efficiency }
  while not Parts.EOF do
   begin
   FCbActive := DBComboBox2;
   DBComboBox2.Visible := True;
   S := partsCompName.Value; // DBComboBox2.Text;
 if  (FindString(s))= -1 then
   begin
   FCbActive := DBComboBox2;
   DBComboBox2.Visible := True;
   S :=partsCompName.Value; //DBComboBox2.Text;
     AddAt(0, s);
   CbActive.Sorted := not CbActive.Sorted;
   {FCbActive := DBComboBox1;
   DBComboBox1.Visible := True;
     AddAt(0, s);
   CbActive.Sorted := not CbActive.Sorted;
   }
   {except
    ShowMessage('Wrong.... Maybe Its Allready Not Found');
    ModalResult := mrNone;
   end
  else
    ShowMessage('Wrong.... Maybe Its Allready Not Found');
   } //TempTotal := TempTotal + ItemsExtPrice.Value;
  end;
  Parts.Next;
  end;
  //OrdersItemsTotal.Value := TempTotal;
  finally
       Parts.EnableControls;


 end;
      MastData.Parts.GoToBookmark(PrevRecord);
      MastData.Parts.FreeBookmark(PrevRecord);
end;

procedure TEdPartsForm.FormCreate(Sender: TObject);
begin
 X := 0;
end;

//---------------------------------------

procedure TEdPartsForm.SetCbActive(cb: TDBComboBox);
begin
  if FCbActive <> cb then
  begin
    FCbActive.Visible := False;
    FCbActive := cb;
    FCbActive.Visible := True;
   // NewSelection;
  end;
end;


//
// Delete an item from the active combobox given its index.
// Ignores bogus indices.
//
{procedure TEdPartsForm.DeleteAt(idx: Integer);
begin
  if idx >= 0 then
    CbActive.Items.Delete(idx);
end;}


//
// Add a string into the active combobox at the given index.
// If the index is too big, append the item, if too small,
// insert it at the top.
//
procedure TEdPartsForm.AddAt(idx: Integer; s: string);
begin
  if idx > CbActive.Items.Count then
    CbActive.Items.Append(s)
  else
  begin
    if idx < 0 then
      idx := 0;
    CbActive.Items.Insert(idx, s);

    // SelectAt(FindString(s));

  end;
end;

function TEdPartsForm.FindString(s: string): Integer;
var
  i: Integer;
begin
  i := 0;
  while (i < CbActive.Items.Count) and (CbActive.Items[i] <> s) do
    inc(i);
  if CbActive.Items[i] = s then
   Result := i
   else
   Result := -1;
end;
//---------------------------------------
function TEdPartsForm.Execute: Boolean;
begin
  DBEdit3.Text := '';
  Result := ShowModal = mrOk;
end;
 
function TEdPartsForm.GetString(prompt: string; var s: string): Boolean;
begin
 // PromptLabel.Caption := prompt;
  Result := Execute;
  if Result then
    s := DBEdit3.Text;
end;

function TEdPartsForm.GetInteger(prompt: string; var i: Integer): Boolean;
begin
 // PromptLabel.Caption := prompt;
  Result := Execute;
  if Result then
    i := StrToInt(DBEdit3.Text); //DBComboBox1
end;
//---------------------------------------


procedure TEdPartsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 PlaySound('C:\WINDOWS\MEDIA\LOGOFF', 0, SND_ASYNC);
{ MainF.DBComboBox1.Items.SaveToFile('d:\arch\combo1.txt');
 MainF.DBComboBox3.Items.SaveToFile('d:\arch\combo2.txt');
 MainF.DBComboBox7.Items.SaveToFile('d:\arch\combo3.txt');
 PlaySound('C:\WINDOWS\MEDIA\LOGOFF', 0, SND_ASYNC);
 }
end;

procedure TEdPartsForm.SpeedButton2Click(Sender: TObject);
begin

if (X = 0) then
 begin
 DBComboBox2.AutoComplete := False;
 X := 1;
 end
else
 if (X = 1) then
 begin
 DBComboBox2.AutoComplete := True;
 X := 0;
 end;
end;

procedure TEdPartsForm.SpeedButton7Click(Sender: TObject);
begin
if (X = 0) then
 begin
 DBComboBox6.AutoComplete := False;
 X := 1;
 end
else
 if (X = 1) then
 begin
 DBComboBox6.AutoComplete := True;
 X := 0;
 end;
end;

procedure TEdPartsForm.SpeedButton5Click(Sender: TObject);
begin
if (X = 0) then
 begin
 DBComboBox3.AutoComplete := False;
 X := 1;
 end
else
 if (X = 1) then
 begin
 DBComboBox3.AutoComplete := True;
 X := 0;
 end;
end;

procedure TEdPartsForm.SpeedButton4Click(Sender: TObject);
Var
   S: String;
   PrevRecord: TBookmark;
begin
with MastData do
try
    PrevRecord := Parts.GetBookmark;
    Parts.DisableControls;
    Parts.First;
    //TempTotal := 0;			{ use temp for efficiency }
  while not Parts.EOF do
   begin
   FCbActive := DBComboBox3;
   DBComboBox3.Visible := True;
   S := partsCommName.Value; // DBComboBox2.Text;
 if  (FindString(s))= -1 then
   begin
   FCbActive := DBComboBox3;
   DBComboBox3.Visible := True;
   S :=partsCommName.Value; //DBComboBox2.Text;
     AddAt(0, s);
   CbActive.Sorted := not CbActive.Sorted;

  end;
  Parts.Next;
  end;
  //OrdersItemsTotal.Value := TempTotal;
  finally
     Parts.EnableControls;
 end;
     MastData.Parts.GoToBookmark(PrevRecord);
     MastData.Parts.FreeBookmark(PrevRecord);
end;

procedure TEdPartsForm.SpeedButton6Click(Sender: TObject);
Var
   S: String;
   PrevRecord: TBookmark;
begin
with MastData do
try
    PrevRecord := Parts.GetBookmark;
    Parts.DisableControls;
    Parts.First;
    //TempTotal := 0;			{ use temp for efficiency }
  while not Parts.EOF do
   begin
   FCbActive := DBComboBox6;
   DBComboBox6.Visible := True;
   S := partsCompName.Value; // DBComboBox2.Text;
 if  (FindString(s))= -1 then
   begin
   FCbActive := DBComboBox6;
   DBComboBox6.Visible := True;
   S :=partsCompName.Value; //DBComboBox2.Text;
     AddAt(0, s);
   CbActive.Sorted := not CbActive.Sorted;
  
  end;
  Parts.Next;
  end;
  //OrdersItemsTotal.Value := TempTotal;
  finally
      Parts.EnableControls;
  end;
   MastData.Parts.GoToBookmark(PrevRecord);
   MastData.Parts.FreeBookmark(PrevRecord);
end;

procedure TEdPartsForm.SpeedButton8Click(Sender: TObject);
Var
   S: String;
   PrevRecord: TBookmark;
begin
with MastData do
try
    PrevRecord := Parts.GetBookmark;
    Parts.DisableControls;
    Parts.First;
    //TempTotal := 0;			{ use temp for efficiency }
  while not Parts.EOF do
   begin
   FCbActive := DBComboBox5;
   DBComboBox5.Visible := True;
   S := partsCommName.Value; // DBComboBox2.Text;
 if  (FindString(s))= -1 then
   begin
   FCbActive := DBComboBox5;
   DBComboBox5.Visible := True;
   S :=partsCommName.Value; //DBComboBox2.Text;
     AddAt(0, s);
   CbActive.Sorted := not CbActive.Sorted;
   end;
  Parts.Next;
  end;
  //OrdersItemsTotal.Value := TempTotal;
  finally
     Parts.EnableControls;
 end;
  MastData.Parts.GoToBookmark(PrevRecord);
  MastData.Parts.GoToBookmark(PrevRecord);
end;

procedure TEdPartsForm.SpeedButton9Click(Sender: TObject);
begin
if (X = 0) then
 begin
 DBComboBox5.AutoComplete := False;
 X := 1;
 end
else
 if (X = 1) then
 begin
 DBComboBox5.AutoComplete := True;
 X := 0;
 end;
end;

procedure TEdPartsForm.SpeedButton1Click(Sender: TObject);
begin
with MastData do
try
 Parts.Edit;
 partsCompName.Value := DPartsCompName.Value ;
 PartsCommName.Value := DPartsCommName.Value ;
 PartsListPrice.Value := DPartsUprice.Value ;
 PartsExpDate.Value := DPartsExpDate.Value ;
 PartsUnit.Value := DPartsUnit.Value ;
finally
Parts.Post;
end;
end;
procedure TEdPartsForm.DupCalBtnClick(Sender: TObject);
begin
  if not (MastData.DPartsExpDate.AsString = '') then
     BrDateForm.Date := MastData.DPartsExpDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now;
  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.DParts.Edit;
    MastData.DPartsExpDate.Value := BrDateForm.Date;
    DExpDateEdit.SelectAll;
  end;
end;

procedure TEdPartsForm.DExpDateEditDblClick(Sender: TObject);
begin
  if not (MastData.DPartsExpDate.AsString = '') then
     BrDateForm.Date := MastData.DPartsExpDate.Value 	{ start with current date }
  else
     BrDateForm.Date := Now;
  if BrDateForm.ShowModal = mrOk then
  begin
    MastData.DParts.Edit;
    MastData.DPartsExpDate.Value := BrDateForm.Date;
    DExpDateEdit.SelectAll;
  end;
end;

end.
