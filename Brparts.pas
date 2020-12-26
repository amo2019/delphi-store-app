unit Brparts;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TDateOrder = (doMDY, doDMY, doYMD);
type
  TBrPartsForm = class(TForm)
    Panel1: TPanel;
    Navigator: TDBNavigator;
    ActivateBtn: TSpeedButton;
    Panel3: TPanel;
    PartsGrid: TDBGrid;
    Bevel1: TBevel;
    EditBtn: TSpeedButton;
    CloseBtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ExpQ: TQuery;
    ExpQPartNo: TStringField;
    ExpQVendorNo: TFloatField;
    ExpQDescription: TStringField;
    ExpQOnHand: TFloatField;
    ExpQOnOrder: TFloatField;
    ExpQCost: TCurrencyField;
    ExpQListPrice: TCurrencyField;
    ExpQUnit: TStringField;
    ExpQEXpDate: TDateField;
    ExpQInStores: TFloatField;
    ExpQCommName: TStringField;
    ExpQCompName: TStringField;
    ExpQExp: TBooleanField;
    SQLDataSrc: TDataSource;
    SpeedButton8: TSpeedButton;
    procedure ActivateQuery(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    function GetPartNo: String;
    procedure SetPartNo(NewPartNo: String);
  public
    property PartNo: String read GetPartNo write SetPartNo;
  end;

var
  BrPartsForm: TBrPartsForm;

implementation

uses EdParts, DataMod;

{$R *.dfm}

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;

  Result := doMDY;
end;

function TBrPartsForm.GetPartNo: String;
begin
  Result := MastData.PartsSource.Dataset.Fields[0].AsString;
end;

procedure TBrPartsForm.SetPartNo(NewPartNo: String);
begin
  MastData.PartsSource.Dataset := MastData.Parts;
  MastData.Parts.Locate('PartNo', NewPartNo, []);
end;          

procedure TBrPartsForm.ActivateQuery(Sender: TObject);
begin
  if not ActivateBtn.Down then
    MastData.PartsSource.Dataset := MastData.Parts
  else
    try
      MastData.PartsQuery.Close;
      MastData.PartsQuery.Open;
      MastData.PartsSource.Dataset := MastData.PartsQuery;
    except
      MastData.PartsSource.Dataset := MastData.Parts;
      raise;
    end;
end;

procedure TBrPartsForm.EditBtnClick(Sender: TObject);
begin
  if ActivateBtn.Down then
  begin
    EdPartsForm.Edit(MastData.PartsQueryPartNo.Value);
    MastData.PartsQuery.Close;
    MastData.PartsQuery.Open;
  end else
    EdPartsForm.Edit(MastData.PartsPartNo.Value);
end;

procedure TBrPartsForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBrPartsForm.FormShow(Sender: TObject);
begin
  MastData.Parts.Open;
end;

procedure TBrPartsForm.SpeedButton1Click(Sender: TObject);
var
    X :Integer;
 // St1 :Integer;
  St2 :Integer;
  St3 :Integer;
  Str1 :string;
  Str2 :string;
  Str3 :string;
  s0 :string;
begin

 GetDateOrder(Datetostr(now));

  s0:='0000000000';
  s0:= Datetostr(now);
  Str1:= '00';
  Str2:= '00';
  Str3:= '0000';
//St1:= 0;
//  St2:= 0;
//  St3:= 0;
  x:=strlen(PChar(Datetostr(now)));

  s0:= Datetostr(now);

 if (x = 10 ) then
    begin
    Str1[1] := s0[1];
    Str1[2] := s0[2];
    Str2[1] := s0[4];
    Str2[2] := s0[5];
    Str3[1] := s0[7];
    Str3[2] := s0[8];
    Str3[3] := s0[9];
    Str3[4] := s0[10];

//    St1 := StrToInt(Str1);
    St2 := StrToInt(Str2);
    St3 := StrToInt(Str3);

  if (St2 > 1 ) then
     begin
     St2 := St2 - 1;
     Str2 := IntToStr(St2);

     s0[1] := Str1[1];
     s0[2] := Str1[2];
     s0[3] := '/';
      if (St2 = 9)then
        begin
        s0[4] := '0';
        s0[5] := '9';
        end
      else
        begin
        s0[4] := Str2[1];
        s0[5] := Str2[2];
        end;
     s0[6] := '/';
     s0[7] := Str3[1];
     s0[8] := Str3[2];
     s0[9] := Str3[3];
     s0[10] := Str3[4];
     end
  else
  if (St2 = 1 ) then
     begin
     St2 := 01;
     St3 :=St3 - 1;
     Str2 := IntToStr(St2);
     Str3 := IntToStr(St3);
     Str2[1] := '1';
     Str2[2] := '2';

     s0[1] := Str1[1];
     s0[2] := Str1[2];
     s0[3] := '/';
     s0[4] := '1';
     s0[5] := '2';
     s0[6] := '/';
     s0[7] := Str3[1];
     s0[8] := Str3[2];
     s0[9] := Str3[3];
     s0[10] := Str3[4];
     end;
  end;

    Str1[1] := s0[1];
    Str1[2] := s0[2];
  if (x = 9 ) and (Str1[2] = '/' ) then
    begin
    Str1[1] := '0';
    Str1[2] := s0[1];
    Str2[1] := s0[3];
    Str2[2] := s0[4];
    Str3[1] := s0[6];
    Str3[2] := s0[7];
    Str3[3] := s0[8];
    Str3[4] := s0[9];

//    St1 := StrToInt(Str1);
    St2 := StrToInt(Str2);
    St3 := StrToInt(Str3);

  if (St2 > 1 ) then
     begin
     St2 := St2 - 1;
     Str2 := IntToStr(St2);
                          // 1/12/2004 123456789
     s0[1] := Str1[1];
     s0[2] := Str1[2];
     s0[3] := '/';
      if (St2 < 10)then
        begin
        s0[4] := '0';
        s0[5] := Str2[1];
        end
      else
        begin
        s0[4] := Str2[1];
        s0[5] := Str2[2];
        end;
     s0[6] := '/';
     s0[7] := Str3[1];
     s0[8] := Str3[2];
     s0[9] := Str3[3];
     s0[10] := Str3[4];
     end
  else
  if (St2 = 1 ) then
     begin
     St2 := 01;
    // St3 := St3 + 1;
     Str2 := IntToStr(St2);
     Str3 := IntToStr(St3-1);
     Str2[1] := '1';
     Str2[2] := '2';

     s0[1] := Str1[1];
     s0[2] := Str1[2];
     s0[3] := '/';
     s0[4] := '1';
     s0[5] := '2';
     s0[6] := '/';
     s0[7] := Str3[1];
     s0[8] := Str3[2];
     s0[9] := Str3[3];
     s0[10] := Str3[4];
     end;
     Str1[2] := '0';
  end
  else
  if (x = 9 ) and (Str1[2] <> '/' ) then
    begin
    Str1[1] := s0[1];
    Str1[2] := s0[2];
    Str2[1] := '0';
    Str2[2] := s0[4];
    Str3[1] := s0[6];
    Str3[2] := s0[7];
    Str3[3] := s0[8];
    Str3[4] := s0[9];

//    St1 := StrToInt(Str1);
    St2 := StrToInt(Str2);
    St3 := StrToInt(Str3);

   if (St2 > 1 ) then
      begin
      St2 := St2 - 1;
      Str2 := IntToStr(St2);
                          // 1/12/2004 123456789
      s0[1] := Str1[1];
      s0[2] := Str1[2];
      s0[3] := '/';
      if (St2 < 10)then
        begin
        s0[4] := '0';
        s0[5] := Str2[1];
        end
      else
        begin
        s0[4] := Str2[1];
        s0[5] := Str2[2];
        end;
     s0[6] := '/';
     s0[7] := Str3[1];
     s0[8] := Str3[2];
     s0[9] := Str3[3];
     s0[10] := Str3[4];

      // s0:='0000000000';
    end
    else
    if (St2 = 1 ) then
      begin
      St2 := 01;
      St3 :=St3 - 1;
      Str2 := IntToStr(St2);
      Str3 := IntToStr(St3);
      Str2[1] := '1';
      Str2[2] := '2';
   
      s0[1] := Str1[1];
      s0[2] := Str1[2];
      s0[3] := '/';
      s0[4] := '1';
      s0[5] := '2';
      s0[6] := '/';
      s0[7] := Str3[1];
      s0[8] := Str3[2];
      s0[9] := Str3[3];
      s0[10] := Str3[4];
      end;
    end;

 if (x = 8 ) then
    begin
    Str1[1] := '0';
    Str1[2] := s0[1];
    Str2[1] := '0';
    Str2[2] := s0[3];
    Str3[1] := s0[5];
    Str3[2] := s0[6];
    Str3[3] := s0[7];
    Str3[4] := s0[8];

   // St1 := StrToInt(Str1);
    St2 := StrToInt(Str2);
    St3 := StrToInt(Str3);

 if (St2 > 1 ) then
   begin
    St2 := St2 - 1;
    Str2 := IntToStr(St2);

    s0[1] := Str1[1];
    s0[2] := Str1[2];
    s0[3] := '/';
   if (St2 < 10 ) then
      begin
      s0[4] := '0';
      s0[5] := Str2[1];
      end
      else
      begin
       s0[4] := Str2[1];
       s0[5] := Str2[2];
      end;
    s0[6] := '/';
    s0[7] := Str3[1];
    s0[8] := Str3[2];
    s0[9] := Str3[3];
    s0[10] := Str3[4];
    end
    else
    if (St2 = 1 ) then
      begin
       St2 := 01;
       St3 :=St3 - 1;
       Str2 := IntToStr(St2);
       Str3 := IntToStr(St3);

       s0[1] := Str1[1];
       s0[2] := Str1[2];
       s0[3] := '/';
       s0[4] := '1';
       s0[5] := '2';
       s0[6] := '/';
       s0[7] := Str3[1];
       s0[8] := Str3[2];
       s0[9] := Str3[3];
       s0[10] := Str3[4];
      end;
  end;

  //*****************

{  with MastData do
    begin
    Parts.First;
    while not Parts.Eof do
    begin
     Parts.Next;
    end;
  end;
 }
 //Label1.Caption := s0;
  ExpQ.Close;
  if not (ExpQ.Prepared)then
     begin
      ExpQ.UniDirectional := True;
      ExpQ.Prepare;
     end;
  try
      ExpQ.PArams.ParamByName('FromDate').AsDate := strtoDate(s0);//EncodeDate(2000, 01, 01);//FromDate;
      ExpQ.PArams.ParamByName('ToDate').AsDate :=  Now;//ToDate;
      ExpQ.Active:=True;
      ExpQ.Open;
      PartsGrid.DataSource := SQLDataSrc;
      PartsGrid.Columns[0].Color := $004848FF;
  except
   ShowMessage('Invalid query');
   PartsGrid.DataSource := MastData.PartsSource;
  end;

end;

procedure TBrPartsForm.SpeedButton8Click(Sender: TObject);
begin
   PartsGrid.DataSource := MastData.PartsSource;
   PartsGrid.Columns[0].Color := $00E8F3FF;
end;

end.
