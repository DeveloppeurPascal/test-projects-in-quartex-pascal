unit form2;

interface

uses
  qtx.sysutils,
  qtx.classes,
  qtx.dom.types,
  qtx.dom.events,
  qtx.dom.graphics,
  qtx.dom.widgets,
  qtx.dom.theme,
  qtx.dom.application,
  qtx.dom.forms,
  qtx.dom.window,
  qtx.delegates,
  qtx.dom.events.mouse,
  qtx.dom.events.pointer,
  qtx.dom.events.keyboard,
  qtx.dom.events.touch,
  qtx.dom.control.Button;

type

  Tform2 = class(TQTXWindow)
  {$I "intf::form2"}
  protected
    procedure HandlebtnClose(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
    procedure InitializeObject; override;
    procedure FinalizeObject; override;
    procedure StyleObject; override;
  public
    procedure Show;
    procedure Hide;
  end;


implementation

procedure Tform2.HandlebtnClose(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
begin
  Hide;
end;

procedure Tform2.InitializeObject;
begin
  inherited;
  {$I "impl::form2"}
end;

procedure Tform2.FinalizeObject;
begin
  inherited;
end;

procedure Tform2.StyleObject;
begin
  inherited;
  PositionMode := TQTXWidgetPositionMode.cpInitial;
  DisplayMode := TQTXWidgetDisplayMode.cdBlock;
end;

procedure Tform2.Show;
begin
  Visible := true;
  Self.SetFocus;
end;

procedure Tform2.Hide;
begin
  Visible := false;
end;

end.
