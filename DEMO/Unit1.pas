unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LYLed, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    LYLed1: TLYLed;
    LYLed2: TLYLed;
    LYLed3: TLYLed;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    LYLed4: TLYLed;
    LYLed5: TLYLed;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    LYLed6: TLYLed;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
  aa,bb,cc:tlyled;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not Assigned(aa) then
  aa:=tlyled.create(self);
  aa.Parent:=panel1;
  aa.Left:=10;
  aa.SoundString:='.\WAVE\Driveby.wav';
  aa.Value:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not Assigned(bb) then
  bb:=tlyled.create(self);
  bb.Parent:=panel1;
  bb.Left:=50;
  bb.SoundString:='.\WAVE\Driveby.wav';
  bb.Value:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not Assigned(cc) then
  cc:=tlyled.create(self);
  cc.Parent:=self;
  cc.Left:=100;
  cc.SoundString:='.\WAVE\Driveby.wav';
  cc.Value:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  aa.Value:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  bb.Value:=false;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  cc.Value:=false;

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  lyled1.Value:=false;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  lyled2.Value:=false;

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  lyled3.Value:=false;

end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  lyled1.Value:=true;

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  lyled2.Value:=true;

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  lyled3.Value:=true;

end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  lyled5.Value:=true;

end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  lyled5.Value:=false;

end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  lyled4.Value:=true;

end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  lyled4.Value:=false;

end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  lyled6.Value:=true;

end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  lyled6.Value:=false;

end;

end.
