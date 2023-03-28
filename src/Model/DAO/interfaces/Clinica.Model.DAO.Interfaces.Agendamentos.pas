unit Clinica.Model.DAO.Interfaces.Agendamentos;

interface

uses
  Clinica.Model.Entidades.Interfaces.Agendamentos;

  type
  iModelDAOInterfacesAgendamentos = interface
    ['{91B5C31A-BD0B-4B8E-AB4A-34C64AEC05AF}']
    function DAO(aValue : iModelEntidadesInterfacesAgendamentos) : iModelDAOInterfacesAgendamentos;
    function CriarAgendamento(aValue : iModelEntidadesInterfacesAgendamentos) : iModelDAOInterfacesAgendamentos;
    function EditarAgendamento(aValue : iModelEntidadesInterfacesAgendamentos) : iModelDAOInterfacesAgendamentos;
  end;

implementation

end.
