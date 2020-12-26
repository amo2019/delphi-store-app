unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Load: TLabel;
    Timerc: TTimer;
    Label1: TLabel;
    procedure TimercTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

procedure TSplashForm.TimercTimer(Sender: TObject);
begin
 Load.Font.Color := ClRed;
 Load.Font.Color := ClYellow;
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
 Timerc.Enabled:=False;
 Timerc.Enabled:=True;
end;

end.
