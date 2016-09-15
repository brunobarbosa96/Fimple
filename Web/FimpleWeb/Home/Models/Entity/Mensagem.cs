using System;

namespace Home.Models.Entity
{
    public class Mensagem
    {
        public int Id { get; set; }
        public string Conteudo { get; set; }
        public DateTime DataEnvio { get; set; }
        public DateTime? DataRecebimento { get; set; }
        public Conversa Conversa { get; set; }
        public Usuario UsuarioEnvio { get; set; }
    }
}