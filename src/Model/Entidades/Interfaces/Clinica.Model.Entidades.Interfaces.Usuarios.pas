unit Clinica.Model.Entidades.Interfaces.Usuarios;

interface

uses
  Clinica.Model.Entidades.Interfaces.Padrao,
  Clinica.Model.Conexao.Interfaces,
  System.Generics.Collections,
  Clinica.Model.Entidades.Interfaces.Permicoes, Data.DB;
  
type
  iModelEntidadesInterfacesUsuarios = interface
    ['{F13EF3FA-FAF5-4F19-B3CB-7927A68BEB25}']
    function Senha(aValue: string): iModelEntidadesInterfacesUsuarios; overload;
    function Senha: string; overload;
    function DataSet: IModelDataSet;
    function Padrao: iModelEntidadesInterfacesPadrao<iModelEntidadesInterfacesUsuarios>;
    function Permicoes: iModelEntidadesInterfacesPermicoes;
    function DataSource(aValue: TDataSource): iModelEntidadesInterfacesUsuarios; 
    function Todos : iModelEntidadesInterfacesUsuarios;
    function Grid : iModelEntidadesInterfacesUsuarios;
    procedure DAO;
  end;

implementation

end.
