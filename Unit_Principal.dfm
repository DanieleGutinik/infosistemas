object Form_cliente: TForm_cliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 516
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 303
    Top = 338
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 516
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 199
      Width = 753
      Height = 266
      Caption = '  Endere'#231'o:  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 432
        Top = 107
        Width = 133
        Height = 23
        Caption = 'Complemento'
      end
      object Label6: TLabel
        Left = 16
        Top = 105
        Width = 110
        Height = 23
        Caption = 'Logradouro'
      end
      object Label7: TLabel
        Left = 16
        Top = 35
        Width = 37
        Height = 23
        Caption = 'CEP'
      end
      object Label8: TLabel
        Left = 295
        Top = 103
        Width = 76
        Height = 23
        Caption = 'Numero'
      end
      object Label9: TLabel
        Left = 16
        Top = 195
        Width = 58
        Height = 23
        Caption = 'Bairro'
      end
      object Label11: TLabel
        Left = 295
        Top = 203
        Width = 71
        Height = 23
        Caption = 'Cidade '
      end
      object Label12: TLabel
        Left = 505
        Top = 195
        Width = 39
        Height = 23
        Caption = 'Pais'
      end
      object Edit_CEP: TEdit
        Left = 16
        Top = 64
        Width = 273
        Height = 31
        MaxLength = 8
        TabOrder = 0
        TextHint = '       Informe um CEP'
        OnExit = Edit_CEPExit
      end
      object Edit_numero: TEdit
        Left = 295
        Top = 132
        Width = 114
        Height = 31
        MaxLength = 5
        TabOrder = 1
      end
      object Edit_bairro: TEdit
        Left = 16
        Top = 224
        Width = 273
        Height = 31
        MaxLength = 20
        TabOrder = 2
      end
      object Edit_logradouro: TEdit
        Left = 16
        Top = 134
        Width = 273
        Height = 31
        MaxLength = 20
        TabOrder = 3
      end
      object Edit_complemento: TEdit
        Left = 437
        Top = 136
        Width = 313
        Height = 31
        MaxLength = 20
        TabOrder = 4
      end
      object Edit_cidade: TEdit
        Left = 295
        Top = 224
        Width = 178
        Height = 31
        MaxLength = 20
        TabOrder = 5
      end
      object Edit_pais: TEdit
        Left = 505
        Top = 224
        Width = 240
        Height = 31
        MaxLength = 20
        TabOrder = 6
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 40
      Width = 753
      Height = 145
      Caption = '  Dados Pessoais:  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 56
        Height = 23
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 16
        Top = 81
        Width = 28
        Height = 23
        Caption = 'RG'
      end
      object Label3: TLabel
        Left = 206
        Top = 81
        Width = 36
        Height = 23
        Caption = 'CPF'
      end
      object Label4: TLabel
        Left = 446
        Top = 81
        Width = 53
        Height = 23
        Caption = 'Email'
      end
      object Edit_nome: TEdit
        Left = 16
        Top = 48
        Width = 729
        Height = 31
        MaxLength = 30
        TabOrder = 0
        TextHint = 'Clique no Bot'#227'o Novo para inserir informa'#231#245'es'
      end
      object Edit_cpf: TEdit
        Left = 202
        Top = 103
        Width = 225
        Height = 31
        MaxLength = 20
        TabOrder = 1
      end
      object Edit_rg: TEdit
        Left = 16
        Top = 103
        Width = 180
        Height = 31
        MaxLength = 20
        TabOrder = 2
      end
      object Edit_email: TEdit
        Left = 433
        Top = 103
        Width = 299
        Height = 31
        MaxLength = 30
        TabOrder = 3
      end
    end
    object btn_novo: TBitBtn
      Left = 486
      Top = 471
      Width = 75
      Height = 41
      Caption = 'Novo'
      TabOrder = 2
      OnClick = btn_novoClick
    end
    object btn_salva: TBitBtn
      Left = 585
      Top = 471
      Width = 75
      Height = 41
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btn_salvaClick
    end
    object btn_fechar: TBitBtn
      Left = 678
      Top = 471
      Width = 75
      Height = 41
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = btn_fecharClick
    end
    object btn_consultar: TBitBtn
      Left = 303
      Top = 263
      Width = 106
      Height = 33
      Caption = 'Consultar '
      TabOrder = 5
      OnClick = btn_consultarClick
    end
    object Edit_arquivo: TEdit
      Left = 248
      Top = 13
      Width = 259
      Height = 21
      TabOrder = 6
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'cliente.xml'
    Left = 512
    Top = 8
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 472
    Top = 224
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Resource = '01001000/json/'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 544
    Top = 224
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 608
    Top = 224
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 400
    Top = 216
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 296
    Top = 216
  end
  object cd_temp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 239
    object cd_tempnome: TStringField
      FieldName = 'nome'
    end
    object cd_temprg: TStringField
      FieldName = 'rg'
    end
    object cd_tempcpf: TStringField
      FieldName = 'cpf'
    end
    object cd_tempemail: TStringField
      FieldName = 'email'
    end
    object cd_tempcep: TStringField
      FieldName = 'cep'
    end
    object cd_templogradouro: TStringField
      FieldName = 'logradouro'
    end
    object cd_tempnumero: TStringField
      FieldName = 'numero'
    end
    object cd_tempcomplemento: TStringField
      FieldName = 'complemento'
    end
    object cd_tempbairro: TStringField
      FieldName = 'bairro'
    end
    object cd_tempcidade: TStringField
      FieldName = 'cidade'
    end
    object cd_temppais: TStringField
      FieldName = 'pais'
    end
  end
end
