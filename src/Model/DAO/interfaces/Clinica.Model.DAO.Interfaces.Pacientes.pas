unit Clinica.Model.DAO.Interfaces.Pacientes;

interface

uses
  Clinica.Model.Entidades.Interfaces.Pacientes;
  type
  iModelDAOInterfacesPacientes = interface
    ['{35FE58D4-7931-417C-AB3D-A81D51D7CA38}']
    function DAO(aValue : iModelEntidadesInterfacesPacientes) : iModelDAOInterfacesPacientes;
    function CriarPaciente(aValue : iModelEntidadesInterfacesPacientes) : iModelDAOInterfacesPacientes;
    function EditarPaciente(aValue : iModelEntidadesInterfacesPacientes) : iModelDAOInterfacesPacientes;
  end;

implementation

end.
