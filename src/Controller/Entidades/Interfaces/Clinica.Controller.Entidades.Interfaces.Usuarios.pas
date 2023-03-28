unit Clinica.Controller.Entidades.Interfaces.Usuarios;

interface

uses
  Clinica.Model.Entidades.Interfaces.Usuarios;
type
  iControllerEntidadesInterfacesUsuarios = interface
    ['{3241C17F-22C2-484D-BA12-E35A4FFF709C}']
    function UsuarioLogado : iModelEntidadesInterfacesUsuarios;
    function CriarUsuario : iModelEntidadesInterfacesUsuarios;
  end;

implementation

end.
