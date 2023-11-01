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
  qtx.dom.window,
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
  qtx.dom.control.listbox,
  qtx.time,
  qtx.memory,
  qtx.dom.control.common,
  form2;

type

  Tform1 = class(TQTXWindow)
  {$I "intf::form1"}
  protected
    Form2:TForm2;
    procedure HandlebtnAddTextToListClick(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
    procedure InitializeObject; override;
    procedure HandlebtnShowSelectedText(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
    procedure HandlebtnShowForm2(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
    procedure FinalizeObject; override;
    procedure StyleObject; override;
  public

  end;


implementation

procedure Tform1.HandlebtnAddTextToListClick(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
var
  s:string;
begin
  s := Edit1.Text.Trim();
  if s.Length()>0 then
    ListBox1.AddText('<b>'+s+'</b>');
end;

procedure Tform1.InitializeObject;
begin
  inherited;
  {$I "impl::form1"}
  Form2 := nil;
  asm
    document.getElementById('btnDOM').innerText = 'test button';
//    document.getElementById('btnDOM').onclick = function () { alert('click'); }
    document.getElementById('btnDOM').onclick = () => { alert('click'); }
  end;
end;

procedure Tform1.HandlebtnShowSelectedText(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
begin
  if Assigned(ListBox1.Selected) then begin
    ShowMessage(ListBox1.Selected.InnerHTML);
    ShowMessage(ListBox1.Selected.InnerText);
  end;
end;

procedure Tform1.HandlebtnShowForm2(Sender: TQTXDOMMouseDelegate; EventObj: JMouseEvent);
begin
  if Assigned(Form2) then
    Form2.Show
  else
    Form2 := tform2.Create(self.Owner, procedure (Window: TQTXWindow)
      begin
        Window.x := 0;
        Window.y := 0;
        Window.Width := 300;
        Window.Height := 300;
        Window.PositionMode := TQTXWidgetPositionMode.cpAbsolute;
        Window.Visible := true;
      end);
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
