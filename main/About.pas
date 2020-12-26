unit About;

interface

uses Windows, mmsystem, WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils, ImgList, ComCtrls, ActnList;

type
  TAboutBox = class(TForm)
    imgsIcons: TImageList;
    btnShowIcon: TBitBtn;
    btnHideIcon: TBitBtn;
    btnAbout: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ProgramIcon: TImage;
    Label3: TLabel;
    Label4: TLabel;
    FreeRes: TLabel;
    PhysMem: TLabel;
    Timer1: TTimer;
    ActionList1: TActionList;
    Loading: TAction;
    Loading1: TAction;
    Loading3: TAction;
    Loading4: TAction;
    Loading5: TAction;
    Loading6: TAction;
    Loading7: TAction;
    Loading2: TAction;
    PicBtn: TBitBtn;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;
  I       : Integer;
implementation

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
var
  MS: TMemoryStatus;
begin
  I := 1;
  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);
end;

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
PicBtn.Action := ActionList1.Actions[1];// ImageIndex[i];
I := I + 1;
if (I = 7)  then I := 0;
end;

procedure TAboutBox.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TAboutBox.FormShow(Sender: TObject);
begin
PlaySound('D:\MStores\MastApp\SEP5', 0, SND_ASYNC);
end;

end.

