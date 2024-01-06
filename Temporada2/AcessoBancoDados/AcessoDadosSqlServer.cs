using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using AcessoBancoDados.Properties;

namespace AcessoBancoDados
{
    public class AcessoDadosSqlServer
    {
        //Criar a conexao
        private SqlConnection CriarConexao()
        {
            return new SqlConnection(Settings.Default.stringConexao);
        }

        //Paramentros que vao para o banco
        private SqlParameterCollection sqlParameterCollection = new SqlCommand().Parameters;

        public void LimparParametros()
        {
            sqlParameterCollection.Clear();
        }

        public void AdicionarParametros(string nomeParametro, object valorParametro)
        {
            sqlParameterCollection.Add(new SqlParameter(nomeParametro, valorParametro));
        }

        //Persistencia - inserir, alterar, exluir
        public object ExecutarManipulacao(CommandType commandType, string nomeStoredProcedureOuTextoSql)
        {
            //Tratamento de erro
            try
            {
                //Criar a conexao
                SqlConnection sqlConnection = CriarConexao();
                //Abrir conexao
                sqlConnection.Open();
                //Criar o comando que vai levar a informacao para o banco
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                //Colocando as coisas dentro do comando (dentro da caixa que vai trafegar na conexao)
                sqlCommand.CommandType = commandType;
                sqlCommand.CommandText = nomeStoredProcedureOuTextoSql;
                sqlCommand.CommandTimeout = 500; //Em segundos
                //Adicionar os paramentros no comando
                foreach (SqlParameter sqlParameter in sqlParameterCollection)
                {
                    sqlCommand.Parameters.Add(new SqlParameter(sqlParameter.ParameterName, sqlParameter.Value));
                }
                //Executar o comando, ou seja, mandar o comando ir ate o banco de dados
                return sqlCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

        //Consultar registros do banco de dados
        public DataTable ExecutarConsulta(CommandType commandType, string nomeStoredProcedureOuTextoSql)
        {
            try
            {
                //Criar a conexao
                SqlConnection sqlConnection = CriarConexao();
                //Abrir conexao
                sqlConnection.Open();
                //Criar o comando que vai levar a informacao para o banco
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                //Colocando as coisas dentro do comando (dentro da caixa que vai trafegar na conexao)
                sqlCommand.CommandType = commandType;
                sqlCommand.CommandText = nomeStoredProcedureOuTextoSql;
                sqlCommand.CommandTimeout = 500; //Em segundos
                //Adicionar os paramentros no comando
                foreach (SqlParameter sqlParameter in sqlParameterCollection)
                {
                    sqlCommand.Parameters.Add(new SqlParameter(sqlParameter.ParameterName, sqlParameter.Value));
                }
                //Criar um adaptador
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                //Datatable = Tabela de dados vazia onde vou colocar os dados que vem do banco
                DataTable dataTable = new DataTable();
                //Mandar o comando ir ate o banco buscar os dados e o adaptador preencher o datatable
                sqlDataAdapter.Fill(dataTable);

                return dataTable;

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
    }
}
    

