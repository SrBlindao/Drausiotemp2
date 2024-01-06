using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using AcessoBancoDados;
using ObjetoTransferencia;
using System.Data;

namespace Negocios
{
    public class PedidoNegocios
    {
        AcessoDadosSqlServer acessoDados = new AcessoDadosSqlServer();

        //Inserir
        public string Inserir (Pedido pedido)
        {
            try
            {
                acessoDados.LimparParametros();
                acessoDados.AdicionarParametros("@IDOPeracao", pedido.Operacao.IDOperacao);

                acessoDados.AdicionarParametros("IDSituacao", pedido.Situacao.IDSituacao);

                acessoDados.AdicionarParametros("Emitente", pedido.Emitente.IDPessoa);

                acessoDados.AdicionarParametros("Destinatario", pedido.Destinatario.IDPessoa);

                string idPedido = acessoDados.ExecutarManipulacao(CommandType.StoredProcedure, "uspPedidoInserir").ToString();

                return idPedido;
            }

            catch(Exception exception)
            {
                return exception.Message;
            }
        }
    }
}
