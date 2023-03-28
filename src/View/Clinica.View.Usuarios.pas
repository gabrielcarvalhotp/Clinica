unit Clinica.View.Usuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages, 
  System.SysUtils, 
  System.Variants, 
  System.Classes, 
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms, 
  Vcl.Dialogs, 
  Clinica.View.CadPadrao, 
  Data.DB, 
  Vcl.Grids, 
  Vcl.DBGrids, 
  Vcl.StdCtrls,
  Vcl.Buttons, 
  Vcl.WinXPanels, 
  Vcl.ExtCtrls, 
  Vcl.ComCtrls,
  Clinica.Model.Entidades.Interfaces.Usuarios;
  
type
  TFrmCadUsuarios = class(TFrmCadPadrao)
    Label3: TLabel;
    edId: TEdit;
    Label4: TLabel;
    edNome: TEdit;
    Label5: TLabel;
    edDataAtualizacao: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    edSenha: TEdit;
    edDataCadastro: TDateTimePicker;
    BitBtnPermicoes: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnDaletarClick(Sender: TObject);
    procedure BitBtnInserirClick(Sender: TObject);
    procedure BitBtnAlterarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnPermicoesClick(Sender: TObject);
  private
    { Private declarations }
    FUsuarios : iModelEntidadesInterfacesUsuarios;
  public
    { Public declarations }
  end;

implementation

uses
  Clinica.Controller.Entidades.Usuarios,
  System.UITypes, Clinica.View.Permicoes;

{$R *.dfm}

procedure TFrmCadUsuarios.BitBtnAlterarClick(Sender: TObject);
begin
  inherited;
  FUsuarios.Todos;
  edId.text :=  FUsuarios.DataSet.FieldByName('ID_USUARIOS');
  edNome.Text := FUsuarios.DataSet.FieldByName('NOME');
  edSenha.Text := FUsuarios.DataSet.FieldByName('SENHA');
  edDataCadastro.DateTime := FUsuarios.DataSet.FieldByName('DATA_CADASTRO');
  edDataAtualizacao.DateTime := now;
end;

procedure TFrmCadUsuarios.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Cancelar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    abort;
  FUsuarios.Grid;
end;

procedure TFrmCadUsuarios.BitBtnDaletarClick(Sender: TObject);
begin
  inherited;
   if MessageDlg('Deseja Deletar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Abort;
   DataSource1.DataSet.Delete;
end;

procedure TFrmCadUsuarios.BitBtnInserirClick(Sender: TObject);
begin
  inherited;
  FUsuarios.Todos;
  edNome.Text := '';
  edSenha.Text := '';
  edId.text := '-1';
  edDataCadastro.DateTime := now;
  edDataAtualizacao.DateTime := StrToDateTime('01/01/1899 00:00:00');
end;

procedure TFrmCadUsuarios.BitBtnPermicoesClick(Sender: TObject);
var
  FrmCadPermicoes : TFrmCadPermicoes;
begin
  inherited;
  FrmCadPermicoes := TFrmCadPermicoes.Create(nil);
  try
    FrmCadPermicoes.Sql(FUsuarios.DataSet.FieldByName('CODIGO'));
    FrmCadPermicoes.edId.Text := FUsuarios.DataSet.FieldByName('CODIGO');
    FrmCadPermicoes.edNome.Text := FUsuarios.DataSet.FieldByName('NOME');
    FrmCadPermicoes.ShowModal;
  finally
    FrmCadPermicoes.DisposeOf;
  end;
end;

procedure TFrmCadUsuarios.BitBtnSalvarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    abort;
  FUsuarios
    .Padrao.Id(edId.Text)
    .Nome(edNome.Text)
    .Data_Cadastro(edDataCadastro.Date)
    .Data_Alteracao(edDataAtualizacao.Date)
    .Usuario_Alteracao(TControllerEntidadesUsuarios.New.UsuarioLogado.Padrao.Id)
    .&End 
    .Senha(edSenha.Text)
    .DAO;
         
  DataSource1.DataSet.Refresh;
  DBGridPesquisa.Refresh;
  FUsuarios.Grid;
  inherited;
end;

procedure TFrmCadUsuarios.FormCreate(Sender: TObject);
begin
  FUsuarios := TControllerEntidadesUsuarios.New.CriarUsuario;
  FUsuarios.DataSource(DataSource1);
  inherited;
end;

end.
