unit Clinica.Model.DAO.Interfaces.Usuarios;

interface

uses
  Clinica.Model.Entidades.Interfaces.Usuarios;
  
  type
  iModelDAOInterfacesUsuarios = interface
    ['{1A8D92E0-F48D-4CA5-AD9D-06DE4006FAC9}']
    function DAO(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
    function CriarUsuario(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
    function EditarUsuario(aValue : iModelEntidadesInterfacesUsuarios) : iModelDAOInterfacesUsuarios;
  end;

implementation

end.
