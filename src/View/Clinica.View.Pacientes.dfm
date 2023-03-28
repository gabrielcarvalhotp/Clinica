inherited FrmCadPacientes: TFrmCadPacientes
  Caption = 'FrmCadPacientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    inherited pnlHeader: TPanel
      inherited Label1: TLabel
        Width = 314
        Caption = 'Cadastro de Pacientes'
        ExplicitWidth = 314
      end
    end
    inherited pnlGrid: TPanel
      inherited CardPanel: TCardPanel
        ActiveCard = CardCadastro
        inherited CardPesquisa: TCard
          inherited DBGridPesquisa: TDBGrid
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CODIGO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_PACIENTE'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_NASCIMENTO'
                Width = 191
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IDADE'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFONE'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 219
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PLANO_SAUDE'
                Width = 143
                Visible = True
              end>
          end
        end
        inherited CardCadastro: TCard
          object Label3: TLabel [0]
            Left = 12
            Top = 16
            Width = 10
            Height = 13
            Caption = 'Id'
          end
          object Label5: TLabel [1]
            Left = 98
            Top = 16
            Width = 70
            Height = 13
            Caption = 'Data Cadastro'
          end
          object Label6: TLabel [2]
            Left = 204
            Top = 16
            Width = 81
            Height = 13
            Caption = 'Data Atualiza'#231#227'o'
          end
          object Label4: TLabel [3]
            Left = 12
            Top = 56
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object Label7: TLabel [4]
            Left = 168
            Top = 56
            Width = 96
            Height = 13
            Caption = 'Data de Nascimento'
          end
          object Label8: TLabel [5]
            Left = 274
            Top = 56
            Width = 28
            Height = 13
            Caption = 'Idade'
          end
          object Label9: TLabel [6]
            Left = 12
            Top = 97
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object Label10: TLabel [7]
            Left = 12
            Top = 136
            Width = 24
            Height = 13
            Caption = 'Email'
          end
          object Label11: TLabel [8]
            Left = 12
            Top = 177
            Width = 74
            Height = 13
            Caption = 'Plano de Sa'#250'de'
          end
          object edId: TEdit
            Left = 12
            Top = 30
            Width = 80
            Height = 21
            Color = clGray
            ReadOnly = True
            TabOrder = 1
          end
          object edDataCadastro: TDateTimePicker
            Left = 98
            Top = 30
            Width = 100
            Height = 21
            Date = 44999.000000000000000000
            Time = 0.831715763888496400
            Enabled = False
            TabOrder = 2
          end
          object edDataAtualizacao: TDateTimePicker
            Left = 204
            Top = 30
            Width = 100
            Height = 21
            Date = 44999.000000000000000000
            Time = 0.831715763888496400
            Enabled = False
            TabOrder = 3
          end
          object edNome: TEdit
            Left = 12
            Top = 70
            Width = 150
            Height = 21
            TabOrder = 4
          end
          object edDataNascimento: TDateTimePicker
            Left = 168
            Top = 70
            Width = 100
            Height = 21
            Date = 44999.000000000000000000
            Time = 0.831715763888496400
            TabOrder = 5
            OnExit = edDataNascimentoExit
          end
          object edIdade: TEdit
            Left = 274
            Top = 70
            Width = 80
            Height = 21
            Color = clGray
            ReadOnly = True
            TabOrder = 6
          end
          object edTelefone: TEdit
            Left = 12
            Top = 110
            Width = 150
            Height = 21
            TabOrder = 7
          end
          object edEmail: TEdit
            Left = 12
            Top = 150
            Width = 150
            Height = 21
            TabOrder = 8
          end
          object CBPlanoSaude: TComboBox
            Left = 12
            Top = 192
            Width = 150
            Height = 21
            ItemIndex = 0
            TabOrder = 9
            Text = 'UNIMED'
            Items.Strings = (
              'UNIMED'
              'PARTICULAR')
          end
        end
      end
    end
  end
end
