program Proj_Projeto;

uses
  Vcl.Forms,
  Unit_Principal in 'Unit_Principal.pas' {Form_cliente},
  uFormat in 'uFormat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_cliente, Form_cliente);
  Application.Run;
end.
