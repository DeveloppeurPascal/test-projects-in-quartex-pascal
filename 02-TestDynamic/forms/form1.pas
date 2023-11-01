unit form1;

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
qtx.delegates,
qtx.dom.events.mouse,
qtx.dom.events.pointer,
qtx.dom.events.keyboard,
qtx.dom.events.touch,
qtx.dom.stylesheet,
qtx.dom.control.edit,
qtx.dom.control.Button,
qtx.dom.control.label,
qtx.dom.control.contentbox,
qtx.dom.control.listbox;

type

  Tform1 = class(TQTXForm)
  {$I "intf::form1"}
  protected
    procedure InitializeObject; override;
    procedure HandlebtnAddTextToList(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
    procedure FinalizeObject; override;
    procedure StyleObject; override;
  public

  end;

implementation

procedure Tform1.InitializeObject;
begin
  inherited;
  {$I "impl::form1"}
end;

procedure Tform1.HandlebtnAddTextToList(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
begin
  if (edit1.Text.Trim.Length>0) then
    ListBox1.AddText(edit1.Text.trim);
end;

procedure Tform1.FinalizeObject;
begin
  inherited;
end;

procedure Tform1.StyleObject;
begin
  inherited;
  PositionMode := TQTXWidgetPositionMode.cpInitial;
  DisplayMode := TQTXWidgetDisplayMode.cdBlock;
end;


end.
