unit Clinica.Controller.Interfaces.Pesquisa;

interface

uses
  Clinica.Model.Entidades.Interfaces.Pacientes;

type
  iControllerInterfacesPesquisaPacientes = interface
    ['{66E6C8F9-1CA6-4F79-A798-2FE9A89C0B4A}']
    function Pesquisar: iControllerInterfacesPesquisaPacientes;
    function Id: string;
    function Nome: string;
    procedure Paciente(aValue : string);overload;
    function Paciente : iModelEntidadesInterfacesPacientes;overload;
  end;

implementation

end.
