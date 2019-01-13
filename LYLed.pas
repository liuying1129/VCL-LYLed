{**********************************************************}
{                                                          }
{  TLYLED Component Version 02.11.8                        }
{  作者：刘鹰                                              }
{                                                          }
{  新功能：1。增加边框                                     }
{          2.增加CLICK事件                                 }
{          3.增加valuechange事件                           }
{                                                          }
{  功能: 按你所设值(true or false)不同而显示不同的颜色     }
{                                                          }
{                                                          }
{  他是一个免费软件,如果你修改了他,希望我能有幸看到你的杰作}
{                                                          }
{  我的 Email: Liuying1129@163.com                         }
{                                                          }
{  版权所有,欲进行商业用途,请与我联系!!!                   }
{                                                          }
{  Version 03.07.10                                        }
{  新功能：1。增加声音报警                                 }
{                                                          }
{  BUG:1.对于声音报警功能，动态创建该组件时只支持AOwner    }
{        参数为当前窗体，如，在按钮点击事件中写            }
{        bb:=tlyled.create(self);                          }
{      2.                                                  }
{                                                          }
{**********************************************************}

unit LYLed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,mmsystem;

TYPE TWORD0=1..65535;
  
type
  TLYShape = class(TShape)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create(AOwner:tcomponent);override;
    destructor destroy;override;
  published
    { Published declarations }
  end;

type
  TLYPanel = class(TCustomPanel)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create(AOwner:tcomponent);override;
    procedure createwnd;override;
    destructor destroy;override;
  published
    { Published declarations }
  end;

type TVALCHANGEEVENT=PROCEDURE(Sender:TObject;Value:Boolean)OF OBJECT;

type
  TLYLed = class(TCustomPanel)
  private
    { Private declarations }
    flyshape:tlyshape;
    flypanel:tlypanel;
    fvalue:boolean;
    foncolor:tcolor;
    foffcolor:tcolor;
    ftimer:ttimer;
    FBLINK:BOOLEAN;
    FINTERVAL: TWORD0;
    fBorderColor:tcolor;
    FhasSound:boolean;
    fonLYPANELclK:tNOTIFYEVENT;
    fonLYPANELDblClick:TNOTIFYEVENT;
    fOnLYPanelMouseDown:TMouseEvent;
    fOnLYPanelMouseMove:TMouseMoveEvent;
    fOnLYPanelMouseUp:TMouseEvent;
    FOnValueChange:TVALCHANGEEVENT;
    FSoundString: string;
    FSoundInValue: boolean;
    aaowner:tcomponent;
    fCaption:string;
    fCursor:TCursor;
    procedure fsetvalue(v:boolean);
    procedure fsetoncolor(c:tcolor);
    procedure fsetoffcolor(c:tcolor);
    PROCEDURE FSETINTERVAL(I:TWORD0);
    procedure fsetblink(B:boolean);
    procedure fsetBorderColor(c:tcolor);
    procedure FsethasSound(v:boolean);
    procedure FsetSoundString(v:string);
    procedure FsetSoundInValue(v:boolean);
    procedure FTIMERONTIMER(sender:tobject);
    PROCEDURE LYPANELCLICK(SENDER:TOBJECT);
    PROCEDURE LYPANELDblClick(SENDER:TOBJECT);
    Procedure LYPanelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Procedure LYPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    Procedure LYPanelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    Procedure UpdateSound;
    Procedure fsetCaption(v:string);
    Procedure fsetCursor(v:TCursor);
  protected
    { Protected declarations }
    procedure resize;override;
  public
    { Public declarations }
    constructor create(AOwner:tcomponent);override;
    procedure createwnd;override;
    destructor destroy;override;
  published
    { Published declarations }
    property Value:boolean read fvalue write fsetvalue;
    property OnColor:tcolor read foncolor write fsetoncolor;
    property OffColor:tcolor read foffcolor write fsetoffcolor;
    property Interval:TWORD0 READ FINTERVAL WRITE FSETINTERVAL;
    property Blink:boolean read fblink write fsetblink;
    property BorderColor:tcolor read fBorderColor write fsetBorderColor;
    property Caption:string read fCaption write fsetCaption;
    property Cursor:TCursor read fCursor write fsetCursor;
    property Visible;
    property Hint;
    property ShowHint;
    property PopupMenu;
    property hasSound:boolean read FhasSound write FsethasSound;
    property SoundString:string read FSoundString write FsetSoundString;
    property SoundInValue:boolean read FSoundInValue write FsetSoundInValue;
    property OnClick:TNOTIFYEVENT READ fonLYPANELclK WRITE fonLYPANELclK;
    property OnDblClick:TNOTIFYEVENT READ fonLYPANELDblClick WRITE fonLYPANELDblClick;
    property OnValueChange:TVALCHANGEEVENT READ FOnValueChange WRITE FOnValueChange;
    property OnMouseDown:TMouseEvent READ fOnLYPanelMouseDown WRITE fOnLYPanelMouseDown;
    property OnMouseMove:TMouseMoveEvent READ fOnLYPanelMouseMove WRITE fOnLYPanelMouseMove;
    property OnMouseUp:TMouseEvent READ fOnLYPanelMouseUp WRITE fOnLYPanelMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Eagle_Ly', [TLYLed]);
end;

{ TLYShape }

constructor TLYShape.create(AOwner: tcomponent);
begin
  inherited create(AOwner);
  width:=19;
  height:=19;
  pen.Color:=clmaroon;
end;

destructor TLYShape.destroy;
begin
  inherited;
end;

{ TLYPanel }

constructor TLYPanel.create(AOwner: tcomponent);
begin
  inherited create(aowner);
  width:=17;
  height:=17;
  BevelInner:=bvRaised;
  color:=clBTNFACE;
end;

procedure TLYPanel.createwnd;
begin
  inherited;
  //caption:='';
end;

destructor TLYPanel.destroy;
begin
  inherited;
end;

{ TLYLed }

constructor TLYLed.create(AOwner: tcomponent);
begin
  inherited create(aowner);
  aaowner:=aowner;
  fvalue:=FALSE;
  foncolor:=clred;
  foffcolor:=clbtnface;
  FBLINK:=TRUE;
  FINTERVAL:=500;
  fBorderColor:=clmaroon;
  ftimer:=ttimer.Create(self);
  FTIMER.Interval:=FINTERVAL;
  FTIMER.OnTimer:=FTIMERONTIMER;
  width:=19;
  height:=19;
  bevelouter:=bvnone;
  
  flyshape:=tlyshape.create(self);
  flyshape.Parent:=self;
  flypanel:=tlypanel.create(self);
  flypanel.Parent:=self;
  flypanel.Top:=1;
  flypanel.Left:=1;
  FLYPANEL.OnClick:=LYPANELCLICK;
  FLYPANEL.OnDblClick:=LYPANELDblClick;
  FLYPANEL.OnMouseDown:=LYPanelMouseDown;
  FLYPANEL.OnMouseMove:=LYPanelMouseMove;
  FLYPANEL.OnMouseUp:=LYPanelMouseUp;

  FhasSound:=true;
  FSoundString:='.\Wave\Driveby.wav';
  FSoundInValue:=true;
end;

procedure TLYLed.createwnd;
begin
  inherited;
  //caption:='';
end;

destructor TLYLed.destroy;
begin
  playsound(NIL,0,SND_ASYNC+SND_LOOP+SND_NODEFAULT);
  inherited;
end;

procedure TLYLed.fsetblink(B: boolean);
begin
  IF b=FBLINK THEN EXIT;
  FBLINK:=b;
  IF FBLINK THEN
    FTIMER.Enabled:=TRUE
  ELSE
  BEGIN
    FTIMER.Enabled:=FALSE;
    IF FVALUE THEN flypanel.Color:=FONCOLOR ELSE flypanel.COLOR:=FOFFCOLOR;
  END;
end;

procedure TLYLed.fsetBorderColor(c: tcolor);
begin
  if c=fBorderColor then exit;
  fBorderColor:=c;
  flyshape.Pen.Color:=fBorderColor;
end;

procedure TLYLed.FSETINTERVAL(I: TWORD0);
begin
  IF i=FINTERVAL THEN EXIT;
  FINTERVAL:=i;
  FTIMER.Interval:=FINTERVAL;
end;

procedure TLYLed.fsetoffcolor(c: tcolor);
begin
  if c=foffcolor then exit;
  foffcolor:=c;
  if fvalue then flypanel.color:=foncolor else flypanel.color:=foffcolor;
end;

procedure TLYLed.fsetoncolor(c: tcolor);
begin
  if c=foncolor then exit;
  foncolor:=c;
  if fvalue then flypanel.color:=foncolor else flypanel.color:=foffcolor;
end;

procedure TLYLed.FsethasSound(v: boolean);
begin
  if v=FhasSound then exit;
  FhasSound:=v;

  UpdateSound;
end;

procedure TLYLed.FsetSoundInValue(v: boolean);
begin
  if v=FSoundInValue then exit;
  FSoundInValue:=v;

  UpdateSound;
end;

procedure TLYLed.FsetSoundString(v: string);
begin
  if v=FSoundString then exit;
  FSoundString:=v;

  UpdateSound;
end;

procedure TLYLed.fsetvalue(v: boolean);
begin
  if v=fvalue then exit;
  fvalue:=v;
  if fvalue then flypanel.color:=foncolor else flypanel.color:=foffcolor;
  IF (NOT (csDestroying IN COMPONENTSTATE)) THEN
  BEGIN
    IF ASSIGNED(FOnValueChange) THEN FOnValueChange(SELF,FVALUE);
  END;

  UpdateSound;
end;

procedure TLYLed.FTIMERONTIMER(sender: tobject);
begin
  IF FVALUE THEN
  BEGIN
    IF flypanel.COLOR=FONCOLOR THEN flypanel.COLOR:=FOFFCOLOR ELSE flypanel.COLOR:=FONCOLOR;
  END;
end;

procedure TLYLed.LYPANELCLICK(SENDER: TOBJECT);
begin
  IF ASSIGNED(FONLYPANELCLK) THEN FONLYPANELCLK(SELF);
end;

procedure TLYLed.resize;
begin
  inherited;
  flyshape.Width:=width;
  flyshape.Height:=height;
  flypanel.Width:=width-2;
  flypanel.Height:=height-2;
end;

Procedure TLYLed.UpdateSound;
var
  loop:integer;
  ifPlaySound:boolean;
begin
  if (csDesigning in ComponentState) then exit;
  ifPlaySound:=false;
  for Loop:=0 to aaowner.ComponentCount-1 do
  begin
    if (aaowner.Components[Loop] is TLYLed) then
    begin
      if ((aaowner.Components[Loop] as TLYLed).SoundInValue=(aaowner.Components[Loop] as TLYLed).Value)
        and ((aaowner.Components[Loop] as TLYLed).hasSound)
        and (FileExists((aaowner.Components[Loop] as TLYLed).SoundString)) then
        begin
          ifPlaySound:=true;
          break;
        end;
    end;
  end;
    
  if ifPlaySound then
  begin
    playsound(pchar(fsoundstring),0,SND_ASYNC+SND_LOOP+SND_NODEFAULT+SND_NOSTOP)   
  end else
  begin
    playsound(NIL,0,SND_ASYNC+SND_LOOP);
  end;
end;

procedure TLYLed.fsetCaption(v: string);
begin
  if v=fCaption then exit;
  fCaption:=v;
  flypanel.Caption:=fCaption;
end;

procedure TLYLed.LYPanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IF ASSIGNED(fOnLYPanelMouseDown) THEN fOnLYPanelMouseDown(SELF,Button,Shift,X, Y);
end;

procedure TLYLed.LYPanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  IF ASSIGNED(fOnLYPanelMouseMove) THEN fOnLYPanelMouseMove(SELF,Shift,X, Y);
end;

procedure TLYLed.LYPanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IF ASSIGNED(fOnLYPanelMouseUp) THEN fOnLYPanelMouseUp(SELF,Button,Shift,X, Y);
end;

procedure TLYLed.fsetCursor(v: TCursor);
begin
  if v=fCursor then exit;
  fCursor:=v;
  flypanel.Cursor:=fCursor;
end;

procedure TLYLed.LYPANELDblClick(SENDER: TOBJECT);
begin
  IF ASSIGNED(fonLYPANELDblClick) THEN fonLYPANELDblClick(SELF);
end;

end.
