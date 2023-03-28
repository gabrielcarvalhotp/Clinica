unit Clinica.Model.Entidades.Interfaces.Pacientes;

interface

uses
  Clinica.Model.Conexao.Interfaces, Clinica.Model.Entidades.Interfaces.Padrao, 
  Clinica.Model.Entidades.Interfaces.Permicoes, 
  Clinica.Model.Entidades.Interfaces.Usuarios, 
  Data.DB;

type
  iModelEntidadesInterfacesPacientes = interface
    ['{6B75E73D-045B-47F6-AB55-5248FAABCED2}']
    function DataNascimento(aValue: TDateTime): iModelEntidadesInterfacesPacientes; overload;
    function Idade(aValue: string): iModelEntidadesInterfacesPacientes;overload;
    function Telefone(aValue: string): iModelEntidadesInterfacesPacientes; overload;
    function Email(aValue: string): iModelEntidadesInterfacesPacientes; overload;
    function Plano_Saude(aValue: string) : iModelEntidadesInterfacesPacientes; overload;
    function DataNascimento: TDateTime; overload;
    function Idade: integer; overload;
    function Telefone: string; overload;
    function Email: string; overload;
    function Plano_Saude: string; overload;
    function DataSet: IModelDataSet;
    function Padrao: iModelEntidadesInterfacesPadrao<iModelEntidadesInterfacesPacientes>;
    function DataSource(aValue: TDataSource): iModelEntidadesInterfacesPacientes; 
    function Grid : iModelEntidadesInterfacesPacientes; 
    function todos : iModelEntidadesInterfacesPacientes; 
    procedure DAO;
  end;

implementation

end.
