unit Clinica.Controller.Entidades.Pacientes;

interface

uses
  Clinica.Controller.Entidades.Interfaces.Pacientes, 
  Clinica.Model.Entidades.Interfaces.Pacientes;

type
  TControllerEntidadesPacientes = class(TInterfacedObject, iControllerEntidadesInterfacesPacientes)
  private
    { private }
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEntidadesInterfacesPacientes;
    function CriarPaciente : iModelEntidadesInterfacesPacientes;
  end;

implementation

uses
  Clinica.Model.Entidades.Pacientes;

{ TControllerEntidadesPacientes }

constructor TControllerEntidadesPacientes.Create;
begin

end;

function TControllerEntidadesPacientes.CriarPaciente: iModelEntidadesInterfacesPacientes;
begin
  result := TModelEntidadesPacientes.New;
end;

destructor TControllerEntidadesPacientes.Destroy;
begin
  inherited;

end;

class function TControllerEntidadesPacientes.New: iControllerEntidadesInterfacesPacientes;
begin
  result := self.Create;
end;

end.
