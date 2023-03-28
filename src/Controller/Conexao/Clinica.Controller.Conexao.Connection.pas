unit Clinica.Controller.Conexao.Connection;
interface

uses
  Clinica.Model.Conexao.Interfaces,
  Clinica.Controller.Conexao.Interfaces;

type
  TControllerConexaoConectar = class(TInterfacedObject, iControllerFactoryConexao)
  private
    
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerFactoryConexao;
    function Conectar: iModelConnection;
  end;

implementation

uses
  System.SysUtils, 
  Vcl.Forms,
  Clinica.Model.Conexao.Connection;

function TControllerConexaoConectar.Conectar: iModelConnection;
var
  BANCO_DE_DADOS: string;
begin
  BANCO_DE_DADOS := ExtractFilePath(Application.ExeName) + 'DATABASETESTES.FDB';
  result := TModelConexaoConnection.new
              .paramentros
              .DataBase(BANCO_DE_DADOS)
              .UserName('SYSDBA')
              .Password('masterkey')
              .DriverId('FB')
              .Server('localhost')
              .Porta('3050')
              .&End       
              .Conectar;                  
end;

constructor TControllerConexaoConectar.Create;
begin

end;

destructor TControllerConexaoConectar.Destroy;
begin
  inherited;

end;

class function TControllerConexaoConectar.New: iControllerFactoryConexao;
begin
  result := self.Create;
end;

end.                                                                                   
