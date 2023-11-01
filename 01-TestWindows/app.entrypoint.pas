uses
  qtx.sysutils,
  qtx.classes,
  qtx.time,
  qtx.dom.widgets,
  qtx.dom.theme,
  qtx.dom.types,
  qtx.dom.events,
  qtx.dom.graphics,
  qtx.dom.application, 
  qtx.dom.forms,
  qtx.dom.window,
  qtx.dom.control.common,
  qtx.dom.control.contentbox,
  qtx.dom.control.label,
  qtx.dom.stylesheet,
  form1,
  form2;
                       
begin
  TQTXDOMApplicationWindowed.Create(nil, procedure (Widget: TQTXComponent)
  begin
    // Typecast to our application model class
    var lApplication := TQTXDOMApplicationWindowed(Application);

    // Set a dark standard background on the display
    lApplication.display.ViewPort.CssClasses.ClassAdd("QTXDisplayBackground");

    // Set default font, all widgets will inherit this. By changing this
    // you can change the font your entire application uses
    Widget.Handle.style["font-family"] := "Segoe UI";

    {$I "app::form.init"}
  end);
  
end.