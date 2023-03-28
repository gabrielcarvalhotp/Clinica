unit Clinica.Model.Entidades.Interfaces.Permicoes;

interface

uses
  Clinica.Model.Entidades.Interfaces.Padrao;
  
  type
  iModelEntidadesInterfacesPermicoes = interface 
    ['{4F2E8856-C562-45F3-BE10-6BB009626661}']
    function Id_Usuario(aValue : string) : iModelEntidadesInterfacesPermicoes;overload;
    function Executar(aValue : string) : iModelEntidadesInterfacesPermicoes;overload;
    function Inserir(aValue : string) : iModelEntidadesInterfacesPermicoes;overload;
    function Alterar(aValue : string) : iModelEntidadesInterfacesPermicoes;overload;
    function Deletar(aValue : string) : iModelEntidadesInterfacesPermicoes;overload;
    function Id_Usuario : integer;overload;
    function Executar : string; overload;
    function Inserir : string; overload; 
    function Alterar : string; overload;
    function Deletar : string; overload;
    function Padrao : iModelEntidadesInterfacesPadrao<iModelEntidadesInterfacesPermicoes>;
    function Pesquisar(aName, aId : string) : iModelEntidadesInterfacesPermicoes;
    function Atribuir : iModelEntidadesInterfacesPermicoes;  
  end;

implementation

end.
