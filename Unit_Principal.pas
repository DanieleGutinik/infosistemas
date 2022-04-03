unit Unit_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtDlgs, uFormat, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Datasnap.DBClient;

type
  TForm_cliente = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit_nome: TEdit;
    Edit_cpf: TEdit;
    Edit_rg: TEdit;
    Edit_email: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_CEP: TEdit;
    Edit_numero: TEdit;
    Edit_bairro: TEdit;
    Edit_logradouro: TEdit;
    Edit_complemento: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit_cidade: TEdit;
    Edit_pais: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    btn_novo: TBitBtn;
    btn_salva: TBitBtn;
    btn_fechar: TBitBtn;
    btn_consultar: TBitBtn;
    SaveDialog1: TSaveDialog;
    Edit_arquivo: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    cd_temp: TClientDataSet;
    cd_tempnome: TStringField;
    cd_temprg: TStringField;
    cd_tempcpf: TStringField;
    cd_tempemail: TStringField;
    cd_tempcep: TStringField;
    cd_templogradouro: TStringField;
    cd_tempnumero: TStringField;
    cd_tempcomplemento: TStringField;
    cd_tempbairro: TStringField;
    cd_tempcidade: TStringField;
    cd_temppais: TStringField;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_CEPExit(Sender: TObject);
    procedure ConsultarCEP(cep: string);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_salvaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cliente: TForm_cliente;
  caminho : string;

implementation

{$R *.dfm}

procedure TForm_cliente.btn_consultarClick(Sender: TObject);
begin
  RESTRequest1.Resource := SomenteNumero(Edit_CEP.Text) + '/json';
  RESTRequest1.Execute;

  if RESTRequest1.Response.StatusCode = 200 then
  begin
    if RESTRequest1.Response.Content.Indexof('erro') > 0 then
       ShowMessage('CEP não encontrado')

    else
    begin
      with FDMemTable1 do
      begin
        Edit_CEP.Text := FieldByName('Cep').AsString;
        Edit_bairro.Text :=  FieldByName('bairro').AsString;
        Edit_logradouro.Text := FieldByName('logradouro').AsString;
        Edit_complemento.Text :=  FieldByName('complemento').AsString;
        Edit_cidade.Text := FieldByName('localidade').AsString;
        Edit_pais.Text := 'BRASIL';
      end;

    end;

  end;

end;

procedure TForm_cliente.btn_fecharClick(Sender: TObject);
begin
  cd_temp.close;
  close;
end;

procedure TForm_cliente.Edit_CEPExit(Sender: TObject);
begin
  if SomenteNumero(Edit_CEP.Text) <> '' then
      consultarCEP(Edit_CEP.Text);
end;

procedure TForm_cliente.btn_novoClick(Sender: TObject);
begin

  caminho := Edit_arquivo.Text;
  cd_temp.CreateDataSet;


 { dados_clientes [0] := Edit_nome.Text;
  dados_clientes [1] := Edit_rg.Text;
  dados_clientes [2] := Edit_cpf.text;
  dados_clientes [3] := Edit_email.Text;
  dados_clientes [4] := Edit_CEP.Text;
  dados_clientes [5] := Edit_logradouro.Text;
  dados_clientes [6] := Edit_numero.text;
  dados_clientes [7] := Edit_bairro.Text;
  dados_clientes [8] := Edit_complemento.Text;
  dados_clientes [9] := Edit_cidade.text;
  dados_clientes [10] := Edit_pais.Text;
  }
end;

procedure TForm_cliente.btn_salvaClick(Sender: TObject);
begin


  cd_temp.Open;
  cd_temp.Append;
  cd_temp.FieldByName('nome').AsString := Edit_nome.Text;
  cd_temp.FieldByName('rg').AsString := Edit_nome.Text;
  cd_temp.FieldByName('cpf').AsString := Edit_nome.Text;
  cd_temp.FieldByName('email').AsString := Edit_nome.Text;
  cd_temp.FieldByName('cep').AsString := Edit_nome.Text;
  cd_temp.FieldByName('logradouro').AsString := Edit_nome.Text;
  cd_temp.FieldByName('numero').AsString := Edit_nome.Text;
  cd_temp.FieldByName('complemento').AsString := Edit_nome.Text;
  cd_temp.FieldByName('bairro').AsString := Edit_nome.Text;
  cd_temp.FieldByName('cidade').AsString := Edit_nome.Text;
  cd_temp.FieldByName('pais').AsString := Edit_nome.Text;
  cd_temp.Post;


  // salva tabela temporaria na memoria
  cd_temp.SaveToFile('caminho');
  //carrega o arquvo . xml para memoria
  cd_temp.LoadFromFile('caminho');

end;

procedure TForm_cliente.ConsultarCEP(cep: string);
begin
  if SomenteNumero(Edit_CEP.text).Length <> 8 then
  begin
    showMessage('CEP Inválido');
    exit;
  end;
end;

procedure TForm_cliente.FormCreate(Sender: TObject);
begin

  ShowMessage('Crie um diretorio para salvar um arquivo.');

  SaveDialog1.Execute;
  Edit_arquivo.text:= SaveDialog1.FileName;

  showMessage('Clique no botão novo para inserir as informações.');


end;

end.
