unit Clinica.Controller.Entidades.Agendamentos;

interface

uses
  Clinica.Controller.Entidades.Interfaces.Agendamentos, 
  Clinica.Model.Entidades.Interfaces.Agendamentos;

type
  TControllerEntidadesAgendamentos = class(TInterfacedObject, iControllerEntidadesInterfacesAgendamentos)
  private
    { private }
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEntidadesInterfacesAgendamentos;
    function CriarAgendamento: IModelEntidadesInterfacesAgendamentos;
  end;

implementation

uses
  Clinica.Model.Entidades.Agendamentos;

{ TControllerEntidadesAgendamentos }

constructor TControllerEntidadesAgendamentos.Create;
begin

end;

function TControllerEntidadesAgendamentos.CriarAgendamento: IModelEntidadesInterfacesAgendamentos;
begin
  result := TModelEntidadesAgendamentos.New;
end;

destructor TControllerEntidadesAgendamentos.Destroy;
begin
  inherited;

end;

class function TControllerEntidadesAgendamentos.New: iControllerEntidadesInterfacesAgendamentos;
begin
  result := self.Create;
end;

end.
